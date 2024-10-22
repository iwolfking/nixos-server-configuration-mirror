{
  services.name = {
    service.image = "image:latest";
    service.volumes = ["/mnt/server_data/data/name/:/config"];
    service.ports = ["4444:8080"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };
}
