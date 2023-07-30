
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
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
        }

        reverse_proxy 192.168.0.18:9027 
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