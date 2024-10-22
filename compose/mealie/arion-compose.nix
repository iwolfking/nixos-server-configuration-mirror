{
  services.mealie = {
    service.image = "ghcr.io/mealie-recipes/mealie:v1.0.0-RC2";
    service.volumes = ["/mnt/server_data/data/mealie/:/app/data"];
    service.ports = ["9925:9000"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.PUID = "1000";
    service.environment.PGID = "1000";
    service.environment.ALLOW_SIGNUP = "true";
    service.environment.WEB_CONCURRENCY = 1;
    service.environment.BASE_URL = "https://mealie.iwolfking.xyz";
    service.environment.MAX_WORKS = 1;
    service.environment.DISABLE_AMOUNT = "false";
  };
}
