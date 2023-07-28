
{ self, config, ... }:
{
  virtualisation.arion.projects.cloudflareddns.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };
}