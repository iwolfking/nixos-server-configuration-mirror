
{ self, config, ... }:
{
  virtualisation.arion.projects = {
    jellyfin.settings = {
      imports = [
        (import ./arion-compose.nix)
      ]; 
    };
  };

  networking.firewall = {
  allowedTCPPorts = [
    8096
  ];
  allowedUDPPorts = [
    8096
  ];
  };
}