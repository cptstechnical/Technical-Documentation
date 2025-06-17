======================================================================================================
======================================================================================================
[👨‍💻 WINDOWS]::
# Desde CMD:
ping -a <dirección_ip o host>                    # realiza un ping mostrando su hostname.
nslookup <dirección_ip>                          # resuelve una dirección IP a un nombre de dominio (host), consultando el servidor DNS.
netstat                                          # muestra las conexiones de red activas, puertos de escucha y estadísticas de red en el sistema.
arp -a                                           # muestra la tabla ARP (Address Resolution Protocol) que asocia direcciones IP con direcciones MAC en la red local.
ipconfig /flushdns

======================================================================================================
======================================================================================================
[👨‍💻 LINUX]::
ln -s <RUTA_ARCHIVO> <RUTA_SIMBOLO>              # enlace simbólico (soft link): archivos simbolicos
ln                                               # enlace duro (hard link): 
top
htop
vmstat
iostat
dig
nslookup
lsblk
command -v <comando>

------------------------------------------------------------------------------------------------------
[COMPRESIÓN]:
## los parámetros tienen que ir en orden, este comando hace de tar y de gzip
tar -czvf prueba.tar.gz comprimir/
tar -xzvf prueba.tar.gz

  -c = crear
  -z = gzip (comprimir)
  -v = verbose (opcional)
  -f prueba.tar.gz = archivo destino

  -x = extraer

-

## tar: comando de linux para juntar varios archivos y carpetas en un solo archivo (sin compresión)
tar -cvf prueba.tar comprimir/

## gzip: para comprimir un único archivo
gzip prueba.tar
# prueba.tar.gz

# con el primer comando me evito hacer estos dos últimos comandos, ya que lo hago todo en un único comando

------------------------------------------------------------------------------------------------------
[SSL/TLS]:
openssl s_client -connect <IP>:443               # muestra información sobre el SSL/TLS

------------------------------------------------------------------------------------------------------
[Comandos de archivos]:
lsattr                                            # para buscar los archivos de un sistema de archivos (i: Inmutable, a: Adjuntable, d: No se puede eliminar, s: Seguridad).
chattr -i Carpeta/                                # cambiar los atributos de los archivos en un sistema de archivos.
lsof | grep "Gestión de clientes"                 # muestra una lista de archivos abiertoa.


======================================================================================================
[👨‍💻 PAQUETES DE INSTALACIÓN EN LINUX]::
Greenbone                                         # https://greenbone.github.io/ : Plataforma integral de gestión y escaneo de vulnerabilidades de red con base de datos propia y soporte para múltiples sistemas.
Vuls                                              # https://vuls.io/ : Herramienta ligera y automatizada de escaneo de vulnerabilidades enfocada en sistemas Linux/Unix usando datos públicos externos.
