{autohealEnvironment, ...}:
{
  services.autoheal = {
    service.image = "willfarrell/autoheal:latest";
    service.volumes = ["/var/run/docker.sock:/var/run/docker.sock"];
    service.restart = "always";
    service.environment.AUTOHEAL_CONTAINER_LABEL = "all";
    service.environment.AUTOHEAL_INTERVAL = "60";
    service.environment.AUTOHEAL_DEFAULT_STOP_TIMEOUT = "10";
    service.env_file = [autohealEnvironment];
  };
}
