{
  services.lidarr = {
    service.image = "ghcr.io/linuxserver/lidarr:latest";
    service.volumes = [
      "/mnt/server_data/data/lidarr:/config"
      "/mnt/server_data/downloads:/downloads"
      "/mnt/server_data/media/NewMusic:/music"
    ];
    service.ports = ["9023:8686"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
}
