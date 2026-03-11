final: prev:
{
  steam = prev.steam.override {
        extraArgs = "-cef-disable-gpu";
  };
}
