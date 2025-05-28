{ pkgs, config, ... }:

{
  # Enable Zsh
  programs.zsh.enable = true;

  # Set Zsh as the default shell for all users
  users.defaultUserShell = pkgs.zsh;

  # Optional: Add custom configurations for Zsh
  programs.zsh.interactiveShellInit = ''
    export ZSH_THEME="robbyrussell"
    plugins=(git)
  '';
}
