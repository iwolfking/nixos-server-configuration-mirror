
{ self, config, ... }:
{
  virtualisation.arion.projects.lidarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."lidarr.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:9023
        }
        respond 403
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    9023
  ];
  allowedUDPPorts = [
    9023
  ];
};
}