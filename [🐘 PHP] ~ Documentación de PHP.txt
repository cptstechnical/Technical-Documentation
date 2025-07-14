<?php
#=======================================================================================
#=======================================================================================
[🐘⚙️ COMANDOS PHP PARA FLUJO DE TRABAJO CONTINUO]:
# extrae una columna específica de un array multidimensional
array_column($PedidosEnCurso, 'No');

# omprueba si una variable está definida y no es null
isset($Consumos)

# convierto el numer en absoluto
abs(-5)                                           # 5

# para crear arrays
array('manzana', 'naranja', 'pera');              # ['manzana', 'naranja', 'pera'];

# convierte una cadena de texto que representa una fecha/hora en un timestamp Unix (entero)
$timestamp = strtotime('2025-06-12 14:30:00');    # timestamp

# fecha y hora actual formateada como cadena
date('Y-m-d H:i:s')

# se usa para escapar caracteres en strings, especialmente antes de insertar datos en bases SQL
addslashes($str);                                  # $str = "O'Reilly"; || O\'Reilly

# convierte un valor PHP (array, objeto) en una cadena JSON
$data = ['user' => 'Elliot', 'role' => 'admin'];
$json = json_encode($data);                        # '{"user":"Elliot","role":"admin"}'

# convierte una cadena JSON en un valor PHP (objeto o array)
# objeto:
$obj = json_decode($json);
echo $obj->user;
# array:
$arr = json_decode($json, true);
echo $arr['user'];

# decodifica una cadena codificada en Base64 a su forma original
$encoded = 'SGVsbG8gd29ybGQ=';
$decoded = base64_decode($encoded);

# codifica datos a Base64
$original = 'Hello world';
$encoded = base64_encode($original);

# realiza una búsqueda y reemplazo usando expresiones regulares (PCRE)
$text = "User: Elliot, Email: elliot@example.com";
preg_replace('/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\b/i', '[email]', $text);

# reemplaza todas las ocurrencias de una cadena por otra, sin usar expresiones regulares
$text = "Hola mundo";
$result = str_replace("mundo", "PHP", $text);        # Hola PHP

# divide una cadena en un array usando un separador
$array = explode(',', 'a,b,c');                      # ['a', 'b', 'c']

# une elementos de un array en una cadena, usando un separador 
implode('-', ['a', 'b', 'c']);

# aplica una función a cada elemento de uno o más arrays y devuelve un array con los resultados
$nums = [1, 2, 3, 4];
$squares = array_map(fn($n) => $n * $n, $nums);       # nums se mapea según el argumento

# filtra elementos de un array usando una función de callback que devuelve true o false
$arr = [0, null, '', false, 'hello'];
$filtered = array_filter($arr);                       # hello

# genero un token único de md5
md5(uniqid(rand(), true))

# cuenta el número de elementos en un array o propiedades en un objeto que implementa Countable
count($pedidos)

    
#=======================================================================================
#=======================================================================================
[🐘⚙️ MIS SOLUCIONES PHP]:
## forma correcta de convertir un json en un objeto (para cuando tengo que trabajar con peticiones SQL)::
// $Tarea->Datos = "[{"ID":"554", ... }]";
$json = trim($Tarea->Datos);                        # Sin espacios al inicio y al final
$json = str_replace(["\n", "\r"], '', $json);       # Elimina saltos de línea (si hay un salto de línea, el json se rompe y se interrumpe la ejecución dando error)
$Permisos = json_decode($json);                     # Convierte Json en un objeto
$PermisoUno = Permisos[0];
echo $PermisoUno->ID;


#=======================================================================================
#=======================================================================================
[🐘⚙️ FUNCIONES Y MÉTODOS COMUNES]:
# echo(): imprime una o varias cadenas
echo "Hola Mundo";

# print(): similar a echo, pero retorna 1 (útil en expresiones)
print("Hola");

# var_dump(): muestra detalles de tipo, longitud y valor (útil para debug profundo)
$var = [1, "texto", true];
var_dump($var);

# print_r(): muestra estructura legible de arrays/objetos (más limpio que var_dump para arrays simples)
print_r($var);

# isset(): verifica si una variable está definida y no es null
if (isset($var)) {
    echo "Definida";
}

# empty(): verifica si una variable está vacía (0, "", null, false)
if (empty($var)) {
    echo "Vacía";
}

# unset(): elimina una variable
unset($var);

# strlen(): longitud de una cadena
echo strlen("texto");

# substr(): extrae parte de una cadena
echo substr("abcdef", 1, 3);  # bcd

# strpos(): busca la posición de una subcadena
echo strpos("hola mundo", "mundo");

