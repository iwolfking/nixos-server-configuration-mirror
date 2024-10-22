{
  services.bitwarden = {
    service.image = "vaultwarden/server:latest";
    service.volumes = [ "/mnt/server_data/data/vaultwarden/:/data" ];
    service.ports = [ "9445:80" ];
    service.restart = "unless-stopped";
    service.environment = {
      TZ = "America/Chicago";
      WEBSOCKET_ENABLED = "TRUE";
      SIGNUPS_ALLOWED = "FALSE";
      DOMAIN = "https://bitlocker.iwolfking.xyz";
    };
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.66.0/24";
        }];
      };
    };
  };
}
