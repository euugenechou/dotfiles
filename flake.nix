{
    description = "eugebe's frosted flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs: {
        defaultPackage.aarch64-linux = home-manager.defaultPackage.aarch64-linux;
        defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

        homeConfigurations = {
            "eugene" = inputs.home-manager.lib.homeManagerConfiguration {
                system = "aarch64-darwin";
                    homeDirectory = "/Users/eugene";
                    username = "eugene";
                    configuration.imports = [ ./home.nix ];
            };
        };
    };
}
