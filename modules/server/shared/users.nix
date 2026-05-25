{ pkgs, ... }: {
  users.users.nic = {
    isNormalUser = true;
    description = "nic";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    openssh.authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwVDpKO0Stfm4abOjFjSBT0LbVJdwJJsqp7iOc9mzMI"
    ];
  };
}
