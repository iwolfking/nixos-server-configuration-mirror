{
  services.qbittorrent = {
    service.image = "ghcr.io/hotio/qbittorrent";
    service.volumes = [ "/mnt/server_data/data/qbittorrent/config/qBitorrent:/config" "/mnt/server_data/downloads:/downloads" ];
    service.ports = [ "8888:8888" "8118:8118" "42100:42100" ];
    service.environment = {
      PUID = "1000";
      PGID = "1000";
      UMASK = "002";
      TZ = "America/Chicago";
      VPN_ENABLED = "true";
      VPN_LAN_NETWORK = "192.168.0.0/24";
      VPN_CONF = "wg0";
      

    }
    service.restart = "unless-stopped";
    service.environment.PUID = "1000";
    service.environment.PGID = "1000";
    service.environment.UMASK = "002";
    service.environment.TZ = "America/Chicago";
    service.environment.VPN_ENABLED = "yes";
    service.environment.VPN_TYPE = "openvpn";
    service.environment.LAN_NETWORK = "192.168.0.0/24,10.10.0.0/24";
    service.environment.ADDITIONAL_PORTS = "42100";
    service.capabilities = {
      NET_ADMIN = true;
    };
  };
}
