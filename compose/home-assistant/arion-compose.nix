{
  services.homeassistant = {
    service.image = "homeassistant/home-assistant:stable";
    service.volumes = ["/mnt/server_data/data/home-assistant/:/config"];
    service.network_mode = "host";
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };
}
