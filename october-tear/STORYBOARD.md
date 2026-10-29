---
compositionId: october-tear
duration_s: 30.0
canvas: { w: 1920, h: 1080, fps: 30 }
mode: autonomous
message: "10월의 아침은 조용히 오지 않는다"
style:
  font: "Barlow / IBM Plex Mono (preset) · Hangul: Pretendard Variable (assets/fonts/PretendardVariable.ttf, weight 100-900)"
  palette: ["#111111", "#E85D26", "#F0ECE5", "#888880", "#505048"]
assets: false
build_notes:
  - "one paused timeline per frame, seek-safe, no remote assets"
  - "Barlow has no Hangul glyphs: every Korean word is set in Pretendard Variable via @font-face src url('assets/fonts/PretendardVariable.ttf') (path relative to project root). Barlow 900 / IBM Plex Mono only for Latin digits and labels."
  - "Pretendard is variable 100-900: weight is a motion axis (thin = quiet, 900 = torn open)"
  - "Jamo pieces (ㄱ ㅗ ㅇ ㅛ) are plain text glyphs in Pretendard, never images"
  - "Real music hit (tear + first kick) is at track 5.29s; analyzer beat 5.364 lags ~70ms, so the tear frame leads its anchor"
  - "Real music cut to silence is at track 26.60s; frame 5 starts on the missing downbeat 26.68"
avoid:
  - "falling leaves, warm autumn serif, cozy palette"
  - "tiny unreadable hero text"
  - "easing on hard hits"
  - "more than one accent color"
---

# 10월 아침, 고요를 찢다

Arc: 0-4.9s near-silence (birds, clock ticks, riser) → 4.9-6.2s paper-rip + first kick tears the word 고요 into jamo → 6.2-15.5s sustained kick roll, jamo re-assemble into a new word every bar → 15.5-26.7s break, surge, hi-hat rolls, climax → 26.7-30s hard silence, one line.

## Frame 1 — quiet

- src: compositions/frames/01-quiet.html
- duration: 4.946s
- span_sec: [0.0, 4.946]
- pacing: phrase_flow
- mood: [tense, elegant]
- feel: near-silent ambience (distant birds, a clock tick about once per second at 0.02 / 0.99 / 2.01 / 3.01 / 4.0), a riser swelling from ~2.8s, onset desert

### Groups

