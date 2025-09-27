{ config, pkgs, ... }:

{
  environment.variables = {
    NPM_CONFIG_PREFIX = "${config.users.users.wevtimoteo.home}/.npm-global";
    PATH = "${config.users.users.wevtimoteo.home}/.npm-global/bin:$PATH";
  };
}
