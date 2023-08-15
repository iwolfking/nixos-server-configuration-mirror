
{ self, config, ... }:
{
  virtualisation.arion.projects.flaresolverr.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];
  };

  networking.firewall = {
  allowedTCPPorts = [
    8191
  ];
  allowedUDPPorts = [
    8191
  ];
  };
}