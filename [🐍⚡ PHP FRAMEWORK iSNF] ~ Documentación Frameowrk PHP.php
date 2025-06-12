<?php
## Documentación 2025 (vf 0.0.0)
# 🐍 iSNF · Systems Integration and New Features
# ⚡ Isaac Navajas Pozo

#=======================================================================================
#=======================================================================================
[🐍⚡ MVC MODAL]:
# sistema de MVC
  
## 🔴 /app/routers/web.php
#------------------------------------------------------------------
//Definir controladores
require_once('./iPSOF/controllers/landingPageController.php');
require_once('./iPSOF/controllers/exampleController.php');
require_once('./iPSOF/controllers/errorController.php');
//Definir rutas
Http::get('/', ['controller' => 'LandingPage', 'method' => 'index']);
#------------------------------------------------------------------

#=======================================================================================
#=======================================================================================
[🐍⚡ HELPERS]:
# Todos los helpers dedicados y desarrollados para este framework

## 🔴 DebugH:
#------------------------------------------------------------------
# helper de depuración estático (activación/desactivación desde .env)
DebugH::kill($data);
#------------------------------------------------------------------

#=======================================================================================
#=======================================================================================
[🐍⚡ KERNEL]:
# sistema core del framework
  
#=======================================================================================
#=======================================================================================
[🐍⚡ SHORTCUTS]:
# pequeños atajos para otros ejecutaren producción como debugger

## 🔴 acceso al .env:
#------------------------------------------------------------------
# puedo acceder al .env de manera global
$this->env();  
$host = getenv('DB_HOST');
#------------------------------------------------------------------

#=======================================================================================
#=======================================================================================
[🐍⚡ LIBRARIES]:
# todas las instalaciones de librerías externas de manera minimalista

#=======================================================================================
#=======================================================================================
[🐍⚡ .ENV]:
# estructura de las variables de entorno 

  
#=======================================================================================
#=======================================================================================
[🐍⚡ SCRIPT]:
# script de servidor instalador de apache y configuración en debian 12
# script de php para lanzar un modal con estructura genérica de MVC
  
#=======================================================================================
#=======================================================================================
[🐍⚡ MY CODE]:
## 🔴 quitar el string a un array de objetos::
// $Tarea->Datos = "[{"ID":"554", ... }]";          # valor de la db o post
$json = trim($Tarea->Datos);                        # Sin espacios al inicio y al final
$json = str_replace(["\n", "\r"], '', $json);       # Elimina saltos de línea
$Permisos = json_decode($json);                     # Convierte Json en un objeto
$PermisoUno = Permisos[0];
echo $PermisoUno->ID;

