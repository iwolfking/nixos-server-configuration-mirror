{
  services.jellyseerr = {
    service.image = "fallenbagel/jellyseerr:latest";
    service.volumes = ["/mnt/server_data/data/jellyseerr/:/app/config"];
    service.ports = ["5055:5055"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
}
