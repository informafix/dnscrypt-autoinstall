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
ADDRESS1=192.71.249.83
ADDRESS2=212.117.180.145
PNAME1=2.dnscrypt-cert.fvz-rec-be-okp-01.dnsrec.meo.ws
PNAME2=2.dnscrypt-cert.fvz-rec-lu-ros-01.dnsrec.meo.ws
PKEY1=4732:9AE7:A687:AD48:4F2C:9CE8:F7A8:895C:122E:B3DF:8C16:B9B8:3FE3:BAB0:18EF:50F7
PKEY2=94FD:5D40:BC95:2535:EC01:4CCE:2746:9128:5960:A84F:DF89:29B3:ED31:702D:8EF9:567D

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
