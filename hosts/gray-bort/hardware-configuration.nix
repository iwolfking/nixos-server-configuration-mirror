# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e554438c-f1c4-41ed-8357-7addc53af78e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EA55-77A5";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/media/nvme2" =
    { device = "/dev/disk/by-uuid/cf84744a-5413-4caa-8903-7b0f2ce30eab";
      fsType = "ext4";
    };

  fileSystems."/media/storage2" =
    { device = "/dev/disk/by-uuid/358e16a3-8796-4c56-87e4-79020e161ad1";
      fsType = "ext4";
    };

  fileSystems."/media/storage1" =
    { device = "/dev/disk/by-uuid/9dd3b1d7-4e40-4840-a881-211aeaf1c39a";
      fsType = "ext4";
    };

  fileSystems."/media/storage4" =
    { device = "/dev/disk/by-uuid/97386852-f7e8-4e8d-b392-ed194aa122ff";
      fsType = "ext4";
    };

  fileSystems."/media/storage3" =
    { device = "/dev/disk/by-uuid/4a31c886-ca75-421c-a89e-ec24c6cc86ff";
      fsType = "ext4";
    };

  swapDevices = [{device = "/var/lib/swapfile"; size = 16*1024;} ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
