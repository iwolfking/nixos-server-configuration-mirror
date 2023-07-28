{
  services.pomerium = {
    service.image = "pomerium/pomerium:latest";
    service.volumes = ["/mnt/server_data/data/pomerium/config.yaml:/pomerium/config.yaml"];
    service.ports = ["10443:443"];
    service.restart = "unless-stopped";
  };
}
