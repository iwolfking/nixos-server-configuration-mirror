
{ self, config, ... }:
{
  age.secrets."paperless/environment.env" = {
    file = "${self}/secrets/paperless/environment.env.age";
  };
  
  virtualisation.arion.projects.paperless.settings = {
    imports = [
      (import ./arion-compose.nix {
        paperlessEnvironment = config.age.secrets."paperless/environment.env".path;
      })
    ];
  };
}