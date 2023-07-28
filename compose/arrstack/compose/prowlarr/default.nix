
{ self, config, ... }:
{
  virtualisation.arion.projects.prowlarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}