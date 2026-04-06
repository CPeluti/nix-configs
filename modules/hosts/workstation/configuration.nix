{self, inputs, ...}: {
  flake.nixosModules.workstationConfiguration = {config, lib, pkgs, modulesPath, ...}: {
    imports =
      [ # Include the results of the hardware scan.
        self.nixosModules.workstationHardware
      ];

    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };
    };
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "workstation"; # Define your hostname.

    networking.networkmanager.enable = true;

    time.timeZone = "America/Sao_Paulo";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };

    services.xserver.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    users.users.caio = {
      isNormalUser = true;
      description = "Caio";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = lib.getExe pkgs.zsh;
    };

    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        common.default = [ "gnome" ];
      };
    };

    environment.systemPackages = with pkgs; [
      ghostty
      vscode
      vim
      wget
      git
      bibata-cursors
      direnv
    ];
    environment.variables.EDITOR = "vim";

    system.stateVersion = "25.11"; # Did you read the comment?

  };
}
