{ pkgs, ... }:

{
  programs.tmux.enable = true;
  programs.tmux.extraConfig = ''
    set -g mouse on
  '';
}
