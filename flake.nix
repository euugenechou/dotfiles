{
  description = "Eugene's systems flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      mkHome = modules: pkgs: home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    in
    {
      homeConfigurations = {
        "euchou@tartarus" = mkHome [ ./configs/euchou/tartarus.nix ] nixpkgs.legacyPackages.aarch64-linux;
        "eugene@cosmocanyon" = mkHome [ ./configs/eugene/cosmocanyon.nix ] nixpkgs.legacyPackages.aarch64-darwin;
      };
    };
}
