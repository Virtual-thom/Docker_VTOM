#!/usr/bin/ksh

cd /sources/SES

ksh install_vtom VT-SES-* VT-CS-*

# Si vous êtes embetés par le service 30001 pago-pago, changez de plage de port ou commentez le service pago
cat /opt/vtom/admin/services.new >> /etc/services

su - vtom -c "start_servers;start_client;"
