{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ########################## Development ##########################
    android-tools
    android-studio
    cmake
    cairo.dev
    dbus.dev
    flutter
    go
    gcc
    gdb
    gtk3.dev
    gtk4.dev
    gnumake
    glib.dev
    gst_all_1.gstreamer.dev
    gst_all_1.gst-plugins-base.dev
    gst_all_1.gst-plugins-good.dev
    gst_all_1.gst-plugins-bad.dev
    gst_all_1.gst-plugins-ugly.dev
    gst_all_1.gst-libav.dev
    gst_all_1.gst-vaapi.dev
    gdk-pixbuf.dev
    graphene.dev
    harfbuzz.dev
    lua
    llvm
    libGL.dev
    libadwaita.dev
    libunwind.dev
    jdk17
    mesa
    ninja
    nodejs
    orc.dev
    openssl
    openssl.dev
    openvino # intel deep learning toolkit
    pango.dev
    pkg-config
    qt5.full
    # qt6.full
    qtcreator
    rustup
    sqlite
    sqlite.dev
    typescript
    vscode
    xdotool
    virtualenv
    vulkan-tools
    vulkan-loader.dev
    vulkan-validation-layers
    xorg.libXft.dev
    xorg.libXmu.dev
    xorg.libxcb
    xorg.libxcb.dev
    xorg.libX11
    xorg.libX11.dev
    xorg.libXinerama
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
