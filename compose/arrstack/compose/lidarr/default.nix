
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
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
        }

        reverse_proxy 192.168.0.18:9023 
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