#!/usr/bin/ksh

cd /sources/SES

chmod 777 install_vtom

./install_vtom VT-SES-* VT-CS-*

# Si vous êtes embetés par le service 30001 pago-pago, changez de plage de port ou commentez le service pago
# petit soucis de tty depuis la toolbox Windows, le cat ne faisait pas le bon saut de ligne
while read line ; do echo $line ; done < /opt/vtom/admin/services.new >> /etc/services

cp license.xml /opt/vtom/vtom/bin/
chmod 770 /opt/vtom/vtom/bin/license.xml
