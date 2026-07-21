# Songizer Suite 2.0.1 release manifest

Suite 2.0.1 preserves the canonical Chordizer, Fretizer, Midizer, and Repeatizer bundles from Suite 2.0.0. It replaces Voicizer and Visualizer with their validated 2.0.4 releases.

| Bundle | Version | Bundle identifier | Audio Unit identity | Architecture | Audio Unit executable SHA-256 |
| --- | --- | --- | --- | --- | --- |
| Chordizer.component | 2.0.0 | `com.santismo.chordizer.midi` | `aumi / Chrz / StTr` | x86_64 | `c9c0b2a3186a069836bd75a5f1dcb5d13654d73ce57aecd6d82d0c30d19a2cf5` |
| Fretizer.component | 2.0.0 | `com.santismo.fretizer` | `aumi / Frtz / StTr` | x86_64 | `57d2791d14e209c9377b99148c1410e02bbf003d8d4f2bf7c1b6f0072ebf5594` |
| Midizer.component | 2.0.0 | `com.santismo.midizer` | `aumi / MdZr / StTr` | x86_64 | `99dc875c857aec869ed6c83fdfc465afbcd5762244a8b663b11ac36823733e13` |
| Repeatizer.app (invisible AUv3 host) | 2.0.0 | `com.santismo.repeatizer.auv3.extension` | `aumi / Rptz / RPTZ` | x86_64 | `f9580e148860b192fe1b31f2184231d5a8139b925df719eeeec67e6cb1111f51` |
| Visualizer.component | 2.0.4 | `com.vizr.visualizer.logic-suite` | `aufx / VZAS / VIZR`; `aumi / VZMS / VIZR`; `aufx / VZVS / VIZR` | x86_64 + arm64 | `b83d379aa13f898430921053dd29a6bcf9bde0f3aa1bae935e28ae7fd15a75aa` |
| Voicizer.component | 2.0.4 | `com.santismo.voicizer` | `aumi / Vocz / StSm` | x86_64 | `326d1d2ee27272103732e831b6d20f287d4187c58ad4578e02642527cf758b34` |

Every staged bundle passes strict code-signature verification. Voicizer 2.0.4 passes its engine and Chord Bank tests plus Apple AU validation. Visualizer 2.0.4 passes registry lifecycle, naming, compact tap UI, resize-host tests, and Apple AU validation for all three exported Audio Units.

DMG SHA-256: `9fa2475486ead4bbbd289f815ce7d0e682b23ac50a48709b5dc94980ff1538f8`
