# Songizer Suite 2.0.0 release manifest

These are the canonical plug-in identities for Songizer Suite 2.0.0 and future updates.

| Bundle | Bundle identifier | Audio Unit identity | Architecture | Executable SHA-256 |
| --- | --- | --- | --- | --- |
| Chordizer.component | `com.santismo.chordizer.midi` | `aumi / Chrz / StTr` | x86_64 | `e21c37a07f4b57f652a2ed431ef8b1e1fb5353a10915a6210b504b4f34b35763` |
| Fretizer.component | `com.santismo.fretizer` | `aumi / Frtz / StTr` | x86_64 | `57d2791d14e209c9377b99148c1410e02bbf003d8d4f2bf7c1b6f0072ebf5594` |
| Repeatizer.component | `com.santismo.repeatizer.component` | `aumi / Rptz / RPTZ` | x86_64 | `e14037f4248264c3f5f9027e92b2de7b71ef2c0700535de005c594601844ac37` |
| Visualizer.component | `com.vizr.visualizer.logic-suite` | `aufx / VZAS / VIZR`; `aumi / VZMS / VIZR`; `aufx / VZVS / VIZR` | x86_64 + arm64 | `a2e9775692750a85fa899bba57cdde1f46f01fcde1d1e3cfc3083a0ad1ac389f` |
| Voicizer.component | `com.santismo.voicizer` | `aumi / Vocz / StSm` | x86_64 | `ccb0dccca80e020a22d9ff11770065c5e81a764fa8fdde3361c1f6f8d849ea85` |

All bundles report version `2.0.0`, are ad-hoc signed, and pass strict code-signature verification. The installer preserves prior copies in `~/Library/Application Support/Songizer/Development Archive` before installing this canonical set.

DMG SHA-256: `339c3c06770752f459276245b3b2dd3f3a708920a81b68dab0d82ac100a6bae9`
