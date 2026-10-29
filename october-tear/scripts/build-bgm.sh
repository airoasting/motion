#!/bin/zsh
# Build the 30s soundtrack: assets/bgm.mp3
#   0.00-5.29  정적: 먼 새소리 + 초침 + 라이저 (효과음으로 만든 고요)
#   5.29       찢김: 종이 찢는 소리 + 서브 임팩트 + 음악 진입 (hg-18 다운비트 17.16s)
#  5.29-26.60  음악: HeyGen hg-18 원곡 17.16s~38.46s (12마디, 136bpm), -14 LUFS
#  26.60-30.0  정적: 음악 하드 컷, 28.0s에 초침 한 번
set -e
cd "${0:A:h}/.."
S=assets/sfx-candidates
M=assets/bgm-candidates/hg-18.mp3
mkdir -p .work assets/sfx

# 1) music slice, loudness-normalized on its own so the quiet intro stays quiet
ffmpeg -y -loglevel error -ss 17.15 -t 21.31 -i $M \
  -af "loudnorm=I=-14:TP=-1.0:LRA=9,afade=t=in:d=0.008,afade=t=out:st=21.29:d=0.02" -ar 48000 -ac 2 .work/music.wav

# 2) final mix
ffmpeg -y -loglevel error \
  -i .work/music.wav \
  -i $S/birds-1.mp3 \
  -stream_loop 1 -i $S/tick-2.mp3 \
  -i $S/riser-1.mp3 \
  -i $S/tear-1.mp3 \
  -i $S/impact-2.mp3 \
  -i $S/tick-2.mp3 \
  -filter_complex "
  [0:a]adelay=5290|5290[mus];
  [1:a]atrim=0:5.29,asetpts=N/SR/TB,volume=0.22,afade=t=in:d=1.2,afade=t=out:st=5.2:d=0.09[bird];
  [2:a]atrim=0:5.29,asetpts=N/SR/TB,volume=0.45,afade=t=out:st=5.2:d=0.09[tick];
  [3:a]volume=0.55,adelay=2770|2770[rise];
  [4:a]volume=0.9,adelay=4910|4910[tear];
  [5:a]atrim=0:1.8,asetpts=N/SR/TB,volume=0.5,afade=t=out:st=1.2:d=0.6,adelay=5020|5020[imp];
  [6:a]atrim=0.97:1.6,asetpts=N/SR/TB,volume=0.6,adelay=28000|28000[last];
  [mus][bird][tick][rise][tear][imp][last]amix=inputs=7:normalize=0:duration=longest,apad,atrim=0:30,alimiter=limit=0.95[out]" \
  -map "[out]" -ar 48000 -ac 2 -b:a 256k assets/bgm.mp3

ffprobe -v error -show_entries format=duration -of csv=p=0 assets/bgm.mp3
