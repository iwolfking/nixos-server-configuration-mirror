{
  services.cloudflareddns = {
    service.image = "timothyjmiller/cloudflare-ddns:latest";
    service.volumes = ["/mnt/server_data/data/cloudflare-ddns/config.json:/config.json"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.network_mode = "host";
  };
}
