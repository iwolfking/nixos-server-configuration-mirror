{ self, config, ... }:
{


  services.caddy = {
      virtualHosts."woldwiz.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:7777
      '';
      virtualHosts."woldmap.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:3031
      '';
  };


  networking.firewall = {
    allowedTCPPorts = [
      25566 24454 7777 3031 25567
    ];
    allowedUDPPorts = [
      25566 24454 7777 3031 25567
    ];
  };

  services.cron = {
    enable = true;
  };
}
