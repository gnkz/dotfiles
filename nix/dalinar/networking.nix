{
  ...
}:

{
  networking.firewall = rec {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
