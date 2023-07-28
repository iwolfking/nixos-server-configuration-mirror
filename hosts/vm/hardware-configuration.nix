# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0726eee2-aee2-4298-9826-7e6bd609965a";
      fsType = "ext4";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-014e98c0b50d.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-0e317aee3f27.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-1301a372899f.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-18495243d858.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-21aa96e8b4c2.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-49e4080f29c7.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-4a085a514186.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-56646ab0e35b.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-6d58a093e3ec.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-7557d94e9fae.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-7c07b68ce957.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-7f23725436ea.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-a2be37c518e4.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-b62fcff8645c.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-c04f31e808b9.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-db3aa45cbd71.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-e35d26b8fa4c.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-f08779378d8e.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth3bf5cb1.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth557bdef.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth7445dee.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethcb54383.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethf0ec83c.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}