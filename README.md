# icon-node-packer-build

Script leveraging Packer and Ansible to build nodes for ICON.

## Prerequisites 

1. Export AWS keys to environment variables or profile 
3. Install [Meta](https://github.com/mateodelnorte/meta).
2. Install [Packer](https://www.packer.io/).
2. Install [Ansible](https://www.ansible.com/).

## Running the script

1. Clone this repository.
2. Run `meta git clone .` in the repository root.
3. ./icon-node-packer-build

## Usage

```
Usage:
  ./icon-node-packer-build <arguments>

arguments:
  -l		: List available build distros with associating node types, and exit.
  -d <distro>	: Distro to build. 'all' will build all available distros.
  -n <node>	: Node Type to build. 'all' will build all available node types.
```
