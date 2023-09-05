{ config, lib, pkgs, ... }:



{
  imports = [ 
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [ 
    waybar
    swww
  ];
  
  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = { 
    enable = true; 
    systemdIntegration = true; 
    enableNvidiaPatches = true; 
    # extraConfig = builtins.readFile ./config.nix;
  };

  # home.file.".config/hypr/colors".source = ./colors.nix;
  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
 
  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };
  
  home.file.".config/wallpapers" = {
    source = ../../wallpapers;
    recursive = true;

  }; 
}
