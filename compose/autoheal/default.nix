
{ self, config, ... }:
{
  age.secrets."autoheal/environment.env" = {
    file = "${self}/secrets/autoheal/environment.env.age";
  };

  virtualisation.arion.projects.autoheal.settings = {
    imports = [
      (import ./arion-compose.nix {
        autohealEnvironment = config.age.secrets."autoheal/environment.env".path;  
      })
    ];
  };
}