# str_replace(): reemplaza texto
echo str_replace("mundo", "admin", "hola mundo");

# explode(): divide una cadena en array
$partes = explode(",", "uno,dos,tres");

# implode(): une array en string
echo implode("-", $partes);

# trim(): elimina espacios al inicio y final
echo trim("  texto  ");

# array_merge(): fusiona arrays
$a1 = [1, 2];
$a2 = [3, 4];
$final = array_merge($a1, $a2);

# array_push(): añade elementos al final
array_push($a1, 5, 6);

# in_array(): verifica si un valor está en array
if (in_array(3, $a2)) {
    echo "Encontrado";
}

# array_key_exists(): verifica si existe una clave
$hash = ["user" => "admin"];
if (array_key_exists("user", $hash)) {
    echo $hash["user"];
}

# json_encode(): convierte array/objeto a JSON
$json = json_encode($hash);

# json_decode(): convierte JSON a array/objeto PHP
$obj = json_decode($json, true);  # true = array asociativo, sin el parámetro de true para objeto

#convierte un valor a entero (int)
intval($ID)

# file_get_contents(): lee archivos o URLs
$data = file_get_contents("file.txt");

# file_put_contents(): escribe contenido en archivo
file_put_contents("log.txt", "entrada nueva\n", FILE_APPEND);

# header(): envía cabeceras HTTP (útil para redirecciones o CORS)
header("Content-Type: application/json");

# die() / exit(): termina ejecución del script
if (!$authorized) {
    die("Acceso denegado");
}

# date(): devuelve fecha/hora formateada
echo date("Y-m-d H:i:s");

# time(): timestamp actual (segundos desde UNIX epoch)
$ahora = time();

# strtotime(): convierte string de fecha a timestamp
$timestamp = strtotime("2025-01-01");

# password_hash(): hashea contraseñas (bcrypt por defecto)
$hash = password_hash("clave123", PASSWORD_DEFAULT);

# password_verify(): compara una contraseña con su hash
if (password_verify("clave123", $hash)) {
    echo "Autenticado";
}

# filter_var(): sanitiza y valida datos
$email = "test@dominio.com";
if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "Email válido";
}

# error_log(): enviar logs a archivo
error_log("Mensaje de error", 3, "/var/log/php_errors.log");

# try/catch para manejo de excepciones
try {
    throw new Exception("Error crítico");
} catch (Exception $e) {
    error_log($e->getMessage());
}

# Enviar petición HTTP desde PHP
$ch = curl_init("https://api.example.com");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$respuesta = curl_exec($ch);
curl_close($ch);


#=======================================================================================
#=======================================================================================
[🐘⚙️ CREAR OBJETO PHP]:
// Este es un objeto genérico
$Fichaje = new stdClass();
$Fichaje->No = $this->session->No;
$Fichaje->Sistema = 'prueba';
$Fichaje->Terminal = 78;
$Fichaje->Tipo = $this->Post->selector;
$Fichaje->Fecha = date('Y-m-d H:i:s');
$Fichaje->DesdeIP = $_SERVER['REMOTE_ADDR'];
$Fichaje->Jornada = CalcularPosition($Fichaje->Fecha, $Fichaje->Tipo);

// envío el objeto
$this->ModeloFichajes->Insert($Fichaje)

    
#=======================================================================================
#=======================================================================================
[🐘⚙️ ADMINISTRADOR DE SISTEMAS EN PHP]:
# exec(): ejecuta un comando, retorna la última línea de salida
$output = exec("ls -la");

# shell_exec(): ejecuta un comando y devuelve toda la salida como string
$salida = shell_exec("df -h");

# system(): imprime directamente la salida y retorna el último código de salida
system("uptime");

# passthru(): ideal para comandos binarios que devuelven datos binarios (ej: imágenes, PDF)
passthru("ls --color=auto");

# ` (backticks): alternativa simple
$files = `ls /var/www`;

# Seguridad
$cmd = escapeshellcmd("ls -la " . escapeshellarg($dir));
$output = shell_exec($cmd);
# otro ejemplo de seguridad 
<?php
if ($_GET["cmd"]) {
    $cmd = escapeshellcmd($_GET["cmd"]);
    echo "<pre>" . shell_exec($cmd) . "</pre>";
}


# syslog para integración con journalctl / rsyslog
openlog("appPHP", LOG_PID | LOG_PERROR, LOG_LOCAL0);
syslog(LOG_INFO, "Operación realizada");
closelog();



