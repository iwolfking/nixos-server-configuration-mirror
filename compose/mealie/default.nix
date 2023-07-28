
{ self, config, ... }:
{
  virtualisation.arion.projects.mealie.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."recipes.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:9925
      '';
  };
}