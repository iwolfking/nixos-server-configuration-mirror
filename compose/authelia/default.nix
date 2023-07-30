
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
          trusted_proxies 192.168.0.0/16 173.245.48.0/20 103.21.244.0/22 103.22.200.0/22 103.31.4.0/22 141.101.64.0/18 108.162.192.0/18 190.93.240.0/20 188.114.96.0/20 197.234.240.0/22 198.41.128.0/17 162.158.0.0/15 104.16.0.0/13 104.24.0.0/14 172.64.0.0/13 131.0.72.0/22 2400:cb00::/32 2606:4700::/32 2803:f800::/32 2405:b500::/32 2405:8100::/32 2a06:98c0::/29 2c0f:f248::/32
        }
      '';
      virtualHosts."auth.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:9099 {
          import trusted_proxy_list
        }
      '';
      virtualHosts."secure.iwolfking.xyz".extraConfig = ''
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
          import trusted_proxy_list
        }

        reverse_proxy 192.168.0.18:61208 {
          import trusted_proxy_list
        }
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