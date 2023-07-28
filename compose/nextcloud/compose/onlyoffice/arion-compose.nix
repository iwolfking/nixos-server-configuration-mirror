{nextcloudEnvironment, ...}:
{
  services.name = {
    service.image = "onlyoffice/documentserver:latest";
    service.volumes = [
      "/mnt/server_data/data/onlyoffice/:/var/www/onlyoffice/Data"
      "/mnt/server_data/data-tmp/onlyoffice/:/var/log/onlyoffice"
    ];
    service.ports = ["5666:443" "5665:80"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.env_file = [nextcloudEnvironment];
  };
}
