
{ self, config, ... }:
{
  virtualisation.arion.projects.audiobookshelf.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."audiobookshelf.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:13378
      '';
  };
}