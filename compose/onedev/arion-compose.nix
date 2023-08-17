{
  services.onedev = {
    service.image = "1dev/server:latest";
    service.volumes = ["/mnt/server_data/data/onedev/:/opt/onedev" "/var/run/docker.sock:/var/run/docker.sock"];
    service.ports = ["6610:6610" "6611:6611"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
    };
  };
}
