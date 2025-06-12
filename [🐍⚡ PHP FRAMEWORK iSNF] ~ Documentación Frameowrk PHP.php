<?php
# Tipos de Frameworks (iFOT e iSNF):
# 🐘 iFOT · Interactive Framework for Open Technologies
# 🐍 iSNF · 
#=======================================================================================
#=======================================================================================
[🐍⚡ MVC MODAL]:
# sistema de MVC
  
#=======================================================================================
#=======================================================================================
[🐍⚡ HELPERS]:
# Todos los helpers dedicados y desarrollados para este framework
## 🔥 EmailH:
  
#=======================================================================================
#=======================================================================================
[🐍⚡ KERNEL]:
# sistema core del framework
  
#=======================================================================================
#=======================================================================================
[🐍⚡ SHORTCUTS]:
# pequeños atajos para otros ejecutaren producción como debugger
  
#=======================================================================================
#=======================================================================================
[🐍⚡ LIBRARIES]:
# todas las instalaciones de librerías externas de manera minimalista

#=======================================================================================
#=======================================================================================
[🐍⚡ SCRIPT]:
# script de servidor instalador de apache y configuración en debian 12
# script de php para lanzar un modal con estructura genérica de MVC
  
#=======================================================================================
#=======================================================================================
[🐍⚡ MY CODE]:
## 🔥 quitar el string a un array de objetos::
// $Tarea->Datos = "[{"ID":"554", ... }]";          # valor de la db o post
$json = trim($Tarea->Datos);                        # Sin espacios al inicio y al final
$json = str_replace(["\n", "\r"], '', $json);       # Elimina saltos de línea
$Permisos = json_decode($json);                     # Convierte Json en un objeto
$PermisoUno = Permisos[0];
echo $PermisoUno->ID;

