{ ... }:

{
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  home-manager.users.anjo = {
    imports = [
      ./modules
    ];
  };
}
