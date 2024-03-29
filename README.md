# OpenConnect

OpenConnect is a multi-VPN-client for:

- [Cisco's AnyConnect SSL VPN](http://www.cisco.com/go/asm)
- [Pulse Connect Secure](https://www.pulsesecure.net/products/connect-secure/)
- [Palo Alto Networks GlobalProtect SSL VPN](https://www.paloaltonetworks.com/features/vpn)

This repository builds and publish Docker images for my own use, but you're more than welcome to use it.

For official source code, go to [openconnect/openconnect](https://github.com/openconnect/openconnect).




# Run with Docker

e.g. Connect to Palo Alto Networks GlobalProtect SSL VPN:

```bash
docker run --rm -it --privileged --net=host klo2k/openconnect openconnect --protocol=gp vpn.example.com
```




# Build with "docker buildx"

Initialise [buildx](https://docs.docker.com/desktop/multi-arch/), if you're on a x64 machine:

```bash
# Enable ARM support
docker run --rm --privileged multiarch/qemu-user-static --reset --persistent yes

# Create 'mybuilder' if not exist, set as default builder
docker buildx inspect mybuilder||docker buildx create --name mybuilder
docker buildx use mybuilder

# Start builder
docker buildx inspect --bootstrap
```

Build for x64 (x86_64):

```bash
docker buildx build --pull \
  --platform "linux/amd64" \
  --tag "klo2k/openconnect" \
  --output=type=docker \
  .
```

For ARM 32-bit (armv7l), use `--platform "linux/arm/v7"`

For ARM 64-bit (aarch64), use `--platform "linux/arm64"`
