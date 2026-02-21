{ pkgs, silentSDDM, ... }:

{
    imports = [ silentSDDM ];

    programs.silentSDDM = {
        enable = true;
        theme = "default";
    };
}
