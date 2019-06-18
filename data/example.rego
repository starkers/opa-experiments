package opa.examples

import data.servers
import data.networks
import data.ports

violations[server] {
    server := servers[_]
    server.protocols[_] == "http"
    public_servers[server]
}

public_servers[server] {
    some i, j
    server := servers[_]
    server.ports[_] == ports[i].id
    ports[i].networks[_] == networks[j].id
    networks[j].public == true
}
