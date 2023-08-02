{gluetunEnvironment, gluetunOVPNConfig, ...}:
{
  services.gluetun = {
    service.image = "qmcgaw/gluetun:latest";
    service.volumes = ["/mnt/server_data/data/gluetun/:/gluetun" "/run/agenix/gluetun/:/run/agenix/gluetun/"];
    service.ports = ["8888:8888" "8388:8388" "8080:8080" "6881:6881" "6881:6881/udp"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.VPN_SERVICE_PROVIDER = "custom";
    service.environment.VPN_TYPE = "openvpn";
    service.environment.OPENVPN_CUSTOM_CONFIG= gluetunOVPNConfig;
    service.capabilities = {
      NET_ADMIN = true;
    };
    service.env_file = [ gluetunEnvironment ];
    service.devices = ["/dev/net/tun:/dev/net/tun"];
    service.labels = {
      "autoheal" = "true";
    };
  };


  services.qbittorrent = {
    service.image = "lscr.io/linuxserver/qbittorrent:latest";
    service.environment.PUID = "1000";
    service.environment.PGID = "1000";
    service.environment.TZ = "America/Chicago";
    service.environment.WEBUI_PORT = "8080";
    service.volumes = ["/mnt/server_data/data/qbittorrent/config/qBitorrent:/config" "/mnt/server_data/downloads:/downloads"];
    service.restart = "unless-stopped";
    service.healthcheck = {
      test = ["CMD-SHELL" "curl -sf https://example.com || exit 1"];
      interval = "1m";
      retries = 1;
      start_period = "5s";
      timeout = "10s";
    };
    service.labels = {
      "autoheal" = "true";
    };
    service.network_mode = "service:gluetun";
  };
}
