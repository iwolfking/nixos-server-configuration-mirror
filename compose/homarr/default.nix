
{ self, config, ... }:
{
  virtualisation.arion.projects.homarr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}