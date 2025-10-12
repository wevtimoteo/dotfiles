#!/usr/bin/env zsh
# Color variables
orange="%F{214;202;216}"
green="%F{164;144;187}"
purple="%F{108;86;123}"
reset="%f"

simulate=false

setup_dotfiles() {
  local target_dir=$1
  local prefix_dot=${2:-yes}
  local dot_files_dir=$PWD
  local files=("${@:3}")

  if $simulate; then
    print -P "${orange}\n-- Simulating setup for ${green}$target_dir${purple} (Prefix Dot: ${green}$prefix_dot${purple})${reset}"
  fi

  for filename in "${files[@]}"
  do
    local target_filename=$filename
    if [[ $prefix_dot == "yes" ]]; then
      target_filename=".$filename"
    fi

    local symlink_cmd="ln -sf $dot_files_dir/$filename $target_dir/$target_filename"

    if $simulate; then
      echo "$symlink_cmd"
    else
      if [[ -s $target_dir/$target_filename ]]; then
        if [[ $prefix_dot == "yes" ]]; then
          rm -f "$target_dir/$target_filename"
        else
          rm "$target_dir/$target_filename"
        fi
      fi
      eval "$symlink_cmd"
    fi
  done
}

while (( $# > 0 )); do
  case "$1" in
    --simulate)
      simulate=true
      shift
      ;;
    *)
      break
      ;;
  esac
done

files=(bashrc irbrc alias gitconfig gitignore_global gemrc tigrc exports ackrc pryrc)
setup_dotfiles "$HOME" yes "${files[@]}"

source "$HOME/.exports"

ln -sf "$PWD/git-edit" "$HOME/.local/bin/git-edit"