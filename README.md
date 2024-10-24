# calculating-pi

A project focused around calculating pi in different ways.

## Setup

To build the dependencies for this repository locally, run the following command in nixOS

```
sudo nixos-rebuild switch -I nixos-config=configuration.nix
```

Then, to install python dependencies, run the following command in the calculating-pi directory:

```
poetry install
```

Then, to run the project:

```
poetry run python main.py
```
