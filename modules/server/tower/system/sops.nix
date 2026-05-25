_:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;

    age.keyFile = "/var/lib/sops-nix/key.txt";
  };

  sops.secrets = {
    "sonarr/api_key" = {};
    "sonarr/password" = {};
  };
}
