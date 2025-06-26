======================================================================================================
======================================================================================================
[👨‍💻 WINDOWS]::

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🪟 COMANDOS POWERSHELL DE REDES]::
# Desde CMD:
ping -a <dirección_ip o host>                    # realiza un ping mostrando su hostname.
nslookup <dirección_ip>                          # resuelve una dirección IP a un nombre de dominio (host), consultando el servidor DNS.
netstat                                          # muestra las conexiones de red activas, puertos de escucha y estadísticas de red en el sistema.
arp -a                                           # muestra la tabla ARP (Address Resolution Protocol) que asocia direcciones IP con direcciones MAC en la red local.
ipconfig /flushdns

# ip | dns
ipconfig /release                                # Libera la IP actual del adaptador. Úsalo para desconectar la red o resetear configuración de red.
ipconfig /renew                                  # Solicita una nueva IP al servidor DHCP. Úsalo tras release o para forzar nueva IP.

ipconfig /flushdns                               # Limpia la caché DNS local. Úsalo si hay errores de resolución de nombres.





======================================================================================================
======================================================================================================
[👨‍💻 LINUX]::

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🐧 COMANDOS ÚTILES]::
ln -s <RUTA_ARCHIVO> <RUTA_SIMBOLO>    # enlace simbólico (soft link): apunta a otro archivo o directorio
ln <ORIGEN> <DESTINO>                  # enlace duro (hard link): enlace físico al mismo inode

top                                    # Monitorizar procesos en tiempo real. Ej: top
htop                                   # Monitorizar procesos (mejorado, interactivo). Ej: htop
vmstat                                 # Estadísticas de memoria, procesos, I/O. Ej: vmstat 1
iostat                                 # Estadísticas de CPU y discos. Ej: iostat -xz 1
dig <DOMINIO>                          # Consultas DNS avanzadas. Ej: dig google.com
nslookup <DOMINIO>                     # Consultas DNS básicas. Ej: nslookup google.com
lsblk                                  # Mostrar discos y particiones. Ej: lsblk
command -v <COMANDO>                   # Ver ruta o existencia de un comando. Ej: command -v bash

netstat                                # Ver conexiones, puertos abiertos (deprecated). Ej: netstat -tuln
ss                                     # Ver conexiones, puertos abiertos (moderno). Ej: ss -tunlp

traceroute <HOST>                      # Rutas hacia un destino. Ej: traceroute google.com
mtr <HOST>                             # Combina ping + traceroute. Ej: mtr 8.8.8.8

wget <URL>                             # Descargar archivos. Ej: wget https://example.com
ethtool <INTERFAZ>                     # Ver/gestionar parámetros de interfaces. Ej: ethtool eth0
iperf3                                 # Medir ancho de banda entre 2 equipos. Ej: iperf3 -s / iperf3 -c <host>
arp -a                                 # Ver tabla ARP. Ej: arp -a
route                                  # Ver tabla de rutas (deprecated, usa ip route). Ej: route -n
ip route                               # Mostrar rutas de red (reemplazo de route). Ej: ip route

hostnamectl                      # Ver o cambiar el hostname del sistema
uname -a                         # Mostrar info completa del kernel/SO
uptime                           # Tiempo encendido + carga del sistema
df -h                            # Uso de espacio en disco (formato legible)
du -sh <DIR>                     # Tamaño de un directorio específico
ps aux                           # Ver procesos en ejecución
kill <PID>                       # Terminar proceso por PID
pkill <NOMBRE>                   # Terminar proceso por nombre
journalctl                       # Ver logs del sistema (systemd)
dmesg                            # Mensajes del kernel (útil para hardware)

lsof -i                          # Ver procesos usando puertos/red
who                              # Ver usuarios conectados
id <USUARIO>                     # Ver UID/GID de usuario
groups <USUARIO>                 # Grupos de un usuario
adduser <USUARIO>                # Crear usuario (Debian)
useradd <USUARIO>                # Crear usuario (RHEL)
passwd <USUARIO>                 # Cambiar contraseña

scp <archivo> user@host:/ruta/   # Copiar archivos por SSH (no copia los usuario, permisos etc)
rsync -av <origen> <destino>     # Sincronizar directorios (copia y mantiene todo), este es un ejemplo es mejor utilizar el comando de abajo
ssh <user>@<host>                # Conectarse por SSH
screen                           # Crear sesiones persistentes
tmux                             # Multiplexor de terminal (mejor que screen, aconsejable utilizando interface grafica)

iptables -L                      # Ver reglas de firewall
ufw status                       # Estado del firewall (Ubuntu)
firewalld-cmd --list-all         # Estado de firewalld (CentOS/RHEL)

nc -lvp <PUERTO>                 # Escuchar puerto TCP con netcat
curl ifconfig.me                 # Ver IP pública

ip link                          # Ver interfaces de red
ip addr                          # Ver IPs asignadas
ip r                             # Ver tabla de rutas

file <archivo>                   # Ver tipo de archivo
md5sum <archivo>                 # Calcular hash MD5
sha256sum <archivo>                                                    # Calcular hash SHA-256


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🐧 MIGRAR CONTENIDO]:
rsync -avzc /ruta/origen/ usuario@ip_destino:/ruta/destino/            # manera adecuada para mantener la integridad de los archvios respetando todas las opciones, usuario, permisos, hardlinks...
scp -r /ruta/local/dir usuario@ip_destino:/ruta/remota/                # no preserva usuarios, grupos ni permisos... como lo hace rsync


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🐧 COMPRESIÓN]:
## los parámetros tienen que ir en orden, este comando hace de tar y de gzip
tar -czvf prueba.tar.gz comprimir/     # crea el archivo tar y lo comprime con gzip
tar -xzvf prueba.tar.gz                # descomprime el archivo tar siempre que haya sido comprimido con gzip, (si no a sido comprimido utilizo -xvf para descomprimirlo)

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
------------------------------------------------------------------------------------------------------
[🐧 SSL/TLS]:
openssl s_client -connect <IP>:443               # muestra información sobre el SSL/TLS


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🐧 ARCHIVOS]:
lsattr                                            # para buscar los archivos de un sistema de archivos (i: Inmutable, a: Adjuntable, d: No se puede eliminar, s: Seguridad).
chattr -i Carpeta/                                # cambiar los atributos de los archivos en un sistema de archivos.
lsof | grep "Gestión de clientes"                 # muestra una lista de archivos abiertoa.


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
[🐧 PAQUETES DE INSTALACIÓN EN LINUX]::
Vuls                                              # https://vuls.io/ : Herramienta ligera y automatizada de escaneo de vulnerabilidades enfocada en sistemas Linux/Unix usando datos públicos externos.
