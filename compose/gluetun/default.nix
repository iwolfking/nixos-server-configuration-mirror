
{ self, config, ... }:
{
  age.secrets."gluetun/environment.env" = {
    file = "${self}/secrets/gluetun/environment.env.age";
  };

  age.secrets."gluetun/windscribe.ovpn" = {
    file = "${self}/secrets/gluetun/windscribe.ovpn.age";
  };

  virtualisation.arion.projects.gluetun.settings = {
    imports = [
      (import ./arion-compose.nix {
        gluetunEnvironment = config.age.secrets."gluetun/environment.env".path;  
        gluetunOVPNConfig = config.age.secrets."gluetun/windscribe.ovpn".path;
      })
    ];
  };

  networking.firewall = {
  allowedTCPPorts = [
    8080 8888 8388 6881 42100
  ];
  allowedUDPPorts = [
    8080 8888 8388 6881 42100
  ];
  };
}