{
  services.mc-vaults = {
    service.image = "itzg/minecraft-server:java17-graalvm";
    service.volumes = [ "/media/nvme2/VaultHunters:/data" ];
    service.ports = [ "25566:25566" "3031:3031" "25567:25567"];
    service.restart = "unless-stopped";
    service.tty = true;
    service.labels = {
      "autoheal" = "true";
    };
    service.environment = {
      TZ = "America/Chicago";
      EULA = "TRUE";
      VERSION = "1.18.2";
      MOTD = "Passion Project Vault Hunters 3 Server";
      TYPE = "FORGE";
      FORGE_VERSION = "40.2.13";
      DIFFICULTY = "hard";
      OVERRIDE_ICON = "TRUE";
      SERVER_PORT = 25566;
      MAX_PLAYERS = 20;
      ENABLE_COMMAND_BLOCK = "TRUE";
      SPAWN_PROTECTION = 2;
      VIEW_DISTANCE = 7;
      ALLOW_FLIGHT = "TRUE";
      SYNC_CHUNK_WRITES = "FALSE";
      SIMULATION_DISTANCE = 5;
      EXEC_DIRECTLY = "TRUE";
      GUI = "FALSE";
      PVP = "FALSE";
      MEMORY = "22G";
      USE_AIKAR_FLAGS = "TRUE";
    };
  };
}
