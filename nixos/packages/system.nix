{ pkgs, ... }:

{
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
