
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
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
          import trusted_proxy_list
        }

        reverse_proxy 192.168.0.18:9022 {
          import trusted_proxy_list
        }
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