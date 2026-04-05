{self, inputs, ...}: {
  flake.nixosModules.workstationHardware = {config, lib, pkgs, modulesPath, ...}: {
    imports =[
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/6263b887-3bb9-43d3-9ca3-70e6c2f67543";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/A34D-3F73";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    fileSystems."/windows" = {
      device = "/dev/disk/by-uuid/723F-486F";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/69d20af0-5bfa-434f-860e-eb702521a646"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}