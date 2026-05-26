_: {
  containers.searxng = {
    autoStart = true;
    privateNetwork = true;

    # Define internal subnet for host-container communication
    hostAddress = "10.200.0.1";
    localAddress = "10.200.0.2";

    # The actual NixOS system configuration running INSIDE the container
    config = _: {
      # Match this to your host's NixOS state version
      system.stateVersion = "25.05"; 

      # 1. Spin up an internal Redis server for rate-limiting & caching
      services.redis.servers.searxng = {
        enable = true;
        port = 6379;
        bind = "127.0.0.1"; # Lock it down to the container's internal localhost
      };

      # 2. Configure SearXNG
      services.searxng = {
        enable = true;
        settings = {
          server = {
            port = 8080;
            bind_address = "0.0.0.0"; # Listen on all interfaces inside the container
            secret_key = "acfe583c3e14089548c186467efb7ebbdef765b643ede173790fc6bc9252b3cf";
          };
          redis = {
            url = "redis://127.0.0.1:6379/0";
          };
          search = {
            safe_search = 0;
            autocomplete = "google";
          };
          ui = {
            theme = "simple";
          };
        };
      };

      # Open the container's internal firewall so the host can query it
      networking.firewall.allowedTCPPorts = [ 8080 ];
    };
  };
}
