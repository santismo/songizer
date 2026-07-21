#!/bin/zsh
set -euo pipefail

suite_dir="$(cd "$(dirname "$0")" && pwd)"
suite_version="2.0.1"
if [[ -f "$suite_dir/VERSION" ]]; then
  suite_version="$(tr -d '\n' < "$suite_dir/VERSION")"
fi
components_dir="$HOME/Library/Audio/Plug-Ins/Components"
archive_root="$HOME/Library/Application Support/Songizer/Development Archive/$(date +%Y%m%d-%H%M%S)"
repeatizer_dir="$HOME/Library/Application Support/Songizer/Repeatizer"
repeatizer_app="$repeatizer_dir/Repeatizer.app"

components=(
  "Chordizer.component"
  "Fretizer.component"
  "Midizer.component"
  "Visualizer.component"
  "Voicizer.component"
)

families=(Chordizer Fretizer Midizer Repeatizer Visualizer Voicizer)
archived_count=0

archive_item() {
  local source_path="$1"
  local category="$2"
  local preferred_name="$3"
  local destination_dir="$archive_root/$category"
  local destination_path="$destination_dir/$preferred_name"

  [[ -e "$source_path" ]] || return 0
  mkdir -p "$destination_dir"
  if [[ -e "$destination_path" ]]; then
    destination_path="$destination_dir/${preferred_name:r}-previous-$archived_count.${preferred_name:e}"
  fi
  mv "$source_path" "$destination_path"
  archived_count=$((archived_count + 1))
}

mkdir -p "$components_dir"
for installed_bundle in "$components_dir"/*.component(N); do
  bundle_name="${installed_bundle:t}"
  for family in "${families[@]}"; do
    if [[ "$bundle_name" == "$family"* ]]; then
      archive_item "$installed_bundle" "Components" "$bundle_name"
      break
    fi
  done
done

old_container="$HOME/Library/Application Support/Songizer Suite/AUv3"
archive_item "$old_container" "Application Support" "Songizer Suite AUv3"
archive_item "$repeatizer_dir" "Application Support" "Repeatizer"
archive_item "$HOME/Applications/Repeatizer.app" "Applications" "Repeatizer.app"

system_repeatizer="/Applications/Repeatizer.app"
if [[ -e "$system_repeatizer" ]]; then
  if [[ -w "/Applications" ]]; then
    archive_item "$system_repeatizer" "Applications" "Repeatizer-system.app"
  else
    print "Note: /Applications/Repeatizer.app could not be archived without administrator access."
  fi
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

repeatizer_source="$suite_dir/Plug-Ins/Repeatizer.app"
if [[ ! -d "$repeatizer_source" ]]; then
  print -u2 "Missing bundled Repeatizer host: Repeatizer.app"
  exit 1
fi

mkdir -p "$repeatizer_dir"
/usr/bin/ditto "$repeatizer_source" "$repeatizer_app"
/usr/bin/xattr -dr com.apple.quarantine "$repeatizer_app" 2>/dev/null || true
/usr/bin/codesign --verify --deep --strict "$repeatizer_app"
/usr/bin/pluginkit -a "$repeatizer_app"

/usr/bin/killall -9 AudioComponentRegistrar 2>/dev/null || true

print "Songizer Suite $suite_version installed:"
for component in "${components[@]}"; do
  print "  ${component:r}"
done
print "  Repeatizer"
if (( archived_count > 0 )); then
  print "Previous and development copies were preserved at:"
  print "  $archive_root"
fi
print "Restart Logic Pro before opening the plug-ins."
