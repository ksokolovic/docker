# ubuntu-java8-gradle Dockerfile
* * *

Docker images built on top of the [Ubuntu 14.04](https://hub.docker.com/r/library/ubuntu/),
with the addition of some useful extensions and tools targeted primarily towards
Java development. You can find the images on the [Docker Hub](https://hub.docker.com/r/sokolovic/ubuntu-java8-mysql/) (if not already there).

# Base Docker

* [ubuntu:14.04](https://hub.docker.com/r/library/ubuntu/)

# Things installed

The following has been installed on top of the official base image:

* ```build-essential```
* ```software-properties-common```
* ```oracle java 8``` (default)
* ```gradle```
* ```mysql-server``` (root:root)

# Available tags and ```Dockerfile``` links

TODO

# Contributing

In case you discover any issue, feel free to [open an issue on GitHub](https://github.com/ksokolovic/docker/issues), making sure
you provide as many details as possible.

Also, pull requests are welcome! :)
