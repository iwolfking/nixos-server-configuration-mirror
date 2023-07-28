
{ self, config, ... }:
{
  virtualisation.arion.projects.prowlarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."prowlarr.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:9027
        }
        respond 403
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    9027
  ];
  allowedUDPPorts = [
    9027
  ];
  };
}