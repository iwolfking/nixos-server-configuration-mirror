{
  services.audiobookshelf = {
    service.image = "ghcr.io/advplyr/audiobookshelf:latest";
    service.volumes = ["/mnt/server_data/media/audiobooks:/audiobooks" "/mnt/server_data/media/podcasts:/podcasts" "/mnt/server_data/data/audiobookshelf/config:/config" "/mnt/server_data/data/audiobookshelf/metadata:/metadata"];
    service.ports = ["13378:80"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
  };
  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.1.0/24";
          }];
      };
    };
  };
}
