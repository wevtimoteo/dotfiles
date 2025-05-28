{ pkgs, ... }:

{
  programs.gnupg = {
    enable = true;

    gpgAgent = {
      enable = true;
      pinentry = "pinentry-gnome3";
      extraConfig = ''
        default-cache-ttl 600
        max-cache-ttl 7200
      '';
    };

    # Optional: Enable SSH support with GPG
    sshSupport = true;
  };
}
