{ ... }: {
  disko.devices.disk = {

    # OS DISK (500GB)
    os = {
      type = "disk";
      device = "/dev/disk/by-id/REPLACE_OS_DISK";

      content = {
        type = "gpt";

        partitions = {
          boot = {
            size = "512M";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };

    # APPDATA + VMS (1TB)
    appdata = {
      type = "disk";
      device = "/dev/disk/by-id/REPLACE_APPDATA_DISK";

      content = {
        type = "gpt";

        partitions = {
          data = {
            size = "100%";

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/appdata";
              mountOptions = [ "noatime" ];
            };
          };
        };
      };
    };

    # MEDIA (2TB)
    media = {
      type = "disk";
      device = "/dev/disk/by-id/REPLACE_MEDIA_DISK";

      content = {
        type = "gpt";

        partitions = {
          data = {
            size = "100%";

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/media";
              mountOptions = [ "noatime" ];
            };
          };
        };
      };
    };
  };
}
