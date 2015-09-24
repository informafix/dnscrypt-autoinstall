#! /bin/sh
### BEGIN INIT INFO
# Provides:          dnscrypt-proxy
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: dnscrypt-proxy
# Description:       dnscrypt-proxy secure DNS client
### END INIT INFO

# Authors: https://github.com/simonclausen/dnscrypt-autoinstall/graphs/contributors
# Project site: https://github.com/simonclausen/dnscrypt-autoinstall

PATH=/usr/sbin:/usr/bin:/sbin:/bin
DAEMON=/usr/local/sbin/dnscrypt-proxy
NAME=dnscrypt-proxy
ADDRESS1=178.32.122.65
ADDRESS2=37.187.0.40
PNAME1=2.dnscrypt-cert.d0wn.biz
PNAME2=2.dnscrypt-cert.d0wn.biz
PKEY1=9970:E22D:7F6C:967F:8AED:CEEB:FBC1:94B9:AF54:376E:2BF7:39F1:F466:CBC9:AFDB:2A62
PKEY2=9970:E22D:7F6C:967F:8AED:CEEB:FBC1:94B9:AF54:376E:2BF7:39F1:F466:CBC9:AFDB:2A62

case "$1" in
  start)
    echo "Starting $NAME"
    $DAEMON --daemonize --ephemeral-keys --user=dnscrypt --local-address=127.0.0.1 --resolver-address=$ADDRESS1 --provider-name=$PNAME1 --provider-key=$PKEY1
	$DAEMON --daemonize --ephemeral-keys --user=dnscrypt --local-address=127.0.0.2 --resolver-address=$ADDRESS2 --provider-name=$PNAME2 --provider-key=$PKEY2
    ;;
  stop)
    echo "Stopping $NAME"
    pkill -f $DAEMON
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/dnscrypt-proxy {start|stop|restart}"
    exit 1
    ;;
esac

exit 0
