
{ self, config, ... }:
{
  virtualisation.arion.projects.authelia.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}