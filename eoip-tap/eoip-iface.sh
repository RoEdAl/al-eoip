#!/bin/bash -e

function echoerr() {
    echo "$@" 1>&2;
}

IFACE="$1"

if [ -z "${EOIP_LOCAL_ADDR}" ]; then
    echoerr Local address not specified
    exit 1
fi

if [ -z "${EOIP_REMOTE_ADDR}" ]; then
    echoerr Remote address not specified
    exit 1
fi

if [ -z "${EOIP_TUNNEL_ID}" ]; then
    echoerr Tunnel ID not specified
    exit 1
fi

if [ -z "${EOIP_MTU}" ]; then
    eoip ${IFACE:-eoip} id ${EOIP_TUNNEL_ID} local ${EOIP_LOCAL_ADDR} remote ${EOIP_REMOTE_ADDR}
else
    eoip ${IFACE:-eoip} id ${EOIP_TUNNEL_ID} local ${EOIP_LOCAL_ADDR} remote ${EOIP_REMOTE_ADDR} mtu ${EOIP_MTU}
fi
