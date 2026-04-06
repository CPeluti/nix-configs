{self, inputs, ...}: {
  flake.nixosModules.homelabConfiguration = {config, lib, pkgs, modulesPath, ...}: {
    imports =
      [ # Include the results of the hardware scan.
        self.nixosModules.homelabHardware
      ];

    services.dockerRegistry = {
      enable = true;
      listenAddress = "0.0.0.0";
      port = 5000;
      storagePath = "/var/lib/registry";	
    };
    
    # sudo systemctl start nat
    fileSystems."/mnt/hdinterno" = {
      device = "/dev/disk/by-uuid/6ec3633f-6ab8-4c46-a78e-66b15fecfee2";
      fsType = "ext4";
      options = [ "nofail" ];
    };
    #fileSystems."/mnt/hdexterno" = {
    #  device = "";
    #  fsType = "ext4";
    #}
    networking.nat.enable = false;
    networking.nat.externalInterface = "enp3s0";
    networking.firewall.enable = false;
    networking.firewall.allowedTCPPorts = [ 80 443 6443 5000 8080 8085 51820 8384 22000 33435 45455 8083];
    networking.firewall.allowedUDPPorts = [ 80 443 51820 21027 8080 8085 22000 45455 8083];

      # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "homelab"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    systemd.tmpfiles.rules = [
      "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
    ];
    virtualisation.docker.logDriver = "json-file";

    services.openiscsi = {
      enable = true;
      name = "iqn.2016-04.com.open-iscsi:homelab-0";
    };

    users.users.caio = {
      isNormalUser = true;
      description = "Caio";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
      shell = lib.getExe pkgs.zsh;
    };

boot.kernel.sysctl = {
  "net.ipv4.ip_unprivileged_port_start" = 80;
	};

    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      guiAddress = "0.0.0.0:8384";
      user = "caio";
      dataDir = "/home/caio";  # default location for new folders
      configDir = "/home/caio/.config/syncthing";
      # Optional: GUI credentials (can be set in the browser instead)
      settings = {
        gui = {
          user = "myuser";
          password = "mypassword";
        };
        devices = {
          "pc" = { id = "MTOWOOL-HNVA3RP-GSFXAON-HAZ5KOY-RXSEB2H-347WL7M-GSJNGTZ-5GTYGQQ"; };
          "notebook" = {id = "RFEGPOR-K3TMT4U-QNU3TMG-2AUPNIL-FWEX6W4-EUORWFZ-UQGSU4R-RE7PLQH";};
        };
        folders = {
          "livros" = {
            path = "/mnt/hdinterno/books";
            devices = [ "pc" "notebook" ];
          };
    "calibre-library" = {
            path = "/mnt/hdinterno/calibre";
            devices = [ "pc" "notebook"];
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      vim
      wget
      git
      direnv
    ];
    # Enable the OpenSSH daemon.

    services.openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        GatewayPorts = "yes";
        AllowTcpForwarding = "yes";
        AllowUsers = null;
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
            ClientAliveInterval = 60;   # ping every 60s
              ClientAliveCountMax = 3;    # drop after ~3 misses
      };
    };

    services.logind.settings.Login = {
      HandleLidSwitch="ignore";
      HandleLidSwitchExternalPower="ignore";
      HandleLidSwitchDocked="ignore";
    };
    system.stateVersion = "25.11"; # Did you read the comment?

  };
}
