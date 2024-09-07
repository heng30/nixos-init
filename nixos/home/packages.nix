{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ########################## Development ##########################
    android-tools
    android-studio
    cmake
    cairo
    dbus
    flutter
    fontconfig
    go
    gcc
    gdb
    gtk3
    gtk4
    gnumake
    glib
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    gdk-pixbuf
    graphene
    harfbuzz
    lua
    llvm
    libGL
    libadwaita
    libclang
    libunwind
    jdk17
    mesa
    ninja
    nodejs
    orc
    openssl
    openvino # intel deep learning toolkit
    pango
    pkg-config
    qt5.full
    qtcreator
    rocksdb
    rustup
    sqlite
    typescript
    upx
    vscode
    virtualenv
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    xdotool
    xorg.libXft
    xorg.libXmu
    xorg.libxcb
    xorg.libX11
    xorg.libXext
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXfixes
    xorg.libXrender
    xorg.xprop
    xorg.xcbproto

    ######## python3 ########
    (python3.withPackages
      (ps: with ps; [ pip ipython pandas requests pyquery pyyaml black ]))

    ######## neovim ########
    ccls
    neovim
    nixd
    nixfmt-classic
    nodePackages.prettier

    ########################## Tools ##########################
    acpi
    alsa-utils
    autojump
    appimage-run
    audacity # sound editor
    blender # 3D editor
    brave
    brightnessctl
    calibre
    evince
    fastfetch
    feh
    file
    freetype
    firefox
    flameshot
    fontconfig
    fontconfig.dev
    findutils
    gimp # picture editor
    gthumb
    gnome.zenity
    htop
    httpie
    inkscape # vector editor
    jq
    just
    killall
    imagemagick
    nvtopPackages.intel
    obs-studio
    openshot-qt
    proxychains
    pciutils
    rsync
    redshift
    screenkey
    sof-firmware
    tldr
    tree
    unzip
    unrar-wrapper
    vlc
    zip
    zoxide
    patchelf
    wpa_supplicant_gui
  ];
}
