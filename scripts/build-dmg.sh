#!/bin/zsh
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
repository_dir="$(cd "$script_dir/.." && pwd)"
version="$(tr -d '\n' < "$repository_dir/VERSION")"
stage_dir="${1:-$repository_dir/release-stage/Songizer Suite}"
output_dir="${2:-$repository_dir/dist}"
output_path="$output_dir/Songizer-Suite-$version-macOS.dmg"

if [[ ! -f "$stage_dir/Install Songizer Suite.command" ]]; then
  print -u2 "Expected a staged installer at: $stage_dir/Install Songizer Suite.command"
  exit 1
fi

required_bundles=(
  "Chordizer.component"
  "Fretizer.component"
  "Midizer.component"
  "Repeatizer.app"
  "Visualizer.component"
  "Voicizer.component"
)

for bundle in "${required_bundles[@]}"; do
  bundle_path="$stage_dir/Plug-Ins/$bundle"
  if [[ ! -d "$bundle_path" ]]; then
    print -u2 "Expected staged Songizer bundle: $bundle_path"
    exit 1
  fi
  /usr/bin/codesign --verify --deep --strict "$bundle_path"
done

mkdir -p "$output_dir"
/usr/bin/hdiutil create -volname "Songizer Suite" -srcfolder "$stage_dir" -ov -format UDZO "$output_path" >&2
print "$output_path"
