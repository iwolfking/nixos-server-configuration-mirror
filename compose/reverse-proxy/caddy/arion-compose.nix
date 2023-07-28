{
  services.caddy = {
    service.image = "iarekylew00t/caddy-cloudflare:latest";
    service.volumes = [
      "/mnt/server_data/data/caddy/config/:/config"
      "/mnt/server_data/data/caddy/data/:/data"
      "/mnt/server_data/data/caddy/Caddyfile:/etc/caddy/Caddyfile"
      "/mnt/server_data/data-tmp/caddy/logs:/var/log/caddy"
    ];
    service.ports = ["443:443" "80"];
    service.restart = "unless-stopped";
  };
}
