# Commands to run on a new system:

````
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
````

```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#mac
```
