{self, inputs, ...}: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = {pkgs, lib, self', ...}: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        cursor = {
          xcursor-theme = "Bibata-Modern-Ice";
          xcursor-size = 24;
        };
        input = {
          trackball = {
            scroll-method = "on-button-down";
            scroll-button = 276;
            scroll-button-lock = {};
          };
          mouse = {
            accel-profile = "flat";
          };
          keyboard = {
            xkb.layout = "us";
            xkb.variant = "altgr-intl";
          };
          focus-follows-mouse = {};
        };
        prefer-no-csd = {};
        hotkey-overlay.skip-at-startup = {};
        outputs = {
          "DP-1" = {
            mode = "2560x1440@155.000";
            position = _: {
              props = {
                x = 0;
                y = 0;
              };
            };
          };
          "HDMI-A-1" = {
            position = _: {
              props = {
                x = 2560;
                y = 0;
              };
            };
          };
        };
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;



        layout.gaps = 16;

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+Q".close-window = {};
          "Mod+SPACE".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          "XF86AudioMute".spawn-sh =        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute".spawn-sh =     "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          "XF86AudioPlay".spawn-sh = "playerctl play-pause";
          "XF86AudioStop".spawn-sh = "playerctl stop";
          "XF86AudioPrev".spawn-sh = "playerctl previous";
          "XF86AudioNext".spawn-sh = "playerctl next";

          "XF86MonBrightnessUp".spawn = "brightnessctl --class=backlight set +10%";
          "XF86MonBrightnessDown".spawn = "brightnessctl --class=backlight set 10%-";

          "Mod+O".toggle-overview = {};


          "Mod+Left".focus-column-left = {};
          "Mod+Down".focus-window-down = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Right".focus-column-right = {};
          "Mod+H".focus-column-left = {};
          "Mod+J".focus-window-down = {};
          "Mod+K".focus-window-up = {};
          "Mod+L".focus-column-right = {};

          "Mod+Ctrl+Left".move-column-left = {};
          "Mod+Ctrl+Down".move-window-down = {};
          "Mod+Ctrl+Up".move-window-up = {};
          "Mod+Ctrl+Right".move-column-right = {};
          "Mod+Ctrl+H".move-column-left = {};
          "Mod+Ctrl+J".move-window-down = {};
          "Mod+Ctrl+K".move-window-up = {};
          "Mod+Ctrl+L".move-column-right = {};

          # // Mod+J     { focus-window-or-workspace-down; }
          # // Mod+K     { focus-window-or-workspace-up; }
          # // Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
          # // Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }

          "Mod+Shift+Left".focus-monitor-left = {};
          "Mod+Shift+Down".focus-monitor-down = {};
          "Mod+Shift+Up".focus-monitor-up = {};
          "Mod+Shift+Right".focus-monitor-right = {};
          "Mod+Shift+H".focus-monitor-left = {};
          "Mod+Shift+J".focus-monitor-down = {};
          "Mod+Shift+K".focus-monitor-up = {};
          "Mod+Shift+L".focus-monitor-right = {};

          "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = {};
          "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = {};
          "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = {};
          "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = {};
          "Mod+Shift+Ctrl+H".move-column-to-monitor-left = {};
          "Mod+Shift+Ctrl+J".move-column-to-monitor-down = {};
          "Mod+Shift+Ctrl+K".move-column-to-monitor-up = {};
          "Mod+Shift+Ctrl+L".move-column-to-monitor-right = {};

          "Mod+U".focus-workspace-down = {};
          "Mod+I".focus-workspace-up = {};
          "Mod+Ctrl+U".move-column-to-workspace-down = {};
          "Mod+Ctrl+I".move-column-to-workspace-up = {};

          "Mod+Shift+U".move-workspace-down = {};
          "Mod+Shift+I".move-workspace-up = {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+Ctrl+1".move-column-to-workspace = 1;
          "Mod+Ctrl+2".move-column-to-workspace = 2;
          "Mod+Ctrl+3".move-column-to-workspace = 3;
          "Mod+Ctrl+4".move-column-to-workspace = 4;
          "Mod+Ctrl+5".move-column-to-workspace = 5;
          "Mod+Ctrl+6".move-column-to-workspace = 6;
          "Mod+Ctrl+7".move-column-to-workspace = 7;
          "Mod+Ctrl+8".move-column-to-workspace = 8;
          "Mod+Ctrl+9".move-column-to-workspace = 9;

          "Mod+BracketLeft".consume-or-expel-window-left = {};
          "Mod+BracketRight".consume-or-expel-window-right = {};

          "Mod+Comma".consume-window-into-column = {};
          "Mod+Period".expel-window-from-column = {};

          "Mod+R".switch-preset-column-width = {};
          "Mod+Shift+R".switch-preset-window-height = {};
          "Mod+Ctrl+R".reset-window-height = {};
          "Mod+F".maximize-column = {};
          "Mod+Shift+F".fullscreen-window = {};

          "Mod+M".maximize-window-to-edges = {};

          "Mod+Ctrl+F".expand-column-to-available-width = {};

          "Mod+C".center-column = {};

          "Mod+Ctrl+C".center-visible-columns = {};

          "Mod+V".toggle-window-floating = {};
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};

          # Mod+W { toggle-column-tabbed-display; }

          "Mod+Shift+S".screenshot={};
          "Ctrl+Print".screenshot-screen={};
          "Alt+Print".screenshot-window={};


          "Mod+Shift+E".quit = {};
          "Ctrl+Alt+Delete".quit = {};

          "Mod+Shift+P".power-off-monitors = {};
        };
      };
    };
  };
}
