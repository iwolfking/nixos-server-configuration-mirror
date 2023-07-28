
{ self, config, ... }:
{
  virtualisation.arion.projects.pomerium.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
  services.caddy = {
      virtualHosts."pomerium.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:10443
      '';
  };
}