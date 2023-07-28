{nextcloudEnvironment, ...}:
{
  services.app = {
    service.image = "nextcloud:latest";
    service.volumes = ["/mnt/server_data/data/nextcloud/data:/var/www/html"];
    service.ports = ["9091:80"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.environment.POSTGRES_HOST = "db";
    service.env_file = [nextcloudEnvironment];
  };

  services.db = {
    service.image = "postgres:13.4";
    service.volumes = ["/mnt/server_data/data/nextcloud/db:/var/lib/postgresql/data"];
    service.restart = "unless-stopped";
    service.env_file = [nextcloudEnvironment];
  };
}
