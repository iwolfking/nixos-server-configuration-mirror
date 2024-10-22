{ self, config, ... }:
{
  virtualisation.arion.projects.mc-test.settings = {
    imports = [
      (import ./arion-compose.nix)
    ];

  };

  networking.firewall = {
    allowedTCPPorts = [
      25565
    ];
    allowedUDPPorts = [
      25565
    ];
  };

  services.cron = {
    enable = true;
  };
}
