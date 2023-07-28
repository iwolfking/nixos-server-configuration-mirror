{
  services.sonarr = {
    service.image = "lscr.io/linuxserver/sonarr:develop";
    service.volumes = ["/mnt/server_data/data/sonarr/:/config" "/mnt/server_data/downloads/:/downloads" "/mnt/server_data/media/tvshows:/tv" "/mnt/server_data/media/anime:/anime" "/dev/rtc:/dev/rtc"];
    service.ports = ["9021:8989"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };
}
