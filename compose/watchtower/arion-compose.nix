{
  services.watchtower = {
    service.image = "containrrr:watchtower";
    service.volumes = ["/var/run/docker.sock:/var/run/docker.sock"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.WATCHTOWER_CLEANUP = "true";
    service.environment.WATCHTOWER_LABEL_ENABLE = "true";
  };
  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.31.0/24";
          }];
      };
    };
  };
}
