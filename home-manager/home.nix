{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "ivan";
    homeDirectory = "/home/ivan";
  };

  home.packages = (with pkgs; [
    
    #User Apps
    (appimageTools.wrapType2 
      { # or wrapType1
        name = "aliyunpan";
        src = fetchurl {
          url = "https://github.com/gaozhangmin/aliyunpan/releases/download/v3.11.19/XBYDriver-3.11.19-linux-x86_64.AppImage";
          hash = "sha256-LaIqghleQ/k6kZ6DfFYvl3t5oB0tALXg4Z6OFotwhAI=";
        };
      extraPkgs = pkgs: with pkgs; [ ];
    })
    celluloid
    discord
    librewolf
    cool-retro-term
    bibata-cursors
    vscode
    lollypop
    lutris
    openrgb
    betterdiscord-installer
    firefox
    kitty
    google-chrome-dev
    qq

    #utils
    ranger
    wlr-randr
    git
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol

    #misc 
    cava
    neovim
    nano
    rofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    exa
    btop
    udiskie

  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
  ]);

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";

   # git 相关配置
  programs.git = {
    enable = true;
    userName = "ivanoflove";
    userEmail = "1666210663@qq.com";
  };
  
}
