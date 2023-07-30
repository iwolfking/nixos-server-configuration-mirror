
{ self, config, ... }:
{
  virtualisation.arion.projects.stash.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."stash.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:9999
      '';
  };

  networking.firewall = {
    allowedTCPPorts = [
      9999
    ];
    allowedUDPPorts = [
      9999
    ];
  };
}