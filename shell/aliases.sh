# nix helpers
alias nr='sudo nixos-rebuild switch --flake ~/dotfiles/flake#lotus'
alias ec='nvim ~/dotfiles/flake.nix'
alias apt='nvim ~/dotfiles/modules/packages.nix'

nupdate() {
  flake_dir=${1:-$PWD}   # default to current dir if no argument
  echo "Updating flake in $flake_dir..."
  nix flake update "$flake_dir"
  echo "Rebuilding system..."
  sudo nixos-rebuild switch --flake "$flake_dir#lotus"
}

nupdate-test() {
  flake_dir=${1:-$PWD}
  echo "Updating flake in $flake_dir..."
  nix flake update "$flake_dir"
  echo "Testing rebuild..."
  sudo nixos-rebuild test --flake "$flake_dir#lotus"
}


#etc
alias gping='ping -c4 google.com'
alias ping4='ping -c4'

#for server
alias aranov='ssh aranov@100.79.131.10'
