{
  description = "nixvim flake";

  inputs = {
    #nixpkgs is injected from system flake
    nixvim.url = "github:pete3n/nixvim-flake";
    basenixvim.url = "github:nix-community/nixvim";
  };
  outputs = { self, basenixvim, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosModules.default {pkgs, ... }: {
      imports = [
	basenixvim.nixosModules.default
        #nixvim.nixosModules.default
      ];

      programs.neovim = {
        enable = true;

	plugins = {
	  lazy.enable = true;

	  lsp.servers = {
	    jdtls.enable = true;
	    pyright.enable = true;
            lua_ls.enable = true;
            clangd.enable = true;
            taplo.enable = true;
            yamlls.enable = true;
            tsserver.enable = true;
            gopls.enable = true;
	  };
	};

	packages = with pkgs; [
	  jdk17
	  eclipse-jdtls
	  pyright
	  lua-language-server
	  lua
	  clang-tools
	  clang
	  taplo
	  yamlls
	  nodejs        # for tsserver / TypeScript
          delve         # Go debugger for nvim-dap-go
          lldb          # for C/C++ debugging
          python3       # for nvim-dap-python
	];

	extraPackages = with pkgs; [
          ripgrep       # for telescope searches
          fd            # for telescope searches
          gdb           # for nvim-gdb
	  tree-sitter
	  fzf
	];
      };
    };
  };
}
