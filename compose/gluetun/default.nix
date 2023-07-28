
{ self, config, ... }:
{
  age.secrets."gluetun/environment.env" = {
    file = "${self}/secrets/gluetun/environment.env.age";
  };

  virtualisation.arion.projects.gluetun.settings = {
    imports = [
      (import ./arion-compose.nix {
        gluetunEnvironment = config.age.secrets."gluetun/environment.env".path;  
      })
    ];
  };
}