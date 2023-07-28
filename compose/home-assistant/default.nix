
{ self, config, ... }:
{
  virtualisation.arion.projects.homeassistant.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}