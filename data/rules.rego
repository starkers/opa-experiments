# This policy module belongs to the opa.examples package.
package opa.examples

# Refer to data.servers as `servers`.
import data.servers
# Refer to the data.networks as `networks`.
import data.networks
# Refer to the data.ports as `ports`.
import data.ports

# A server exists in the violations set if...
violations[server] {
    # ...the server exists
#   server := servers[_]
#   # ...and any of the server’s protocols is HTTP
#   server.protocols[_] == "http"
    # ...and the server is public.
    public_servers[server]
}

# A server exists in the public_servers set if...
public_servers[server] {
    some i, j
    # ...the server exists
    server := servers[_]
    # ...and the server is connected to a port
    server.ports[_] == ports[i].id
    # ...and the port is connected to a network
    ports[i].networks[_] == networks[j].id
    # ...and the network is public.
    networks[j].public == true
}
