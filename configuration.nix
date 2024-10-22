# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, self, ... }:
{
  #Configure Nix
  nix.settings = {
    sandbox = lib.mkForce "relaxed";
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Standard User
  users.users.iwolfking = {
    isNormalUser = true;
    description = "Kyle Robertson";
    extraGroups = [ "networkmanager" "wheel" "podman" "docker"];
    packages = with pkgs; [];
  };

  #Packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unrar
    helix #text editor
    screen
    micro #basic text editor
    packwiz
    rcon
  ];

  system.stateVersion = "22.11"; # Did you read the comment?

}
