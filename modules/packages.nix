{
  config,
  pkgs,
  lib,
  ...
}: let
  stable = with pkgs; [
    wget
    git
    rclone
    nnn
    tor-browser
    chromium
    qutebrowser
    mpv
    yt-dlp
    streamlink
    fastfetch
    kitty
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
    #nnn dependencies
    fzf
    gnupg
    whois
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
    #fonts
    noto-fonts-cjk-sans
    corefonts
  ];

  unstable = with pkgs; [
    jdt-language-server
    checkstyle
    openjdk17
    python3
    lua
    gcc
    linuxKernel.packages.linux_zen.xpadneo
  ];
in {
  environment.systemPackages = stable ++ unstable;
}
