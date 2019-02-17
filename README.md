# solar | docker
This repo houses some of the more useful docker features and tasks for Solar.

Currently, you can bring up a Postgres instance up to develop against.

## Generating environment config
Simply clone the repo and tun the `generate-env-files.sh` script. Ensure that this has executable permissions.

This will generate an env_file that is used by the docker instances.

Defaults in here should work with the out of the box with a cloned instance of `bridge`.
