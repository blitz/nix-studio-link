{ mkTest, studioLink }:

mkTest ({ pkgs, ...}:
  {
    name = "studio-link";
                
    machine = ({ pkgs, ...}:  {
      environment.systemPackages = [ studioLink ];
    });

    testScript = ''
      start_all()
      machine.wait_for_unit("multi-user.target")

      # Just check whether we can actually execute it.
      machine.succeed("studio-link-standalone --help 2>&1 | grep -Fq 'Usage: baresip'")
    '';
  })
