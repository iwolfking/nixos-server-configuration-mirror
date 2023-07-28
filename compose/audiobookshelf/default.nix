
{ self, config, ... }:
{
  virtualisation.arion.projects.audiobookshelf.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."shelf.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:13378
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
   13378
  ];
  allowedUDPPorts = [
    13378
  ];
  };
}