{ self, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    glances
  ];

  systemd.services.glances = {
    enable = true;
    description = "Glances";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.glances}/bin/glances -w";
      Restart = "on-abort";
      RemainAfterExit = "yes";
    };
  };

  services.caddy = {
    virtualHosts."secure.iwolfking.xyz".extraConfig = ''
        forward_auth 192.168.0.18:9099 {
          uri /api/verify?rd=https://auth.iwolfking.xyz
          copy_headers Remote-User Remote-Groups Remote-Name Remote-Email
          import trusted_proxy_list
        }

        reverse_proxy 192.168.0.18:61208 {
          import trusted_proxy_list
        }
      '';
  };

  networking.firewall.allowedTCPPorts = [ 61208 ];
  networking.firewall.allowedUDPPorts = [ 61208 ];
}