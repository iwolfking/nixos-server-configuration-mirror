
{ self, config, ... }:
{
  virtualisation.arion.projects.guacamole.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."guacamole.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:5890
        }
        respond 403
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    5890
  ];
  allowedUDPPorts = [
    5890
  ];
  };
}