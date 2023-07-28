
{ self, config, ... }:
{
  virtualisation.arion.projects.sonarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}