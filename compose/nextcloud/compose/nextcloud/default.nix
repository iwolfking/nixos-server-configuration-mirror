
{ self, config, ... }:
{
  age.secrets."nextcloud/environment.env" = {
    file = "${self}/secrets/nextcloud/environment.env.age";
  };
  
  virtualisation.arion.projects.nextcloud.settings = {
    imports = [
      (import ./arion-compose.nix {
        nextcloudEnvironment = config.age.secrets."nextcloud/environment.env".path;
      })
    ];
  };

  services.caddy = {
      virtualHosts."cloud.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:9091
      '';
  };
}