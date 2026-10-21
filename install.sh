#!/usr/bin/env bash
#
# mochalate -- Yazi installer
#
# Copies the mochalate.yazi flavor directory into Yazi's flavors directory.
#
#   ./install.sh              install the flavor (backs up any existing copy)
#   ./install.sh --uninstall  remove the installed flavor
#   ./install.sh --help       usage

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FLAVOR_DIR="${YAZI_FLAVOR_DIR:-$HOME/.config/yazi/flavors}"

FLAVORS=("mochalate")

bold=''; dim=''; red=''; green=''; yellow=''; reset=''
if [ -t 1 ]; then
  bold=$'\033[1m'; dim=$'\033[2m'; red=$'\033[31m'
  green=$'\033[32m'; yellow=$'\033[33m'; reset=$'\033[0m'
fi

info()  { printf '%s\n' "$*"; }
ok()    { printf '%s✓%s %s\n' "$green" "$reset" "$*"; }
warn()  { printf '%s!%s %s\n' "$yellow" "$reset" "$*" >&2; }
die()   { printf '%s✗%s %s\n' "$red" "$reset" "$*" >&2; exit 1; }

usage() {
  cat <<EOF
${bold}mochalate -- Yazi installer${reset}

Usage: install.sh [options]

Options:
  -u, --uninstall   Remove the installed flavor (and nothing else)
  -f, --force       Overwrite existing flavor without keeping backups
  -h, --help        Show this message

Environment:
  YAZI_FLAVOR_DIR   Install location
                    ${dim}(default: ~/.config/yazi/flavors)${reset}
EOF
}

action='install'
force=0

while [ $# -gt 0 ]; do
  case "$1" in
    -u|--uninstall) action='uninstall' ;;
    -f|--force)     force=1 ;;
    -h|--help)      usage; exit 0 ;;
    *)              usage >&2; die "unknown option: $1" ;;
  esac
  shift
done

if [ "$action" = 'uninstall' ]; then
  found=0
  for name in "${FLAVORS[@]}"; do
    target="$FLAVOR_DIR/${name}.yazi"
    if [ -d "$target" ]; then
      rm -rf "$target"
      ok "Removed $target"
      found=1
    fi
  done
  if [ "$found" -eq 1 ]; then
    info "Flavor removed. Update ~/.config/yazi/theme.toml to stop referencing it."
  else
    info "Nothing to do -- no mochalate flavors are installed."
  fi
  exit 0
fi

mkdir -p "$FLAVOR_DIR"

for name in "${FLAVORS[@]}"; do
  source="$SCRIPT_DIR/${name}.yazi"
  target="$FLAVOR_DIR/${name}.yazi"

  [ -d "$source" ] || die "flavor directory not found: $source"
  [ -f "$source/flavor.toml" ] || die "flavor.toml not found in $source"

  if [ -d "$target" ]; then
    if [ "$force" -eq 1 ]; then
      rm -rf "$target"
    else
      backup="$target.$(date +%Y%m%d%H%M%S).bak"
      mv "$target" "$backup"
      warn "Existing flavor moved to $(basename "$backup")"
    fi
  fi

  cp -R "$source" "$target"
  ok "Installed $target"
done

cat <<EOF

Next, set the flavor in ${bold}~/.config/yazi/theme.toml${reset}:

  ${dim}[flavor]${reset}
  ${dim}dark = "mochalate"${reset}
EOF
