{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme = {
      enable = true;
      name = "base16";
      base16-colors = {
        base00 = "#1f1c19"; # bg slightly lighter
        base01 = "#292521"; # surface
        base02 = "#3a342f"; # selection / borders
        base03 = "#b0aaa2"; # comments/subtext softer
        base04 = "#dcd6d0"; # dark text
        base05 = "#dcd6d0"; # default text softer
        base06 = "#f5f1ed"; # light text
        base07 = "#ffffff"; # lightest
        base08 = "#ac4935"; # danger softer
        base09 = "#cc6f3c"; # amber softer
        base0A = "#d9b172"; # highlight / optional
        base0B = "#8fa88f"; # sage softer
        base0C = "#7bb5a7"; # cyan accent
        base0D = "#6b8fa3"; # blue / optional
        base0E = "#a77aa0"; # purple / keywords
        base0F = "#3a342f"; # subtle brown / borders
      };
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
        theme = "base16";
      };
    };
    spellcheck = {
      enable = true;
      languages = ["en"];
    };

    clipboard.enable = true;
    clipboard.providers.wl-copy.enable = true;

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
        lsp.servers = ["pyright"];
      };
      yaml.enable = true;
      css.enable = true;
      clang.enable = true; # problems on darwin hopefully not here
      html.enable = true;
      java = {
        enable = true;
        lsp.enable = true;
      };
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
      avante-nvim = {
        enable = false;
      };
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
