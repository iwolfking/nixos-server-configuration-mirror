{keycloakEnvironment, ...}:
{
  services.keycloak = {
    service.image = "quay.io/keycloak/keycloak:15.1.0";
    service.volumes = [
      "/mnt/server_data/data/keycloak/deployments:/opt/jboss/keycloak/standalone/deployments"
    ];
    service.ports = ["5670:8080"];
    service.restart = "unless-stopped";
    service.env_file = [keycloakEnvironment];
    service.environment.TZ = "America/Chicago";
    service.environment.DB_VENDOR = "POSTGRES";
    service.environment.DB_ADDR = "keycloak_db";
  };

  services.keycloak_db = {
    service.image = "postgres:14";
    service.volumes = [
      "/mnt/server_data/data/keycloak/db:/var/lib.postgresql/data"
    ];
    service.restart = "unless-stopped";
    service.env_file = [keycloakEnvironment];
  };
}
