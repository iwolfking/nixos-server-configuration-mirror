{
  services.mc-test = {
    service.image = "itzg/minecraft-server:java17-graalvm";
    service.volumes = [ "/var/lib/mc-test:/data" ];
    service.ports = [ "25565:25565" ];
    service.restart = "unless-stopped";
    service.tty = true;
    service.environment = {
      TZ = "America/Chicago";
      EULA = "TRUE";
      VERSION = "1.20.1";
      MOTD = "Wold's Testing Server";
      TYPE = "FORGE";
      FORGE_VERSION = "47.1.3";
      DIFFICULTY = "hard";
      ICON = "https://www.freeiconspng.com/uploads/minecraft-server-icon-4.png";
      OVERRIDE_ICON = "TRUE";
      MAX_PLAYERS = 10;
      ENABLE_COMMAND_BLOCK = "TRUE";
      SPAWN_PROTECTION = 0;
      VIEW_DISTANCE = 8;
      ALLOW_FLIGHT = "TRUE";
      SYNC_CHUNK_WRITES = "TRUE";
      SIMULATION_DISTANCE = 4;
      EXEC_DIRECTLY = "TRUE";
      GUI = "FALSE";
      MEMORY = "6G";
    };
  };
}
