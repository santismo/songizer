# Songizer Suite 2.0.0 release manifest

These are the canonical plug-in identities for Songizer Suite 2.0.0 and future updates.

| Bundle | Bundle identifier | Audio Unit identity | Architecture | Audio Unit executable SHA-256 |
| --- | --- | --- | --- | --- |
| Chordizer.component | `com.santismo.chordizer.midi` | `aumi / Chrz / StTr` | x86_64 | `c9c0b2a3186a069836bd75a5f1dcb5d13654d73ce57aecd6d82d0c30d19a2cf5` |
| Fretizer.component | `com.santismo.fretizer` | `aumi / Frtz / StTr` | x86_64 | `57d2791d14e209c9377b99148c1410e02bbf003d8d4f2bf7c1b6f0072ebf5594` |
| Midizer.component | `com.santismo.midizer` | `aumi / MdZr / StTr` | x86_64 | `99dc875c857aec869ed6c83fdfc465afbcd5762244a8b663b11ac36823733e13` |
| Repeatizer.app (invisible AUv3 host) | `com.santismo.repeatizer.auv3.extension` | `aumi / Rptz / RPTZ` | x86_64 | `f9580e148860b192fe1b31f2184231d5a8139b925df719eeeec67e6cb1111f51` |
| Visualizer.component | `com.vizr.visualizer.logic-suite` | `aufx / VZAS / VIZR`; `aumi / VZMS / VIZR`; `aufx / VZVS / VIZR` | x86_64 + arm64 | `57737a5a00c8f0bf5de7756c86e810858e202af54295d695bd1ef87fd6e314fd` |
| Voicizer.component | `com.santismo.voicizer` | `aumi / Vocz / StSm` | x86_64 | `ccb0dccca80e020a22d9ff11770065c5e81a764fa8fdde3361c1f6f8d849ea85` |

All bundles report version `2.0.0` and pass strict code-signature verification. The five component Audio Units are ad-hoc signed. Repeatizer's required invisible AUv3 host is development signed. The installer preserves prior copies in `~/Library/Application Support/Songizer/Development Archive` before installing this canonical set.

DMG SHA-256: `e60ff8d2e2b984ebb77d9c496c36a928168541d02524dc5316324e4e9080bf62`
