
{ self, config, ... }:
{
  virtualisation.arion.projects.wiki-wv.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."woldsvaults.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:6888
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    6888
  ];
  allowedUDPPorts = [
    6888
  ];
  };
}