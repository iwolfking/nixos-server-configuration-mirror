{
  services.homarr = {
    service.image = "ghcr.io/ajnart/homarr:latest";
    service.volumes = ["/home/iwolfking/compose/homarr/configs:/app/data/configs" "/home/iwolfking/compose/homarr/icons:/app/public/icons"];
    service.ports = ["3004:7575"];
    service.restart = "unless-stopped";
    service.environment.TZ = "America/Chicago";
    service.healthcheck = {
      test = ["CMD-SHELL" "wget --no-verbose --tries=1 --spider http://localhost:7575 || exit 1"];
      interval = "60s";
      retries = 3;
      start_period = "5s";
      timeout = "10s";
    };
    service.labels = {
      "autoheal" = "true";
    };
  };
}
