#!/usr/bin/ksh

cd /sources/SES

chmod 777 install_vtom

./install_vtom VT-SES-* VT-CS-*

# Si vous êtes embetés par le service 30001 pago-pago, changez de plage de port ou commentez le service pago
# j'ai eu un problème avec le cat qui n'affichait pas les bonnes infos, d'où la boucle while
while read line ; do echo $line ; done < /opt/vtom/admin/services.new >> /etc/services

su - vtom -c "start_servers;start_client;"
