# SPHINCS+ for dart

This repository contains a Dart package that provides bindings for SPHINCS+. It provides support for all parameter sets included as part of the SPHINCS+ submission to NIST's Post-Quantum Cryptography Standardization project.

## Work in progress

This package is still in the early development phase, so it should not be considered as ready to use.

## Developer setup

Docker allows to develop using the same environment on different machines. First of all generate a docker_user.cfg file and write into it the username and the password of the user that will be created inside the container in the format user:password.

After that, to start the container run the following command:
```bash
bash setup.sh
```

Attach a Visual Studio Code window to the container and start develop!