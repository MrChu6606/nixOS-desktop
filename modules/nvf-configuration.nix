{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      
      nix.enable = true;
      ts.enable = true;
      java.enable = true;
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
  };
}
