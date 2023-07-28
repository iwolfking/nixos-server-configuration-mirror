
{ self, config, ... }:
{
  virtualisation.arion.projects = {
    jellyfin.settings = {
      imports = [
        (import ./arion-compose.nix)
      ]; 
    };
  };
}