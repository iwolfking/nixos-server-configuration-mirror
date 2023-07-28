
{ self, config, ... }:
{
  virtualisation.arion.projects.caddy.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}