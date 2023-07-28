
{ self, config, ... }:
{
    imports = [
      (import ./compose/jellyfin)
      (import ./compose/jellyseerr)
    ];

    services.caddy = {
      virtualHosts."jelly.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:8096
      '';
      virtualHosts."requests.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:5055
      '';

};
}