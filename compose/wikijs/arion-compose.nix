{
  services.wiki-wv = {
    service.image = "requarks/wiki:2";
    service.volumes = ["/mnt/server_data/data/wikijs-wv/database.sqlite:/wiki/database.sqlite"];
    service.ports = ["6888:3000"];
    service.restart = "unless-stopped";
    service.environment = {
      DB_TYPE = "sqlite";
      DB_FILEPATH = "/wiki/database.sqlite";
    };
  };
  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.80.0/24";
          }];
      };
    };
  };
}
