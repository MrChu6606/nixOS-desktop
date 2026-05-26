_: {
  
  networking = {
    firewall = {
      enable = true;

      allowedTCPPorts = [ 22 80 81 443 53 3000 8080 ];
      allowedUDPPorts = [ 53 ];
    };

    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "eno1";

      forwardPorts = [
        {
          destination = "10.200.0.2:8080";
          proto = "tcp";
          sourcePort = 8181;
        }
      ];
    };
  };

  # Configure hostname
  networking.hostName = "sequoia";


}
