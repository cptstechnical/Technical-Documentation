#=======================================================================================
#=======================================================================================
[🌊🧊 FUNCIONES Y COMANDOS BÁSICOS EN BASH]:
# echo: imprimir texto en consola
echo "Hola Mundo"

# read: leer entrada del usuario
read -p "Nombre: " nombre
echo "Hola $nombre"

# variables
var="texto"
echo $var

# condicional if
if [ -f "/etc/passwd" ]; then
  echo "Archivo existe"
fi

# condicional if-else
if [ -d "/tmp" ]; then
  echo "Directorio tmp existe"
else
  echo "No existe"
fi

# bucle for
for i in {1..5}; do
  echo "Número $i"
done

# while
count=0
while [ $count -lt 5 ]; do
  echo $count
  ((count++))
done

# funciones
mi_funcion() {
  echo "Función ejecutada"
}
mi_funcion

# salir con código de estado
exit 0


#=======================================================================================
#=======================================================================================
[🌊🧊 MANEJO DE ARCHIVOS Y DIRECTORIOS]:
# listar archivos
ls -l /ruta

# crear directorio
mkdir -p /ruta/nuevo_dir

# copiar archivo
cp origen.txt destino.txt

# mover/renombrar
mv archivo.txt /ruta/nuevo_nombre.txt

# eliminar archivo
rm archivo.txt

# eliminar directorio recursivo
rm -rf /ruta/directorio

# verificar existencia archivo/directorio
if [ -e "archivo.txt" ]; then echo "Existe"; fi

# leer contenido de archivo línea por línea
while IFS= read -r linea; do
  echo "$linea"
done < archivo.txt


#=======================================================================================
#=======================================================================================
[🌊🧊 MANEJO DE PERMISOS Y USUARIOS]:
# cambiar permisos (rwx)
chmod 755 script.sh

# cambiar propietario
chown usuario:grupo archivo.txt

# ver permisos
ls -l archivo.txt

# ejecutar comando como otro usuario
sudo -u usuario comando

# agregar usuario (en administración)
sudo useradd nuevo_usuario
sudo passwd nuevo_usuario


#=======================================================================================
#=======================================================================================
[🌊🧊 REDES Y CONECTIVIDAD]:
# ver IP y configuración de red
ip a

# hacer ping
ping -c 4 google.com

# escanear puertos con netcat (nc)
nc -zv 192.168.1.1 22-80

# consultar DNS
dig example.com

# probar conexión TCP simple
telnet example.com 80

# curl para HTTP y APIs
curl -X GET https://api.example.com/data
curl -X POST -d "param=valor" https://api.example.com/post


#=======================================================================================
#=======================================================================================
[🌊🧊 CONTROL DE PROCESOS]:
# listar procesos
ps aux

# buscar proceso por nombre
pgrep nombre_proceso

# matar proceso por PID
kill 1234

# matar proceso por nombre
pkill nombre_proceso

# mostrar procesos en tiempo real
top

# background y foreground
comando &
fg %1


#=======================================================================================
#=======================================================================================
[🌊🧊 MANEJO DE LOGS]:
# ver logs en tiempo real
tail -f /var/log/syslog

# buscar texto en logs
grep "error" /var/log/syslog

# rotar logs manual (ejemplo)
mv /var/log/app.log /var/log/app.log.old
kill -HUP $(pidof app)  # enviar señal para que app reabra logs


#=======================================================================================
#=======================================================================================
[🌊🧊 SEGURIDAD Y BUENAS PRÁCTICAS EN BASH]:
# validación y escapes para evitar inyección
variable=$(printf '%q' "$input")

# usar comillas para evitar expansión no deseada
echo "El valor es: $variable"

# comprobar comandos antes de ejecutar
command -v curl >/dev/null 2>&1 || { echo "curl no instalado"; exit 1; }

# restringir permisos de scripts
chmod 700 script.sh

# manejo de variables sensibles (no imprimir en logs)
export SECRET="clave_secreta"
unset SECRET

# usar trap para limpiar al salir
trap 'echo "Saliendo..."; exit' INT TERM


#=======================================================================================
#=======================================================================================
[🌊🧊 CRON · EJECUCIÓN REMOTA Y AUTOMATIZACIÓN]:
# ejecutar comando remoto por SSH
ssh usuario@host "ls -l /var/www"

# copiar archivo por SCP
scp archivo.txt usuario@host:/ruta/

# cron para tareas programadas (editar con crontab -e)
# ejemplo: ejecutar script todos los días a las 2am
0 2 * * * /ruta/script.sh >> /var/log/script.log 2>&1

#=======================================================================================
#=======================================================================================
[🌊🧊 LIBRERÍAS / HERRAMIENTAS ÚTILES PARA BASH]:
  # curl / wget :                 manejo HTTP y descargas
  # jq :                          manipulación JSON en línea de comandos
  # awk / sed :                   procesamiento y filtrado de texto avanzado
  # netcat (nc) :                 herramientas de red y debugging
  # ssh / scp :                   acceso remoto y transferencia segura
  # grep / find :                 búsqueda rápida en archivos
  # rsync :                       sincronización eficiente de archivos y directorios
  
