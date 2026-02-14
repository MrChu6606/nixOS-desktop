final: prev: {
  flameshot =final.flameshot.overrideAttrs (oldAttrs: rec {
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ final.cmake final.pkgconfig ];
    buildInputs = oldAttrs.buildInputs;

    # Add this env var to enable Wayland support
    NIX_CFLAGS_COMPILE = oldAttrs.NIX_CFLAGS_COMPILE or "" + " -DUSE_WAYLAND_GRIM=ON";
  });
}

