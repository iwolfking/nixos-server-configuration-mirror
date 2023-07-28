
{ self, config, ... }:
{
  virtualisation.arion.projects.lidarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}