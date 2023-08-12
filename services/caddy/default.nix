{ self, config, pkgs, ... }:
{
  age.secrets."caddy/environment.env" = {
    file = "${self}/secrets/caddy/environment.env.age";
  };

  services.caddy = {
    enable = true;
    package = (pkgs.callPackage ../../packages/caddy/default.nix {
    plugins = [
      "github.com/caddy-dns/cloudflare"
      ];
    });
    globalConfig = ''
      acme_dns cloudflare {$CLOUDFLARE_TOKEN}
    '';
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.firewall.allowedUDPPorts = [ 80 443 ];

  systemd.services.caddy.serviceConfig = {
    AmbientCapabilities = "cap_net_bind_service";
    CapabilityBoundingSet = "cap_net_bind_service";
    EnvironmentFile = config.age.secrets."caddy/environment.env".path;
  };
}