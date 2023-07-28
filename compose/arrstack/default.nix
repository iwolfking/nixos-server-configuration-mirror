
{ self, config, ... }:
{
    imports = [
      (import ./compose/prowlarr)
      (import ./compose/radarr)
      (import ./compose/sonarr)
      (import ./compose/lidarr)
    ];
}