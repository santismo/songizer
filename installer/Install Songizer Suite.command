#!/bin/zsh
set -euo pipefail

suite_dir="$(cd "$(dirname "$0")" && pwd)"
components_dir="$HOME/Library/Audio/Plug-Ins/Components"
archive_root="$HOME/Library/Application Support/Songizer/Development Archive/$(date +%Y%m%d-%H%M%S)"

components=(
  "Chordizer.component"
  "Fretizer.component"
  "Repeatizer.component"
  "Visualizer.component"
  "Voicizer.component"
)

families=(Chordizer Fretizer Repeatizer Visualizer Voicizer)
archived_count=0

mkdir -p "$components_dir"
for installed_bundle in "$components_dir"/*.component(N); do
  bundle_name="${installed_bundle:t}"
  for family in "${families[@]}"; do
    if [[ "$bundle_name" == "$family"* ]]; then
      mkdir -p "$archive_root/Components"
      archive_name="$bundle_name"
      if [[ -e "$archive_root/Components/$archive_name" ]]; then
        archive_name="${bundle_name:r}-previous-${archived_count}.component"
      fi
      mv "$installed_bundle" "$archive_root/Components/$archive_name"
      archived_count=$((archived_count + 1))
      break
    fi
  done
done

old_container="$HOME/Library/Application Support/Songizer Suite/AUv3"
if [[ -d "$old_container" ]]; then
  mkdir -p "$archive_root/Application Support"
  mv "$old_container" "$archive_root/Application Support/AUv3"
  archived_count=$((archived_count + 1))
fi

for component in "${components[@]}"; do
  source_bundle="$suite_dir/Plug-Ins/$component"
  destination_bundle="$components_dir/$component"

  if [[ ! -d "$source_bundle" ]]; then
    print -u2 "Missing bundled component: $component"
    exit 1
  fi

  /usr/bin/ditto "$source_bundle" "$destination_bundle"
  /usr/bin/xattr -dr com.apple.quarantine "$destination_bundle" 2>/dev/null || true
  /usr/bin/codesign --verify --deep --strict "$destination_bundle"
done

/usr/bin/killall -9 AudioComponentRegistrar 2>/dev/null || true

print "Songizer Suite 2.0.0 installed:"
for component in "${components[@]}"; do
  print "  ${component:r}"
done
if (( archived_count > 0 )); then
  print "Previous and development copies were preserved at:"
  print "  $archive_root"
fi
print "Restart Logic Pro before opening the plug-ins."
