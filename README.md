# Desktop setup automation for Linux Mint

Sets up and configures a desktop workstation to get up and running within minutes.

## Requirements

- Linux Mint Tricia 19.3 Mate Edition
- ansible 2.5.x

## What does it do?

This repository contains the following ansible roles
- __install software__: upgrade dist and installs packages
- __configure desktop__: 
  - personalizes mate settings
  - uses i3 as window manager within mate
  - configure backups
- __setup home__: personalizes home directory and bash
- __dev tools__: installs additional software for development usage (i.e. IDE)
- __cloud tools__: installs a set of cloud tools to operate and develop with kubernetes. See [the full list](./roles/04-cloud-tools/defaults/main.yml#L18)
- __other tools__: installs miscelanious software

## To run it

```bash
./install.sh
```
