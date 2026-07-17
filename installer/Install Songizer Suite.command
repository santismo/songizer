#!/bin/zsh
set -euo pipefail

suite_dir="$(cd "$(dirname "$0")" && pwd)"
components_dir="$HOME/Library/Audio/Plug-Ins/Components"
repeatizer_container_dir="$HOME/Library/Application Support/Songizer Suite/AUv3"
backup_root="$HOME/Library/Application Support/Songizer Suite/Backups/$(date +%Y%m%d-%H%M%S)"

components=(
  "Chordizer.component"
  "Voicizer.component"
  "Fretizer.component"
  "Midizer.component"
  "Visualizer Studio.component"
)

legacy_midicap="$components_dir/MidiCap.component"
if [[ -e "$legacy_midicap" ]]; then
  mkdir -p "$backup_root/Plug-Ins"
  mv "$legacy_midicap" "$backup_root/Plug-Ins/MidiCap.component"
fi

for component in "${components[@]}"; do
  source_bundle="$suite_dir/Plug-Ins/$component"
  destination_bundle="$components_dir/$component"

  if [[ ! -d "$source_bundle" ]]; then
    print -u2 "Missing bundled component: $component"
    exit 1
  fi

  mkdir -p "$components_dir"
  if [[ -e "$destination_bundle" ]]; then
    mkdir -p "$backup_root/Plug-Ins"
    mv "$destination_bundle" "$backup_root/Plug-Ins/$component"
  fi

  /usr/bin/ditto "$source_bundle" "$destination_bundle"
  /usr/bin/xattr -dr com.apple.quarantine "$destination_bundle" 2>/dev/null || true
done

repeatizer_source="$suite_dir/.installer/Repeatizer.app"
repeatizer_destination="$repeatizer_container_dir/Repeatizer.app"

if [[ ! -d "$repeatizer_source" ]]; then
  print -u2 "Missing bundled Repeatizer support files"
  exit 1
fi

mkdir -p "$repeatizer_container_dir"
if [[ -e "$repeatizer_destination" ]]; then
  mkdir -p "$backup_root/AUv3"
  mv "$repeatizer_destination" "$backup_root/AUv3/Repeatizer.app"
fi

/usr/bin/ditto "$repeatizer_source" "$repeatizer_destination"
/usr/bin/xattr -dr com.apple.quarantine "$repeatizer_destination" 2>/dev/null || true
/usr/bin/pluginkit -a "$repeatizer_destination" 2>/dev/null || true

print "Songizer Suite installed."
print "Restart Logic Pro, then enable the installed plug-ins in Plug-in Manager if needed."
print "Previous bundles, when present, were backed up to: $backup_root"
