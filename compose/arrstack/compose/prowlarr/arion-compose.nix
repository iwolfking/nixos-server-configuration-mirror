{
  services.prowlarr = {
    service.image = "ghcr.io/linuxserver/prowlarr:nightly";
    service.volumes = ["/mnt/server_data/data/prowlarr:/config"];
    service.ports = ["9027:9696"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
}
