#!/bin/bash -e

function show_usage() {
    echo "Usage: ${0/*\//} <eoip-iface> start|stop"
}

if [ $# -lt 2 ]; then
    show_usage
    exit 1
fi

IFACE="$1"      # EoIP interface
COMMAND="$2"    # start or stop

function eoip_start() {
    eoip add name ${IFACE} tunnel-id ${EOIP_TUNNEL_ID:?} ${EOIP_LOCAL_ADDR:+local ${EOIP_LOCAL_ADDR}} remote ${EOIP_REMOTE_ADDR:?}

    if [ -n "${EOIP_MTU}" ]; then
        ip link set ${IFACE} mtu ${EOIP_MTU}
    fi
}

function eoip_stop() {
    ip link delete ${IFACE}
}

case ${COMMAND} in
    start)
        eoip_start
        ;;

   stop)
        eoip_stop
        ;;
   *)
        schow_usage;
        exit 1
       ;;
esac
