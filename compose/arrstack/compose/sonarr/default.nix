
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
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
        }

        reverse_proxy 192.168.0.18:9021 
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