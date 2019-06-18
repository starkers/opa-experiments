#!/bin/sh
set -e


mkdir /build
cd /build


# This compiles caddy + some plugins..
cat >main.go<<EOF
package main

import (
	_ "github.com/BTBurke/caddy-jwt"
	"github.com/mholt/caddy/caddy/caddymain"
	_ "github.com/miekg/caddy-prometheus"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
EOF

set -x
export GO111MODULE=on
go mod init caddy
go get -v github.com/mholt/caddy
go build
