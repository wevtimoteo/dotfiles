{ config, pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker.enable = true;

  users.users.wevtimoteo.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
