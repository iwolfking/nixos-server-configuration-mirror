
{ self, config, ... }:
{
  age.secrets."nextcloud/environment.env" = {
    file = "${self}/secrets/nextcloud/environment.env.age";
  };
  
  virtualisation.arion.projects.onlyoffice.settings = {
    imports = [
      (import ./arion-compose.nix {
        nextcloudEnvironment = config.age.secrets."nextcloud/environment.env".path;
      })
    ];
  };

  services.caddy = {
      virtualHosts."office.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:5665
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    5665
  ];
  allowedUDPPorts = [
    5665
  ];
  };
}