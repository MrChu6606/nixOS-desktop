_: {
  fileSystems."/appdata" = {
    device = "/dev/disk/by-uuid/aea08e72-e626-4162-9781-a47bec7f365b";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems."/media" = {
    device = "/dev/disk/by-uuid/f9616b58-91c3-450b-8002-b9d9a0f55b5f";
    fsType = "ext4";
    options = [ "noatime" ];
  };
}
