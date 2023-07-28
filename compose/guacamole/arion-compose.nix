{
  services.guacamole = {
    service.image = "jwetzell/guacamole:latest";
    service.volumes = ["/mnt/server_data/data-unsynced/guacamole:/config"];
    service.ports = ["5890:8080"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.healthcheck = {
      test = ["CMD-SHELL" "curl -f http://localhost:8080 || exit 1"];
      interval = "60s";
      timeout = "10s";
      retries = 1;
      start_period = "5s";
    };
    service.labels = {
      "autoheal" = "true";
    };
  };
}
