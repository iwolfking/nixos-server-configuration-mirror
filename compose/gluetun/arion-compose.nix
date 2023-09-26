{ gluetunEnvironment, gluetunOVPNConfig, ... }:
{
  services.gluetun = {
    service.image = "qmcgaw/gluetun:latest";
    service.volumes = [ "/mnt/server_data/data/gluetun/:/gluetun" "/run/agenix/gluetun/:/run/agenix/gluetun/" ];
    service.ports = [ "8888:8888" "8388:8388" "8080:8080" "6881:6881" "6881:6881/udp" ];
    service.restart = "unless-stopped";
    service.environment.TZ = "Etc/UTC";
    service.environment.VPN_SERVICE_PROVIDER = "custom";
    service.environment.VPN_TYPE = "openvpn";
    service.environment.OPENVPN_CUSTOM_CONFIG = gluetunOVPNConfig;
    service.capabilities = {
      NET_ADMIN = true;
    };
    service.env_file = [ gluetunEnvironment ];
    #service.devices = [ "/dev/net/tun:/dev/net/tun" ];
  };


  services.qbittorrent = {
    service.image = "ghcr.io/hotio/qbittorrent:latest";
    service.environment = {
      PUID = "1000";
      PGID = "1000";
      UMASK = "002";
      TZ = "Etc/UTC";
    };
    service.volumes = [ "/mnt/server_data/data/qbittorrent/config/qBitorrent:/config" "/mnt/server_data/downloads:/downloads" ];
    service.restart = "unless-stopped";
    service.network_mode = "service:gluetun";
  };
}