- **g1** — free_design
  - span_sec: [0.0, 4.946]
  - free_design: { dominant_system: "negative-space-hold of one thin word on cream dawn ground", primitives: ["negative-space-hold", "text-wave-distort"], density_topology: "single mark, rising tension" }
  - anchors: [0.07, 1.068, 2.067, 3.065, 4.063]
  - copy: ["고요", "10.30", "06:47:00"]
  - notes: |
      Ground #F0ECE5 (cream, the only light register; it reads as cold dawn light). Center: "고요" in Pretendard weight 100, about 220px, color #111111, wide letter-spacing, holding dead still.
      Bottom-left label in IBM Plex Mono uppercase 0.14em, #888880: "10.30 · 06:47:00". The seconds digits advance by 0ms swaps on each clock-tick anchor (00 → 01 → 02 → 03 → 04). Bottom-right label "06:47 AM · SEOUL" in #505048.
      Breathing: from 0 to ~2.8s the word is almost motionless (a very slow opacity/tracking breath). From ~2.8s (riser) tension rises: weight creeps 100 → ~350, tracking tightens, a faint 1-2px tremor grows, and a hairline crack (1px #111111 line) begins to draw horizontally through the word from ~4.4s. No hard cuts in this frame.

## Frame 2 — tear

- src: compositions/frames/02-tear.html
- duration: 1.254s
- span_sec: [4.946, 6.2]
- pacing: beat_cut
- mood: [aggressive, glitch]
- feel: paper rip sound peaking at 5.29 into the first kick + sub impact, the regime change from silence to full drums

### Groups

- **g1** — free_design
  - span_sec: [4.946, 6.2]
  - free_design: { dominant_system: "word torn into jamo, system-replace from cream to ink-black", primitives: ["system-replace", "braam-punch", "screen-shake", "flash-cut"], density_topology: "one word → four flying pieces" }
  - anchors: [4.946, 5.364, 5.759, 6.2]
  - copy: ["ㄱ", "ㅗ", "ㅇ", "ㅛ"]
  - notes: |
      4.946: the crack from frame 1 rips open, the cream ground splits along it (top half and bottom half pull apart a few px, torn jagged edge via clip-path polygon).
      The tear lands at track 5.29 (lead the 5.364 anchor by ~70ms): 0ms system-replace to ink-black #111111 ground, one-frame #E85D26 flash-cut, and 고요 shatters into its four jamo ㄱ ㅗ ㅇ ㅛ in Pretendard 900, cream #F0ECE5, each flying outward and rotating, scaled huge (500-700px) so they crop at the frame edges. Screen-shake on 5.364 and 5.759.
      By 6.2 the four jamo sit scattered at the edges, half out of frame, still drifting.

## Frame 3 — drive

- src: compositions/frames/03-drive.html
- duration: 9.311s
- span_sec: [6.2, 15.511]
- pacing: beat_cut
- mood: [aggressive, hype]
- feel: one long sustained kick roll (6.59-15.37), steady 136bpm grid, a downbeat about every 1.77s

### Groups

- **g1** — free_design
  - span_sec: [6.2, 15.511]
  - free_design: { dominant_system: "per-bar jamo assembly: scattered jamo fly in and lock into one big word on each downbeat", primitives: ["kinetic-letter-in", "braam-punch", "palette-flip", "screen-shake", "chromatic-split"], density_topology: "replace per bar, each word bigger and heavier" }
  - anchors: [7.082, 8.847, 10.635, 12.399, 14.187, 15.07]
  - copy: ["차갑다", "숨", "깨어나", "10월", "지금"]
  - notes: |
      Each word is built from jamo pieces that fly in from the frame edges during the ~0.4s before its anchor and LOCK on the anchor (lead the anchor), with a braam-punch (scale 1.08 → 1, weight snaps 600 → 900).
      Word per anchor: 7.082 차갑다 · 8.847 숨 · 10.635 깨어나 · 12.399 10월 · 14.187 지금. The previous word breaks back into jamo and scatters just before the next one assembles (0ms break on the beat before the next anchor).
      Word sizes grow: 차갑다 ~360px, 숨 ~900px (one syllable fills height, cropped), 깨어나 ~420px, 10월 ~520px (digits in Barlow 900, 월 in Pretendard 900), 지금 ~700px.
      Register: ink-black ground with cream type for 차갑다 / 숨; palette-flip (0ms) to fire-orange ground #E85D26 with ink #111111 type on 10.635 (깨어나) and back to ink on 14.187 (지금).
      Texture between downbeats: on the kick roll the locked word jitters 2-4px (screen-shake, low amplitude) and a chromatic-split (orange/cream offset) hits on off-beats. IBM Plex Mono label top-left "06:47:05 →" counting seconds up on each downbeat, label top-right "136 BPM".
      15.07: final kick of the roll, 지금 punches once more.

## Frame 4 — peak

- src: compositions/frames/04-peak.html
- duration: 11.169s
- span_sec: [15.511, 26.68]
- pacing: beat_cut
- mood: [aggressive, hype, glitch]
- feel: short break (sparse, energy dip 16-17s), SURGE at ~17s, hi-hat accel rolls 17.46-18.48 and 18.76-20.69, sustained hi-hat fill 21.04-23.80, final fill 25.26-26.36 into a hard stop

### Groups

- **g1** — free_design
  - span_sec: [15.511, 16.858]
  - free_design: { dominant_system: "negative-space gather: the four original jamo return small and circle the center", primitives: ["negative-space-hold", "staggered-reveal"], density_topology: "empty to four pieces" }
  - anchors: [15.511, 16.393, 16.7]
  - copy: ["ㄱ", "ㅗ", "ㅇ", "ㅛ"]
  - notes: "0ms clear to ink-black. ㄱ ㅗ ㅇ ㅛ (Pretendard 900, #888880, ~120px) drift inward from four corners and tighten toward center; at 16.7 (kick) they snap to orange #E85D26."
- **g2** — free_design
  - span_sec: [16.858, 20.852]
  - free_design: { dominant_system: "word stack slam: all five words pile into a full-frame stacked poster, one line per beat", primitives: ["word-grid-burst", "system-replace", "crash-zoom-in", "screen-shake"], density_topology: "accumulate to full frame" }
  - anchors: [16.858, 17.299, 17.74, 18.181, 18.622, 19.064, 19.505, 19.946, 20.387]
  - copy: ["차갑다", "숨", "깨어나", "10월", "지금"]
  - notes: |
      16.858 SURGE: crash-zoom into a full-frame stack. Lines slam in one per beat (17.299, 17.74, 18.181, 18.622, 19.064), left-aligned, Pretendard 900, cream on ink, tight 0.88 line-height, each line a different size so the stack fills the 1920×1080 frame edge to edge (some lines cropped).
      During the hi-hat accel rolls the newest line flickers weight (900/300) per hi-hat. On 19.505 the whole stack palette-flips to orange ground / ink type; 20.387 one hard shake.
- **g3** — template: `roll-flipbook-word-cycle`
  - span_sec: [20.852, 23.963]
  - params: { bgColor: "#111111", textColor: "#F0ECE5", accentColor: "#E85D26", flipWords: "고요,차갑다,숨,깨어나,10월,지금,아침,새벽,06:47,찢어,소리", resolveText: "아침은", periodChar: "" }
  - role_bindings: { roll: { start: 21.04, end: 23.80 }, resolve: 23.522 }
  - copy: "아침은"
  - notes: "Words are Pretendard 900 (override the template's Helvetica stack). Flip on every 16th of the 21.04-23.80 hi-hat fill; lock on 아침은 near 23.522 and hold."
- **g4** — free_design
  - span_sec: [23.963, 26.68]
  - free_design: { dominant_system: "climax: 고요 reassembled at frame-filling size, then torn apart on every beat", primitives: ["braam-punch", "chromatic-split", "flash-cut", "freeze-hold"], density_topology: "one giant word, fractured per beat" }
  - anchors: [23.963, 24.404, 24.845, 25.287, 25.728, 26.192]
  - copy: ["고요"]
  - notes: |
      23.963: the four jamo slam together into a giant "고요" (Pretendard 900, ~800px, cropped top and bottom), fire-orange #E85D26 on ink.
      Each beat 24.404 / 24.845 / 25.287 / 25.728 tears it further: horizontal slice offsets (3-5 clip-path bands shifting left/right by 20-120px), chromatic split cream/orange, a 1-frame flash.
      Final fill 25.26-26.36: slices jitter every hi-hat. 26.192: one last full-frame orange flash-cut, then freeze-hold the torn state until the frame ends at 26.68 (music has already stopped at ~26.60).

## Frame 5 — still

- src: compositions/frames/05-still.html
- duration: 3.32s
- span_sec: [26.68, 30.0]
- pacing: phrase_flow
- mood: [elegant, tense]
- feel: total silence after a hard stop, one clock tick at ~28.0, then nothing

### Groups

- **g1** — free_design
  - span_sec: [26.68, 30.0]
  - free_design: { dominant_system: "negative-space-hold of the closing line on cream dawn ground", primitives: ["negative-space-hold", "hard-cut"], density_topology: "one line, held" }
  - anchors: [26.68, 28.096]
  - copy: ["10월의 아침은", "조용히 오지 않는다."]
  - notes: |
      26.68: 0ms hard cut back to the cream #F0ECE5 ground of frame 1. Two lines centered, Pretendard weight 300, ~96px, #111111, generous tracking: "10월의 아침은" / "조용히 오지 않는다." Fully visible on the cut, dead still. No fade-in.
      Bottom-left label (same position as frame 1) "10.30 · 06:47:21" in IBM Plex Mono #888880; at the clock tick (~28.0, nearest anchor 28.096; lead slightly) it swaps to "06:47:22" and the final period of 않는다. turns fire-orange #E85D26. Hold to 30.0.
