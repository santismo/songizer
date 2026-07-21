# Songizer Suite 2.0.2 release manifest

Suite 2.0.2 packages the current canonical builds of all six Songizer tools. It updates Repeatizer to 2.0.2 with gate-safe live Tempo CC changes and Voicizer to 2.0.5, while retaining the current Chordizer, Fretizer, Midizer, and Visualizer builds.

| Bundle | Version | Bundle identifier | Audio Unit identity | Architecture | Audio Unit executable SHA-256 |
| --- | --- | --- | --- | --- | --- |
| Chordizer.component | 2.0.0 | `com.santismo.chordizer.midi` | `aumi / Chrz / StTr` | x86_64 | `c9c0b2a3186a069836bd75a5f1dcb5d13654d73ce57aecd6d82d0c30d19a2cf5` |
| Fretizer.component | 2.0.0 | `com.santismo.fretizer` | `aumi / Frtz / StTr` | x86_64 | `57d2791d14e209c9377b99148c1410e02bbf003d8d4f2bf7c1b6f0072ebf5594` |
| Midizer.component | 2.0.0 | `com.santismo.midizer` | `aumi / MdZr / StTr` | x86_64 | `99dc875c857aec869ed6c83fdfc465afbcd5762244a8b663b11ac36823733e13` |
| Repeatizer.app (invisible AUv3 host) | 2.0.2 | `com.santismo.repeatizer.auv3.extension` | `aumi / Rptz / RPTZ` | x86_64 | `cb6c134c20985bd842aec8fdc2af2af6f0f3af07aebe77323793db0ed7cd3d09` |
| Visualizer.component | 2.0.4 | `com.vizr.visualizer.logic-suite` | `aufx / VZAS / VIZR`; `aumi / VZMS / VIZR`; `aufx / VZVS / VIZR` | x86_64 + arm64 | `b83d379aa13f898430921053dd29a6bcf9bde0f3aa1bae935e28ae7fd15a75aa` |
| Voicizer.component | 2.0.5 | `com.santismo.voicizer` | `aumi / Vocz / StSm` | x86_64 | `0f06c7fd7ff98186aeb1bb8e646a37787d6fa38f98862b25678c295da2ebdf80` |

Every staged bundle passes strict code-signature verification. The mounted DMG payload matches the installed canonical binaries, and Apple AU validation passes for all eight exported Audio Units. Repeatizer 2.0.2 also passes its live Tempo CC gate regression, verifying note-off-before-note-on ordering at a retimed repeat boundary.

DMG SHA-256: `bfb185114d6c54cb7bb43b55964914f13fd5ee44a9398cb9a3258eedacac05e5`
