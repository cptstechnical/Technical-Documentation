//=======================================================================================
//=======================================================================================
[🟣🤖 TEORIA C#]:
# fase de compilación:     proceso de desarrollo de software, especialmente en lenguajes de programación compilados como C#. Si esta mal la sintaxis dará un error de compilación.
# runTime:                 momento en que el programa se está ejecutando. Durante este tiempo, el código ya ha sido compilado y se está ejecutando en la máquina.
# ambiente de ejecución:   conjunto de condiciones y configuraciones bajo las cuales se ejecuta un programa. Esto incluye el sistema operativo, la versión del CLR, las bibliotecas disponibles, y cualquier configuración específica del entorno (como variables de entorno).
# 
    
//=======================================================================================
//=======================================================================================
[🟣🤖 ARQUITECTURA EN C#]:
## Existen varios tipos de arquitecturas en C#, pero la más utilizada con C# es arquitectura por capas
    
    // 🐘 Equivalente a las vistas.
    - Capa de Presentación:                     interfaz de usuario, es la responsable de interactuar con el usuario. Aquí se manejan las vistas y la lógica de presentación.
    // 🐘 Equivalente al controlador.
    - Capa de Negocio (o Lógica de Negocio):    contiene la lógica de la aplicación y las reglas de negocio.
    // 🐘 Equivalente a la configuración con la db
    - Capa de Acceso a Datos:                   gestiona la comunicación con la base de datos o cualquier otro sistema de almacenamiento de datos.
    // 🐘 Equivalente al modelo
    - Capa de Datos:                            aunque a veces se considera parte de la capa de acceso a datos, esta capa se refiere específicamente a la base de datos o al sistema de almacenamiento donde se guardan los datos, además, en el caso de trabajar con objetos también irán las entidades. 


//=======================================================================================
//=======================================================================================
[🟣🤖 TIPADO EN C#]:
## La manera en la que voy a trabajar va a ser con objetos:

// Tipos primitivos por valor
+----------+-------------------+----------+---------------------+
| Tipo C#  | Alias .NET        | Tamaño   | Ejemplo             |
+----------+-------------------+----------+---------------------+
| byte     | System.Byte       | 1 byte   | byte a = 255;       |
| sbyte    | System.SByte      | 1 byte   | sbyte b = -128;     |
| short    | System.Int16      | 2 bytes  | short s = -32000;   |
| ushort   | System.UInt16     | 2 bytes  | ushort us = 65000;  |
| int      | System.Int32      | 4 bytes  | int i = 42;         |
| uint     | System.UInt32     | 4 bytes  | uint ui = 42000;    |
| long     | System.Int64      | 8 bytes  | long l = 1L;        |
| ulong    | System.UInt64     | 8 bytes  | ulong ul = 1UL;     |
| float    | System.Single     | 4 bytes  | float f = 1.2f;     |
| double   | System.Double     | 8 bytes  | double d = 3.14;    |
| decimal  | System.Decimal    | 16 bytes | decimal m = 1.2m;   |
| char     | System.Char       | 2 bytes  | char c = 'A';       |
| bool     | System.Boolean    | 1 bit    | bool b = true;      |
+----------+-------------------+----------+---------------------+

// Tipos por referencia
+------------+-----------------------------------------+
| Tipo       | Descripción                             |
+------------+-----------------------------------------+
| string     | Cadena de texto inmutable               |
| object     | Tipo base de todos los objetos          |
| dynamic    | Tipo dinámico (resuelto en runtime)     |
| class      | Clase personalizada                     |
| interface  | Contrato de comportamiento              |
| delegate   | Puntero a método                        |
| array[]    | Arreglo de cualquier tipo               |
+------------+-----------------------------------------+

// Para objetos
+----------------------------+--------------------------------------------------+
| Tipo                       | Descripción                                      |
+----------------------------+--------------------------------------------------+
| object                     | Tipo base de todos los tipos (referencia)        |
| string                     | Cadena de texto inmutable                        |
| dynamic                    | Tipo dinámico (resuelto en tiempo de ejecución)  |
| class                      | Clase definida por el usuario                    |
| interface                  | Contrato de implementación                       |
| delegate                   | Referencia a método                              |
| array[]                    | Colección de objetos                             |
| List<object>               | Lista dinámica de objetos                        |
| Dictionary<object, object> | Diccionario de clave-valor                       |
| HashSet<object>            | Conjunto sin duplicados                          |
| Task<object>               | Resultado asincrónico                            |
| Tuple<object>              | Agrupación de múltiples objetos                  |
| record                     | Tipo inmutable (ideal para datos)                |
| Exception                  | Tipo base para errores                           |
+----------------------------+--------------------------------------------------+
    
// Tipos especiales
+-----------+----------------------------------------------+
| Tipo      | Descripción                                  |
+-----------+----------------------------------------------+
| var       | Tipado implícito (inferencia en compilación) |
| T?        | Nullable (acepta null, ej: int?, bool?)      |
| Tuple<>   | Tupla de múltiples valores                   |
| record    | Tipo inmutable (C# 9+)                       |
| enum      | Enumeración (conjunto de constantes)         |
| struct    | Estructura personalizada por valor           |
+-----------+----------------------------------------------+

// Genéricos y colecciones
+--------------------------+-------------------------------+
| Tipo                    | Uso                            |
+--------------------------+-------------------------------+
| List<T>                 | Lista dinámica                 |
| Dictionary<TKey, TValue>| Mapa clave-valor               |
| HashSet<T>              | Conjunto sin duplicados        |
| Queue<T>                | Cola FIFO                      |
| Stack<T>                | Pila LIFO                      |
| Task<T>                 | Resultado asincrónico          |
| Func<T, TResult>        | Delegado genérico              |
| Action<T>               | Delegado sin retorno           |
+--------------------------+-------------------------------+


//=======================================================================================
//=======================================================================================
[🟣🤖 TIPOS DE DATOS EN C#]:

// int: Enteros de 32 bits (rango: -2,147,483,648 a 2,147,483,647)
int edad = 30;

// bool: Valores booleanos (true o false)
bool esAdmin = true;

// float: Números decimales de precisión simple (32 bits) - requiere sufijo 'f'
float temperatura = 36.6f;

// double: Números decimales de doble precisión (64 bits)
double peso = 70.45;

// char: Un solo carácter Unicode
char inicial = 'A';

// string: Cadena de texto (secuencia de caracteres)
string nombre = "Elliot";

// long: Enteros de 64 bits (rango: ±9 trillones)
long poblacion = 7800000000L;

// uint: Enteros sin signo de 32 bits (solo positivos)
uint stock = 100u;


//=======================================================================================
//=======================================================================================
[🟣🤖 FUNCIONES Y MÉTODOS COMUNES EN C#]:

// Console.WriteLine(): imprime una o varias cadenas
Console.WriteLine("Hola Mundo");

// GetType(): muestra tipo de dato
Console.WriteLine(variable.GetType());

// String.Length: longitud de una cadena
int longitud = "texto".Length;

// Substring(): extrae parte de una cadena
string parte = "abcdef".Substring(1, 3);  // bcd

// IndexOf(): busca la posición de una subcadena
int pos = "hola mundo".IndexOf("mundo");

// Replace(): reemplaza texto
string reemplazo = "hola mundo".Replace("mundo", "admin");

// Split(): divide una cadena en array
string[] partes = "uno,dos,tres".Split(',');

// Join(): une array en string
string unido = string.Join("-", partes);

// Trim(): elimina espacios al inicio y final
string limpio = "  texto  ".Trim();

// Concatenar strings
string resultado = $"Hola {nombre}";

// Arrays: verificación
bool contiene = array.Contains(3);

// Diccionario: claves y valores
var dict = new Dictionary<string, string> { ["user"] = "admin" };
if (dict.ContainsKey("user")) Console.WriteLine(dict["user"]);

// JSON (requiere System.Text.Json)
using System.Text.Json;
string json = JsonSerializer.Serialize(dict);
var obj = JsonSerializer.Deserialize<Dictionary<string, string>>(json);

// Fecha y hora
Console.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
long timestamp = DateTimeOffset.Now.ToUnixTimeSeconds();
DateTime fecha = DateTime.Parse("2025-01-01");

// Try/catch para manejo de excepciones
try {
    throw new Exception("Error crítico");
} catch (Exception ex) {
    Console.WriteLine(ex.Message);
}

// Terminar ejecución
Environment.Exit(1);


//=======================================================================================
//=======================================================================================
[🟣🤖 ADMINISTRACIÓN DEL SISTEMA EN C#]:

// Ejecutar comandos del sistema
using System.Diagnostics;
string salida;
using (var proceso = new Process()) {
    proceso.StartInfo.FileName = "/bin/bash";
    proceso.StartInfo.Arguments = "-c \"ls -la\"";
    proceso.StartInfo.RedirectStandardOutput = true;
    proceso.StartInfo.UseShellExecute = false;
    proceso.Start();
    salida = proceso.StandardOutput.ReadToEnd();
    proceso.WaitForExit();
}
Console.WriteLine(salida);

// Seguridad: sanitizar argumentos (básico)
string safeArg = arg.Replace("\"", "").Replace(";", "");


//=======================================================================================
//=======================================================================================
[🟣🤖 MANEJO DE ARCHIVOS EN C#]:

using System.IO;

// Leer contenido completo
string contenido = File.ReadAllText("log.txt");

// Escribir y añadir contenido
File.WriteAllText("log.txt", "contenido nuevo");
File.AppendAllText("log.txt", "otra línea\n");

// Leer línea por línea
string[] lineas = File.ReadAllLines("archivo.txt");

// Verificar existencia
if (File.Exists("archivo.txt")) Console.WriteLine("Existe");

// Permisos de archivo (solo básico)
FileInfo fi = new FileInfo("archivo.txt");
bool sePuedeLeer = fi.Exists && fi.Length > 0;

// Eliminar, renombrar, copiar
File.Delete("archivo.tmp");
File.Move("viejo.txt", "nuevo.txt");
File.Copy("origen.txt", "destino.txt", overwrite: true);

// Directorios
Directory.CreateDirectory("logs");
Directory.Delete("logs", recursive: true);

// Listar archivos
string[] archivos = Directory.GetFiles("/etc");
string[] carpetas = Directory.GetDirectories("/etc");

// Filtrado por patrón
string[] txts = Directory.GetFiles(".", "*.txt");

// Basename, dirname, pathinfo
string baseName = Path.GetFileName("/ruta/a/archivo.txt");
string dirName = Path.GetDirectoryName("/ruta/a/archivo.txt");
string extension = Path.GetExtension("/ruta/a/archivo.txt");


//=======================================================================================
//=======================================================================================
[🟣🤖 SESIONES EN ASP.NET CORE]:

// En Startup.cs o Program.cs, agregar servicios de sesión:
// services.AddSession();

// En controller o middleware:
HttpContext.Session.SetString("user", "admin");
string user = HttpContext.Session.GetString("user");
HttpContext.Session.Remove("user");


//=======================================================================================
//=======================================================================================
[🟣🤖 COOKIES EN ASP.NET CORE]:

// Establecer cookie
Response.Cookies.Append("usuario", "admin", new CookieOptions {
    Expires = DateTimeOffset.Now.AddHours(1),
    HttpOnly = true,
    Secure = true,
    SameSite = SameSiteMode.Strict
});

// Leer cookie
string usuario = Request.Cookies["usuario"];

// Eliminar cookie
Response.Cookies.Delete("usuario");


//=======================================================================================
//=======================================================================================
[🟣🤖 EMAILS EN C#]:

using System.Net.Mail;

var mail = new MailMessage("remitente@example.com", "destino@example.com");
mail.Subject = "Asunto";
mail.Body = "Contenido del correo";

var smtp = new SmtpClient("smtp.example.com") {
    Port = 587,
    Credentials = new System.Net.NetworkCredential("usuario", "clave"),
    EnableSsl = true,
};

smtp.Send(mail);


//=======================================================================================
//=======================================================================================
[🟣🤖 BASE DE DATOS EN C#] (SQL Server, MySQL, etc.)

using System.Data;
using System.Data.SqlClient;

using (var conn = new SqlConnection("Server=localhost;Database=mi_db;User Id=usuario;Password=clave;")) {
    conn.Open();
    using (var cmd = new SqlCommand("SELECT * FROM usuarios WHERE email = @correo", conn)) {
        cmd.Parameters.AddWithValue("@correo", email);
        using (var reader = cmd.ExecuteReader()) {
            while (reader.Read()) {
                Console.WriteLine(reader["nombre"]);
            }
        }
    }
}


//=======================================================================================
//=======================================================================================
[🟣🤖 VALIDAR Y SANITIZAR EN C#]:

using System.Text.RegularExpressions;

// Validar email
string email = input.Trim();
bool valido = Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");

// Escapar HTML
string limpio = System.Net.WebUtility.HtmlEncode(input);


//=======================================================================================
//=======================================================================================
[🟣🤖 CRIPTOGRAFÍA Y SEGURIDAD EN C#]:

// Hash SHA256
using System.Security.Cryptography;
using System.Text;

string HashSHA256(string texto) {
    using var sha = SHA256.Create();
    byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(texto));
    return Convert.ToHexString(bytes);
}

// BCrypt con BCrypt.Net-Next
string hash = BCrypt.Net.BCrypt.HashPassword("clave123");
bool ok = BCrypt.Net.BCrypt.Verify("clave123", hash);

// AES (simétrico)
using var aes = Aes.Create();
aes.Key = Encoding.UTF8.GetBytes("clave12345678901"); // 16 bytes
aes.IV = new byte[16];
using var enc = aes.CreateEncryptor();
byte[] cipher = enc.TransformFinalBlock(Encoding.UTF8.GetBytes("texto"), 0, "texto".Length);


//=======================================================================================
//=======================================================================================
[🟣🤖 FORMULARIOS Y SEGURIDAD EN ASP.NET]:

// Leer datos
string nombre = Request.Form["nombre"];

// CSRF con Razor Pages / Controllers
// Incluir @Html.AntiForgeryToken() en el formulario
// Validación automática con [ValidateAntiForgeryToken] en el controlador
