
{ self, config, ... }:
{
  virtualisation.arion.projects.onedev.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
      virtualHosts."onedev.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.18:6610
      '';
  };

  networking.firewall = {
  allowedTCPPorts = [
    6610
  ];
  allowedUDPPorts = [
    6610
  ];
  };
}