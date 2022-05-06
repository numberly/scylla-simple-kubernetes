FROM scylladb/scylla:4.6.2

COPY scylla.yaml /etc/scylla/scylla.yaml

USER scylla

# choose following mode: virtio, dpdk, posix
ENV NETWORK_MODE=posix
# tap device name(virtio)
ENV TAP=tap0
# bridge device name (virtio)
ENV BRIDGE=virbr0
# ethernet device name
ENV IFNAME=eth0
# setup NIC's and disks' interrupts, RPS, XPS, nomerges and I/O scheduler (posix)
ENV SET_NIC_AND_DISKS=no
# tune clocksource
ENV SET_CLOCKSOURCE=no
# ethernet device driver (dpdk)
ENV ETHDRV=
# ethernet device PCI ID (dpdk)
ENV ETHPCIID=
# number of hugepages
ENV NR_HUGEPAGES=64
# user for process (must be root for dpdk)
ENV USER=scylla
# group for process
ENV GROUP=scylla
# scylla home dir
ENV SCYLLA_HOME=/var/lib/scylla
# scylla config dir
ENV SCYLLA_CONF=/etc/scylla
# scylla arguments (for posix mode)
ENV SCYLLA_ARGS="--log-to-syslog 1 --log-to-stdout 0 --default-log-level info --network-stack posix"
# setup as AMI instance
ENV AMI=no
# Disable disk writeback cache
ENV DISABLE_WRITEBACK_CACHE=yes

ENTRYPOINT scylla --developer-mode 1 --smp 1 --authorizer CassandraAuthorizer --authenticator PasswordAuthenticator
