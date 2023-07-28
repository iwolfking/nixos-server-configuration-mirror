{paperlessEnvironment, ...}:
{
  services.broker = {
    service.image = "docker.io/library/redis:7";
    service.volumes = ["/mnt/server_data/data-tmp/paperless/redis:/data"];
    service.restart = "unless-stopped";
  };

  services.webserver = {
    service.image = "ghcr.io/paperless-ngx/paperless-ngx:latest";
    service.restart = "unless-stopped";
    service.ports = ["8000:8000"];
    service.healthcheck = {
      test = ["CMD" "curl" "-fs" "-S" "--max-time" "2" "http://localhost:8000"];
      interval = "30s";
      timeout = "10s";
      retries = 5;
    };
    service.volumes = [
      "/mnt/server_data/data/paperless/data:/usr/src/paperless/data"
      "/mnt/server_data/data/paperless/media:/usr/src/paperless/media"
      "/mnt/server_data/imports/paperless/consume:/usr/src/paperless/consume"
      "/mnt/server_data/exports/paperless/:/usr/src/paperless/export"
    ];
    service.env_file = [paperlessEnvironment];
    service.environment.PAPERLESS_REDIS = "redis://broker:6379";
  };
}
