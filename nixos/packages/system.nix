{ pkgs, ... }:

{
  # Limit the number of generations to retain
  system.build.nixosSystem.generationLimit = 5;
  boot.loader.systemd-boot.configurationLimit = 5;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };


  environment.systemPackages = with pkgs; [
    curl
    docker
    git
    gnupg
    gnumake
    xclip
    wget
  ];
}
