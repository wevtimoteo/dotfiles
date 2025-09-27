{ pkgs, ... }:

{
  users.users.wevtimoteo = {
    isNormalUser = true;
    description = "Weverton";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      bat
      bitwarden
      brave
      clang                # LLVM C Compiler
      direnv               # For managing environment variables
      eza
      fzf                  # Fuzzy finder for command-line workflows
      gcc                  # GNU Compiler Collection
      gnome-tweaks
      neovim
      obsidian
      telegram-desktop
      tig
      tmux
      pinentry-gnome3
      ripgrep
      slack
      spotify
      starship             # For a modern shell prompt
      vivid                # For colorful directory listings
      ghostty              # Terminal
      wezterm              # Terminal
      whatsapp-for-linux
      zeal
      zig                  # Zig programming language compiler
      zsh
    ];
  };
}
