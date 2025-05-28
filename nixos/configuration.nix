{ config, pkgs, ... }:

{
  imports = [
    ./users/wevtimoteo.nix # User-specific configurations
    ./packages/system.nix  # System-wide packages
    # Modules
    ./modules/fonts.nix
    ./modules/zsh.nix
    ./modules/tmux.nix
    ./modules/tools.nix
  ];

  # Additional top-level configuration
}
