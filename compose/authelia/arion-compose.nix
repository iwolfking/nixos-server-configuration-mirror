{
  services.authelia = {
    service.image = "authelia/authelia:latest";
    service.volumes = ["/mnt/server_data/data/authelia/:/config"];
    service.ports = ["9099:9091"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };

  services.redis = {
    service.image = "redis:alpine";
    service.volumes = ["/mnt/server_data/data-tmp/redis-authelia:/data"];
    service.ports = ["6379:6379"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };

  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.3.0/24";
          }];
      };
    };
  };
}
