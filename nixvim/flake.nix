{
  description = "nixvim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "github:pete3n/nixvim-flake";
    basenixvim.url = "github:nix-community/nixvim";
  };
  outputs = { self, nixpkgs, nixvim, basenixvim }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosModules.default = {
      imports = [
	basenixvim.nixosModules.default
        #nixvim.nixosModules.default
      ];

      programs.nixvim = {
        enable = true;

	plugins ={
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

	extraPackages = with pkgs; [
	  jdk17
	  eclipse-jdtls
	  pyright
	  lua-language-server
	  clang-tools
	  taplo
	  yamlls
	  nodejs        # for tsserver / TypeScript
          delve         # Go debugger for nvim-dap-go
          gdb           # for nvim-gdb
          lldb          # for C/C++ debugging
          python3       # for nvim-dap-python
          ripgrep       # for telescope searches
          fd            # for telescope searches
	];
      };
    };
  };
}
