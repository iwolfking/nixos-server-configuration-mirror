{
  services.radarr = {
    service.image = "lscr.io/linuxserver/radarr:latest";
    service.volumes = ["/mnt/server_data/data/radarr/:/config" "/mnt/server_data/downloads/:/downloads" "/mnt/server_data/media/movies:/movies"];
    service.ports = ["9022:7878"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };
}
