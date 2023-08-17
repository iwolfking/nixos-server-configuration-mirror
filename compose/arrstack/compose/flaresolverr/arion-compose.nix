{
  services.flaresolverr = {
    service.image = "ghcr.io/flaresolverr/flaresolverr:latest";
    service.ports = ["8191:8191"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.LOG_LEVEL = "info";
    service.environment.LOG_HTML = "false";
    service.environment.CAPTCHA_SOLVER = "none";
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.30.0/24";
          }];
      };
    };
  };
}
