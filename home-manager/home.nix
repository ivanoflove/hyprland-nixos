{ hyprland, pkgs, ...}:

{

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
  ];
  
  
  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "23.05";
  
  home.packages = (with pkgs;[

    #User Apps
    celluloid
    bibata-cursors
    vscode
    lollypop
    google-chrome-dev
    librewolf
    yesplaymusic
    aria
    v2ray
    v2raya
    (opera.override { proprietaryCodecs = true; })

    #utils
    kitty
    ranger
    # wlr-randr
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

    
  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
  ]);

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  # xresources.properties = {
    # "Xcursor.size" = 16;
    # "Xft.dpi" = 106;
  # };
  
 
  # git 相关配置
  programs.git = {
    enable = true;
    userName = "ivanoflove";
    userEmail = "1666210663@qq.com";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
