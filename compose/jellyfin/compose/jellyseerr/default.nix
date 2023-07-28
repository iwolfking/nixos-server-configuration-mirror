
{ self, config, ... }:
{
  virtualisation.arion.projects = {
    jellyseerr.settings = {
      imports = [
        (import ./arion-compose.nix)
      ];
    };
  };

  networking.firewall = {
  allowedTCPPorts = [
    5055
  ];
  allowedUDPPorts = [
    5055
  ];
  };
}