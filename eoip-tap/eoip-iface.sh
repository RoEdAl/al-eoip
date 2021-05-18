#!/bin/bash -e

function addr_family() {
    case ${EOIP_ADDR_FAMILY} in
        4 | 6)
        echo "-${EOIP_ADDR_FAMILY}"
        ;;
    esac
}

eoip $(addr_family) ${1:-eoip} id ${EOIP_TUNNEL_ID:?} local ${EOIP_LOCAL_ADDR:?} remote ${EOIP_REMOTE_ADDR:?} ${EOIP_MTU:+mtu ${EOIP_MTU}}