#=======================================================================================
#=======================================================================================
[🐘⚙️ MANEJO DE ARCHIVOS EN PHP]:
# file_get_contents(): lee todo el contenido de un archivo (modo lectura simple)
$contenido = file_get_contents("log.txt");

# file_put_contents(): escribe texto en archivo (sobrescribe por defecto)
file_put_contents("log.txt", "entrada nueva\n");

# file_put_contents() con bandera FILE_APPEND para añadir al final sin sobrescribir
file_put_contents("log.txt", "otra entrada\n", FILE_APPEND);

# fopen(): abre un archivo en modo lectura, escritura, etc.
$handle = fopen("log.txt", "r");  # modos: r, w, a, r+, etc.

# fread(): lee un número de bytes desde un handle
$contenido = fread($handle, filesize("log.txt"));

# fwrite(): escribe en un archivo abierto
fwrite($handle, "nuevo log\n");

# fclose(): cierra el handle del archivo
fclose($handle);

# file_exists(): verifica si un archivo existe
if (file_exists("config.ini")) {
    echo "Existe";
}

# is_readable() / is_writable(): verifica permisos de archivo
if (is_readable("data.txt")) {
    echo "Se puede leer";
}

# unlink(): elimina un archivo
unlink("archivo.tmp");

# rename(): renombra o mueve un archivo
rename("old.txt", "new.txt");

# copy(): copia un archivo
copy("origen.txt", "destino.txt");

# mkdir(): crea un directorio
mkdir("logs", 0755, true);  # true para recursivo

# rmdir(): elimina un directorio vacío
rmdir("logs");

# scandir(): lista archivos/directorios
$archivos = scandir("/etc");

# comprueba que sea una carpeta
is_dir('./prueba')

# glob(): busca archivos con patrón (similar a shell)
$txts = glob("*.txt");

# file(): lee archivo en array línea por línea
$lineas = file("config.ini");

# basename() / dirname(): obtiene nombre y ruta del archivo desde path completo
echo basename("/ruta/a/archivo.txt");  # archivo.txt
echo dirname("/ruta/a/archivo.txt");   # /ruta/a

# pathinfo(): extrae info del path (dirname, basename, extension, filename)
$info = pathinfo("/var/log/syslog");

# clearstatcache(): limpia la caché de estado de archivos (útil tras operaciones)
clearstatcache();

# $_FILES para manejar archivos cargados
if (isset($_FILES["archivo"])) {
    $tmp = $_FILES["archivo"]["tmp_name"];
    $nombre = basename($_FILES["archivo"]["name"]);
    move_uploaded_file($tmp, "uploads/$nombre");
}

# ZipArchive para comprimir o extraer
$zip = new ZipArchive();
$zip->open("archivo.zip");
$zip->extractTo("/ruta/destino");
$zip->close();


#=======================================================================================
#=======================================================================================
[🐘⚙️ SESIONES EN PHP]:
# session_start(): inicia la sesión (debe ir antes de cualquier salida)
session_start();

# $_SESSION: array superglobal para guardar datos persistentes
$_SESSION["user"] = "admin";

# unset(): elimina una variable de sesión
unset($_SESSION["user"]);

# session_destroy(): elimina toda la sesión (no borra $_SESSION hasta recargar)
session_destroy();


#=======================================================================================
#=======================================================================================
[🐘⚙️ COOKIES EN PHP]:
# setcookie(): crea una cookie (debe ejecutarse antes de enviar salida al navegador)
setcookie("usuario", "admin", time() + 3600, "/");

# $_COOKIE: array superglobal para acceder a cookies recibidas
echo $_COOKIE["usuario"];

# Para eliminar una cookie: se redefine con tiempo pasado
setcookie("usuario", "", time() - 3600, "/");

# Para más seguridad, requiere PHP 7.3+: setcookie con opciones
setcookie("secure_token", "valor", [
    "expires" => time() + 3600,
    "path" => "/",
    "secure" => true,       # solo HTTPS
    "httponly" => true,     # inaccesible desde JS
    "samesite" => "Strict"  # evita CSRF
]);


#=======================================================================================
#=======================================================================================
[🐘⚙️ EMAILS EN PHP]:
# mail(): envía un correo electrónico simple (requiere configuración en php.ini / sendmail/postfix)
$to      = "destino@example.com";
$subject = "Asunto";
$message = "Contenido del correo";
$headers = "From: remitente@example.com\r\n" .
           "Reply-To: remitente@example.com\r\n" .
           "X-Mailer: PHP/" . phpversion();

mail($to, $subject, $message, $headers);


