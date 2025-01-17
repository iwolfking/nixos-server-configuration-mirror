{
  services.mc-test = {
    service.image = "itzg/minecraft-server:java17-graalvm";
    service.volumes = [ "/media/nvme2/AllTheMods9-PP:/data" ];
    service.ports = [ "25565:25565" "3030:3030" ];
    service.restart = "unless-stopped";
    service.tty = true;
    service.labels = {
      "autoheal" = "true";
    };
    service.environment = {
      TZ = "America/Chicago";
      EULA = "TRUE";
      VERSION = "1.20.1";
      MOTD = "Passion Project Discord Server";
      TYPE = "FORGE";
      FORGE_VERSION = "47.2.16";
      DIFFICULTY = "hard";
      OVERRIDE_ICON = "TRUE";
      MAX_PLAYERS = 20;
      ENABLE_COMMAND_BLOCK = "TRUE";
      SPAWN_PROTECTION = 2;
      VIEW_DISTANCE = 7;
      ALLOW_FLIGHT = "TRUE";
      SYNC_CHUNK_WRITES = "TRUE";
      SIMULATION_DISTANCE = 4;
      GUI = "FALSE";
      PVP = "FALSE";
      MEMORY = "6G";
      USE_AIKAR_FLAGS = "TRUE";
      MAX_TICK_TIME = -1;
      ENABLE_AUTOPAUSE = "TRUE";
      AUTOPAUSE_TIMEOUT_EST = 300;
      AUTOPAUSE_TIMEOUT_INIT = 300;
    };
  };
}
