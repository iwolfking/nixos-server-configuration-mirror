
{ self, config, ... }:
{
  virtualisation.arion.projects.watchtower.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}