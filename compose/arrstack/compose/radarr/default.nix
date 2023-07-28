
{ self, config, ... }:
{
  virtualisation.arion.projects.radarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}