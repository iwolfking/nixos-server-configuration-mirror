
{ self, config, ... }:
{
  virtualisation.arion.projects = {
    jellyseerr.settings = {
      imports = [
        (import ./arion-compose.nix)
      ];
    };
  };
}