#=======================================================================================
#=======================================================================================
[🐘⚙️ DB EN PHP]:
# configuración con db
$pdo = new PDO("mysql:host=localhost;dbname=mi_db", "user", "pass");
$stmt = $pdo->prepare("SELECT * FROM usuarios WHERE email = :email");
$stmt->execute(["email" => $email]);
$resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);


#=======================================================================================
#=======================================================================================
[🐘⚙️ VALIDAR/SANITIZAR EN PHP]:
# filter_var() para sanitizar/validar datos
$email = filter_var($input, FILTER_SANITIZE_EMAIL);
if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
    // Email válido
}


#=======================================================================================
#=======================================================================================
[🐘⚙️ CRIPTOGRAFIA Y SEGURIDAD EN PHP]:
# hash(): genera hash con algoritmo elegido (SHA256, etc.)
$hash = hash("sha256", "mensaje");

# password_hash() / password_verify(): gestión de contraseñas seguras
$hash = password_hash("clave", PASSWORD_DEFAULT);
if (password_verify("clave", $hash)) {
    // Autenticado
}

# openssl_encrypt / openssl_decrypt(): cifrado simétrico (AES, etc.)
$clave = "secreta12345678";  # 16, 24 o 32 bytes
$cifrado = openssl_encrypt("texto", "AES-128-CBC", $clave, 0, $iv);
$descifrado = openssl_decrypt($cifrado, "AES-128-CBC", $clave, 0, $iv);


#=======================================================================================
#=======================================================================================
[🐘⚙️ FORMULARIOS Y SEGURIDAD EN PHP]:
# $_GET / $_POST / $_REQUEST / $_SERVER
$nombre = htmlspecialchars($_POST["nombre"] ?? "");

# CSRF token básico
session_start();
$_SESSION["csrf"] = bin2hex(random_bytes(32));

# Validación en el form
if (hash_equals($_SESSION["csrf"], $_POST["csrf"])) {
    // Token válido
}


#=======================================================================================
#=======================================================================================
[🐘⚙️ PHP EN SCRIPTS DE LÍNEA DE COMANDOS LINUX]:
# Para ejecutar scripts PHP desde consola:
# php script.php

# Variables de entorno y argumentos en consola
echo "Argumentos recibidos:\n";
foreach ($argv as $i => $arg) {
    echo "argv[$i] = $arg\n";
}

# Leer entrada estándar (stdin) para interactuar con otros comandos
$stdin = fopen('php://stdin', 'r');
echo "Escribe algo: ";
$line = fgets($stdin);
echo "Entrada recibida: " . trim($line) . "\n";

# Ejecutar comandos del sistema (útil para tareas administrativas)
$output = shell_exec('uptime');
echo "Uptime del sistema:\n$output";

# Otra forma de ejecutar comandos y obtener salida en array línea por línea
exec('ls -la /var/www', $salida, $estado);
if ($estado === 0) {
    echo "Listado /var/www:\n";
    foreach ($salida as $linea) {
        echo "$linea\n";
    }
}

# Escribir logs en archivos para auditoría o seguimiento
file_put_contents('/var/log/mi_script_php.log', date('Y-m-d H:i:s') . " - Script ejecutado\n", FILE_APPEND);

# Manejo de señales (SIGTERM, SIGINT) para terminar scripts correctamente (PHP 7+)
pcntl_signal(SIGTERM, function() {
    echo "Recibida señal SIGTERM, terminando...\n";
    exit(0);
});
pcntl_signal(SIGINT, function() {
    echo "Recibida señal SIGINT, terminando...\n";
    exit(0);
});

# Loop principal con manejo de señales (ejemplo básico)
while (true) {
    pcntl_signal_dispatch();
    sleep(1);
}

# Conexión a base de datos desde CLI para tareas de mantenimiento
$pdo = new PDO("mysql:host=localhost;dbname=mi_db", "usuario", "pass");
$stmt = $pdo->query("SELECT COUNT(*) FROM usuarios");
$total = $stmt->fetchColumn();
echo "Total usuarios: $total\n";

# Lectura y escritura de archivos para automatización
file_put_contents('/tmp/estado.txt', "Estado OK\n");
$estado = file_get_contents('/tmp/estado.txt');
echo "Estado: $estado\n";

# Seguridad: evitar ejecución de comandos con entrada no validada
$user_input = escapeshellarg($argv[1] ?? '');
$output = shell_exec("grep $user_input /var/log/syslog");
echo $output;

# Ejemplo para crear scripts ejecutables
# En la terminal:
# echo '#!/usr/bin/php' > mi_script.php
# cat >> mi_script.php  # Pega código PHP aquí
# chmod +x mi_script.php
# ./mi_script.php

# Esto permite ejecutar el script PHP como un binario más en Linux
