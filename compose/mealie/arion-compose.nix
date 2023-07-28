{
  services.mealie = {
    service.image = "hkotel/mealie:latest";
    service.volumes = ["/mnt/server_data/data/mealie/:/app/data"];
    service.ports = ["9925:80"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.PUID = "1000";
    service.environment.PGID = "1000";
    service.environment.RECIPE_PUBLIC = "true";
    service.environment.RECIPE_SHOW_NUTRITION = "true";
    service.environment.RECIPE_SHOW_ASSETS = "true";
    service.environment.RECIPE_LANDSCAPE_VIEW = "true";
    service.environment.DISABLE_COMMENTS = "false";
    service.environment.DISABLE_AMOUNT = "false";
  };
}
