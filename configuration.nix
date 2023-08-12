# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, self, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  networking.hostName = "gray-bort"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  nix.settings = {
    sandbox = lib.mkForce "relaxed";
    experimental-features = [ "nix-command" "flakes" ];
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.iwolfking = {
    isNormalUser = true;
    description = "Kyle Robertson";
    extraGroups = [ "networkmanager" "wheel" "podman" "docker"];
    packages = with pkgs; [];
  };

  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.spice-vdagentd.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    cloudflared
    cifs-utils
    git
    wget
    curl
    unrar
    glances #performance monitoring
    helix #text editor
    arion #nix docker manager
    ranger #terminal file manager
  ];

  #Docker Compose Management
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = false;
  virtualisation.podman.dockerCompat = false;
  virtualisation.arion = {
    backend = "docker";
  };

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


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.allowSFTP = true;
  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user
      hosts allow = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      server_data = {
        path = "/mnt/server_data";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "iwolfking";
        "force group" = "users";
      };
    };
  };

   age.secrets."caddy/environment.env" = {
    file = "${self}/secrets/caddy/environment.env.age";
  };

  services.caddy = {
  enable = true;
  package = (pkgs.callPackage ./packages/caddy/default.nix {
    plugins = [
      "github.com/caddy-dns/cloudflare"
    ];
  });
  #configFile = "/mnt/server_data/data/caddy/Caddyfile";
  globalConfig = ''
    acme_dns cloudflare {$CLOUDFLARE_TOKEN}
  '';
  virtualHosts."search.iwolfking.xyz".extraConfig = ''
        reverse_proxy http://192.168.0.134:8085
  '';
  };


networking.firewall.allowedTCPPorts = [ 80 443 61208];
networking.firewall.allowedUDPPorts = [ 80 443 61208];

systemd.services.caddy.serviceConfig = {
  AmbientCapabilities = "cap_net_bind_service";
  CapabilityBoundingSet = "cap_net_bind_service";
  EnvironmentFile = config.age.secrets."caddy/environment.env".path;
};
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
