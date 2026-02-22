{ inputs, ... }:
{
    imports = [inputs.silentSDDM.nixosModules.default];

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    programs.silentSDDM = {
        enable = true;
        theme = "default";
    };
}
