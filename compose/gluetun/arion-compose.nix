{gluetunEnvironment, ...}:
{
  services.gluetun = {
    service.image = "qmcgaw/gluetun:latest";
    service.volumes = ["/mnt/server_data/data/gluetun/:/gluetun"];
    service.ports = ["8888:8888" "8388:8388" "8080:8080" "6881:6881" "6881:6881/udp"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.VPN_SERVICE_PROVIDER = "windscribe";
    service.environment.VPN_TYPE = "wireguard";
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
    service.network_mode = "service:gluetun";
  };
}
