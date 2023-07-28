
{ self, config, ... }:
{
  virtualisation.arion.projects.radarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."radarr.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:9022
        }
        respond 403
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    9022
  ];
  allowedUDPPorts = [
    9022
  ];
  };
}