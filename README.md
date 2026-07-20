# Songizer Suite

Songizer Suite is a unified set of five Logic Pro music tools for shaping, understanding, and visualizing performances. Version 2.0.0 establishes the current interfaces and engines as the canonical Songizer release line.

![Songizer Suite workflow map](docs/images/songizer-suite-map.svg)

## Easy installation

Download **`Songizer-Suite-2.0.0-macOS.dmg`** from the [latest release](https://github.com/santismo/songizer/releases/latest), open it, and double-click **Install Songizer Suite.command**.

1. Quit Logic Pro.
2. Open the DMG.
3. Double-click **Install Songizer Suite.command**.
4. Restart Logic Pro.

The installer installs all five Audio Units together. Existing Songizer development copies are moved—not deleted—to a timestamped folder under `~/Library/Application Support/Songizer/Development Archive`.

## Included tools

| Tool | Version | What it contributes | Logic placement |
| --- | --- | --- | --- |
| [Repeatizer](https://github.com/santismo/repeatizer) | 2.0.0 | Full pad and Instrument modes for repeats, patterns, chord rhythm, arpeggiation, swing, and tempo performance. | MIDI FX |
| [Chordizer](https://github.com/santismo/chordizer) | 2.0.0 | Chord regions, scale transformation, harmonization, and register-consistent harmonic mapping. | MIDI FX |
| [Voicizer](https://github.com/santismo/LeadVoicer) | 2.0.0 | Scale-aware voicing styles and a root-independent, probability-weighted Chord Bank. | MIDI FX |
| [Fretizer](https://github.com/santismo/fretizer) | 2.0.0 | Guitar-fretboard visualization that preserves incoming MIDI unchanged. | MIDI FX |
| [Visualizer](https://github.com/santismo/visualizer-studio) | 2.0.0 | Source-native audio and MIDI visualization with per-source transforms, colors, scope trails, and history controls. | Audio FX / MIDI FX |

Detailed component placement is in [the suite contents guide](docs/SUITE-CONTENTS.md). Exact bundle identities and checksums are recorded in the release manifest included with each release.

## Plug-in interfaces

### Repeatizer

![Repeatizer interface](docs/images/plugins/repeatizer-ui.png)

Repeatizer can work as a pad-based rhythm processor or in Instrument mode. Instrument mode turns held notes into timed chord patterns and arpeggios while retaining the complete repeat, style, pattern, variation, dynamics, and tempo-control system.

### Chordizer

![Chordizer interface](docs/images/plugins/chordizer-ui.png)

Chordizer keeps transformed notes near the register being played and uses middle C as the common harmonic reference for scale and harmony performance.

### Voicizer

![Voicizer interface](docs/images/plugins/voicizer-ui.png)

Voicizer includes direct scale chords, arranged voicing styles, and Chord Bank mode. Chord Bank learns qualities such as `m9` independently of their captured root, then applies those formulas to incoming notes according to Input Note Role.

### Fretizer

![Fretizer interface](docs/images/plugins/fretizer-ui.png)

Fretizer provides the suite’s fretboard view and retains its optional visual themes while using the shared Songizer control language.

### Visualizer

Visualizer combines an Audio Source, MIDI Source, and master display in one component. Each source can be shown, hidden, selected, positioned, rotated, sized, and colored independently. Audio views include configurable oscilloscope modes and trails; MIDI views include per-note and gradient color systems.

## Suggested Logic Pro placements

| Goal | Suggested chain | Why |
| --- | --- | --- |
| Pattern a played harmony | Repeatizer → Voicizer → Fretizer | Shape the rhythm, choose the voicing, then inspect guitar playability. |
| Perform from chord movement | Chordizer → Voicizer | Establish harmonic context, then play role-aware voicings. |
| Keep guitar MIDI visible and unchanged | Fretizer | Display notes and shapes without rewriting MIDI. |
| See a session | Visualizer MIDI Source on MIDI tracks; Visualizer Audio Source on audio tracks; Visualizer on Stereo Out | The master view discovers and displays the active sources. |

Logic routes MIDI FX in order. Each Songizer plug-in also works independently; there is no required chain.

## Compatibility and source

Songizer Suite 2.0.0 is for macOS and Logic Pro hosts that support Audio Units and MIDI FX. The DMG contains ad-hoc signed Audio Unit bundles and a recoverable installer. Source and licensing details remain available in the linked product repositories.

The suite documentation and installer are MIT licensed. The release does not include Logic Pro, instruments, or sound content.
