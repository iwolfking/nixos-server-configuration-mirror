
{ self, config, ... }:
{
  virtualisation.arion.projects.authelia.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      extraConfig = ''
        (trusted_proxy_list) {
          trusted_proxies 192.168.0.0/16
        }
      '';
      virtualHosts."auth.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:9099
      '';
      virtualHosts."secure.iwolfking.xyz".extraConfig = ''
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
        }

        reverse_proxy 192.168.0.18:61208 
      '';
  };

  networking.firewall = {
    allowedTCPPorts = [
      9099
    ];
    allowedUDPPorts = [
      9099
    ];
  };
}