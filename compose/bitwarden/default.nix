{ self, config, ... }:
{
  virtualisation.arion.projects.vaultwarden.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  services.caddy = {
    virtualHosts."bitlocker.iwolfking.xyz".extraConfig = ''
      reverse_proxy http://192.168.0.18:9445
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [
      9445
    ];
    allowedUDPPorts = [
      9445
    ];
  };
}
