{
  services.stash = {
    service.stash = "stashapp/stash:latest";
    service.volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/mnt/server_data/data/stash/:/root/.stash"
      "/mnt/server_data/media/stash/data:/data"
      "/mnt/server_data/media/stash/metadata:/metadata"
      "/mnt/server_data/data-tmp/stash/cache:/cache"
      "/mnt/server_data/media/stash/blobs:/blobs"
      "/mnt/server_data/media/stash/generated:/generated"
    ];
    service.ports = ["9999:9999"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.STASH_STASH = "/data/";
    service.environment.STASH_GENERATED = "/generated/";
    service.environment.STASH_METADATA = "/metadata/";
    service.environment.STASH_CACHE = "/cache/";
    service.environment.STASH_PORT = "9999";
  };
}
