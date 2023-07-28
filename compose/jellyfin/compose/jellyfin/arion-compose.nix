{
  services.jellyfin = {
    service.image = "jellyfin/jellyfin:latest";
    service.volumes = ["/mnt/server_data/data-unsynced/jellyfin/cache:/cache" "/mnt/server_data/data/jellyfin/config:/config" "/mnt/server_data/media:/media"];
    service.ports = ["8096:8096"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.devices = ["/dev/dri:/dev/dri"];
    #service.group_add = ["44"];
    service.user = "1000:1000";
    service.labels = {
      "autoheal" = "true";
    };
  };
}
