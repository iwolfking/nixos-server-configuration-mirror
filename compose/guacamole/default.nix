
{ self, config, ... }:
{
  virtualisation.arion.projects.guacamole.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}