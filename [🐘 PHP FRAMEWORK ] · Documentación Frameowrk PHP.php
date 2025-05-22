<?php
#=======================================================================================
#=======================================================================================
[🐘🏭 PROYECTO GENERAL · CONTROLLERS]:
# inicial clase Prueba
class Prueba extends Core {...}


# Carga el idioma de carga
$this->Lang->load($this->Session->Idioma);


# cargo modulos (helpers, models... )  
$this->loadModel('ModeloEmpleados');

$Datos['Titulo'] = "Depuración de errores";
$this->loadView('Depuracion/Dashboard', $Datos);

$this->loadHelper('url');
$this->loadHelper('Session');
$this->loadHelper('Post');
$this->loadHelper('Logger');


# comandos PHP genericos
empty()                                           # comprueba si esta vacio
base64_decode()
file_exists()
strtolower()
sprintf()
strtoupper()
stat()
array_push()
json_encode()
is_numeric()




  
#=======================================================================================
#=======================================================================================
[🐘🏭 PROYECTO GENERAL · LIBRARIES]:
# control de sesiones
$this->Session->get('EmpleadoNo')
  
$this->Session->set($nombre, $valor)
  
$this->Session->unset($nombre)
  
$this->Session->load()
  
$this->Session->destroy()
  
$this->Session->Empresa->ID

  
# control de logs
$this->Logger->Add()
