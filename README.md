# Songizer Suite

Songizer Suite is a collection of Logic Pro music tools for developing ideas by playing, listening, editing, and committing performances. It is not an auto-song generator: a player, a MIDI region, or an audio part starts the musical conversation; the tools help you hear alternatives, shape the result, and keep the parts that matter.

![Songizer Suite workflow map](docs/images/songizer-suite-map.svg)

## One download, five plug-ins for musical decisions

Download **`Songizer-Suite-1.0.0-macOS.dmg`** from the [latest release](https://github.com/santismo/songizer/releases/latest), open it, then double-click **Install Songizer Suite.command**. It installs Chordizer, Voicizer, Fretizer, Midizer, and Visualizer Studio into your user Components folder; existing copies are backed up first.

1. Quit Logic Pro before running the installer.
2. Open the DMG and double-click **Install Songizer Suite.command**.
3. Restart Logic Pro when it finishes.
4. In **Logic Pro > Settings > Plug-in Manager**, enable any component that Logic has disabled.

The release uses ad-hoc signed bundles. If macOS blocks a bundle, reopen the installer from Finder and follow its confirmation prompt. The installer also removes quarantine attributes from the installed copies. **Repeatizer is linked below as a separate AUv3 download**: its current distribution is an app extension inside `Repeatizer.app`, and is intentionally not included in this components-only DMG.

## Included tools

| Tool | Version | What it contributes | Where it lives |
| --- | --- | --- | --- |
| [Repeatizer](https://github.com/santismo/repeatizer) | 1.10.1 | Repeat, swing, and pattern treatment for a phrase you play. | Separate AUv3 download (not in the DMG) |
| [Chordizer](https://github.com/santismo/chordizer) | 0.5.0 | Chord awareness, editable chord regions, and Scalizer/Harmonizer-style harmonic options. | MIDI FX / Audio FX |
| [Voicizer](https://github.com/santismo/LeadVoicer) | 1.1.0 | Voice-led chords and tempo-aware chord performances from your MIDI. | MIDI FX |
| [Fretizer](https://github.com/santismo/fretizer) | 1.2.0 | A display-only guitar map that keeps your MIDI byte-for-byte unchanged. | MIDI FX |
| [Midizer](https://github.com/santismo/midizer) | 1.1.0 | Timing-aware capture and drag-out of the performance that actually reached the end of a MIDI FX chain. | MIDI FX |
| [Visualizer Studio](https://github.com/santismo/visualizer-studio) | 0.6.0 | Master, audio-source, and MIDI-source views in one component bundle. | Audio FX / MIDI FX |

Detailed component placement is in [the suite contents guide](docs/SUITE-CONTENTS.md).

## Ways to make music with the suite

### Play a motif; make it answer itself

Play a short keyboard or guitar-derived MIDI phrase. Put **Repeatizer** early in the chain to create a rhythmic answer, then use **Voicizer** only when you want a note to become a chord. Listen, adjust the density or pattern, and keep playing against the result. **Midizer** sits last so the dragged MIDI contains what you actually heard rather than a pre-transform idea.

### Write harmony from a performance, not a menu

Use **Chordizer** to observe a part you played or imported, correct the chord regions you disagree with, and let its shared harmonic context inform **Voicizer**. Scalizer/Harmonizer features can expose possible relationships, but the player decides the rhythm, register, voicing, substitutions, and final edit. **Fretizer** makes the result immediately legible on the fretboard when guitar playability matters.

### Rehearse an arrangement in real time

Build a light performance chain such as **Repeatizer → Voicizer → Fretizer → Midizer**. Bypass any stage that gets in the way, use the knobs as performance controls, and capture only the takes that feel intentional. This keeps the chain a responsive ensemble rather than a one-click composer.

### Explore rhythm without surrendering the part

Record or draw a simple phrase, then make several passes through **Repeatizer** at different swing, gate, and pattern settings. Drag each pass out with **Midizer**, comp the best bars in Logic, and perform changes on top. The source part remains yours; the tool supplies variation and timing perspective.

### Learn, arrange, and check the whole picture

Use **Fretizer** to see where a voiced chord lands on guitar, **Chordizer** to inspect harmonic movement, and **Visualizer Studio** to watch master spectrum, per-track audio, and MIDI activity while you balance or rehearse. They are feedback tools: they make musical information easier to notice without replacing your judgment.

## Suggested Logic Pro placements

| Goal | Suggested chain | Why |
| --- | --- | --- |
| Play a patterned harmony | Repeatizer → Voicizer → Fretizer → Midizer | Shape a played seed, choose a voicing, check playability, then capture the real result. |
| Compose from chord movement | Chordizer → Voicizer → Midizer | Edit the harmonic map, perform against it, then drag the chosen MIDI take to a track. |
| Keep guitar MIDI honest | Fretizer → Midizer | Fretizer only displays; Midizer captures the unchanged performance. |
| See the arrangement | Visualizer MIDI Source on a MIDI FX slot; Visualizer Audio Source on tracks; Visualizer Studio on Stereo Out | The bundled Visualizer Studio component connects those sources inside Logic. |

Logic routes MIDI FX in order. Put Midizer at the end of a capture chain. Keep the stages you want to hear, and bypass the rest—there is no required “correct” Songizer chain.

## Compatibility and source

Songizer Suite is for macOS and Logic Pro hosts that support Audio Unit MIDI FX and Audio Units. The installer is a convenience package; every product remains independently usable and is linked above. Source and licensing details are available in each linked repository.

The suite source, documentation, and installer script are MIT licensed. The release DMG contains the verified component/app bundles but does not bundle Logic Pro or any instrument content.
