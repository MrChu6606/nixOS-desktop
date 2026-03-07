{
  config,
  pkgs,
  unstablePkgs,
  nvfPkg,
  lib,
  ...
}: let
  stable = with pkgs; [
    wget
    git
    rclone
    ripgrep
    tor-browser
    firefox 
    qutebrowser
    mpv
    yt-dlp
    streamlink
    usbutils
    fastfetch
    alacritty
    cmatrix
    cbonsai
    gnumake
    curl
    pastel
    wireshark
    imv
    numix-cursor-theme
    exiftool
    dunst
    evtest
    tealdeer
    btop
    zathura
    dig
    prismlauncher
    unzip
    zip
    vscode
    neovim
    wl-clipboard
    pavucontrol
    brightnessctl
    vesktop
    ffmpeg
    xdg-utils
    localsend
    #pdf stuff
    file
    clamav
    poppler-utils
    kdePackages.okular
    zathura
    #school
    zoom-us
    flameshot
    grim
    imagemagick
    qalculate-qt
    fd
    # blu ray stuff
    vlc
    libbluray
    makemkv
  ];

  unstable = with unstablePkgs; [
    openjdk17
    python3
    lua
    luajit
    gcc
    tree-sitter
    libaacs
    yazi
    noctalia-shell
  ];
in {
  environment.systemPackages = stable ++ unstable ++ [nvfPkg];
}
