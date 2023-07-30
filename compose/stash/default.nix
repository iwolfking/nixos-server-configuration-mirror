
{ self, config, ... }:
{
  virtualisation.arion.projects.stash.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."stash.iwolfking.xyz".extraConfig = ''
        @whitelist {
          remote_ip 192.168.0.0/16
        }
        handle @whitelist {
          reverse_proxy http://192.168.0.18:9999
        }
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
          import trusted_proxy_list
        }

        reverse_proxy 192.168.0.18:9999 {
          import trusted_proxy_list
        }
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