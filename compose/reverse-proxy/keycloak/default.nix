
{ self, config, ... }:
{
  age.secrets."keycloak/environment.env" = {
    file = "${self}/secrets/keycloak/environment.env.age";
  };
  
  virtualisation.arion.projects.keycloak.settings = {
    imports = [
      (import ./arion-compose.nix {
        keycloakEnvironment = config.age.secrets."keycloak/environment.env".path;
      })
    ];
  };

  services.caddy = {
      virtualHosts."login.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:5670
      '';
  };
}