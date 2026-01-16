# nix helpers
alias nr='sudo nixos-rebuild switch --flake ~/dotfiles#lotus'
alias ec='nvim ~/dotfiles/flake.nix'
alias apt='cd ~/dotfiles/modules/ && nvim packages.nix'

nupdate() {
  flake_dir=${1:-$PWD}   # default to current dir if no argument
  echo "Updating flake in $flake_dir..."
  nix flake update "$flake_dir"

  # Check if flake.lock changed
  if ! git diff --quiet flake.lock; then
    echo "Commiting update flake.lock..."
    git add flake.lock
    git commit -m "Update flake inputs"
  else
    echo "flake.lock unchanged, nothing to commit."
  fi

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
