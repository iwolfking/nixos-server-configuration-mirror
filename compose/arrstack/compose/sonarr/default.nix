
{ self, config, ... }:
{
  virtualisation.arion.projects.sonarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."sonarr.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:9021
        }
        respond 403
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    9021
  ];
  allowedUDPPorts = [
    9021
  ];
  };
}