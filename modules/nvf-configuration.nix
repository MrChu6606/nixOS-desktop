{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    
    visuals = {
      nvim-scrollbar.enable = false;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "toyonight";
      };

      theme = {
        enable = true;
        name = "tokyonight";
        style = "night";
        transparent = true;
      };
    };
    spellcheck = {
      enable = true;
      languages = [ "en" ];
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      nvim-docs-view.enable = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;

      bash.enable = true;
      go.enable = true;
      lua.enable = true;
      python = {
        enable = true;
        lsp.server = "pyright";
      };
      typst = {
        enable = true;
        format.type = "typestyle";
      };
      yaml.enable = true;
      css.enable = true;
      clang.enable = true; # problems on darwin hopefully not here
      html.enable = true;
      java.enable = true;
      sql.enable = true;
      ts.enable = true;
    };

    autopairs.nvim-autopairs.enable = true; # Autobrackets

    # Autocomplete
    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        sourcePlugins.emoji.enable = true;
      };
    };

    filetree.neo-tree.enable = true; # Filetree

    treesitter.context.enable = true;

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      neogit.enable = true;
    };

    # Debugging code
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; {
      neotest-python = {
        package = neotest-python;
      };
      neotest-java = {
        package = neotest-java;
      };
      neotest-dotnet = {
        package = neotest-dotnet;
      };
      neotest = {
        package = neotest;
        setup = ''
          require("neotest").setup({
            adapters = {
              require("neotest-python"),
              require("neotest-java"),
              require("neotest-dotnet"),
            },
          })
        '';
        after = ["neotest-python" "neotest-java" "neotest-dotnet"];
      };
    };

    assistant = {
      chatgpt.enable = false;
      avante-nvim.enable = false;
    };

    utility = {
      diffview-nvim.enable = true;

      images = {
        image-nvim.enable = false;
        img-clip.enable = false;
      };
    };

    ui.noice.enable = true; # command bar

    comments.comment-nvim = {
      enable = true;
      setupOpts.mappings.basic = true;
    };

    options = {
      # 2-space indents
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      breakindent = true;

      # Splitting
      splitbelow = false;
      splitright = false;

      # Undo
      undofile = true;
      undolevels = 10000;
      swapfile = false;
      backup = false;
    };
  };
}
