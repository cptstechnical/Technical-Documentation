====================================================================================================================================================
[Utilizando clases PDO]:

   # código antiguo (esta forma es la que suelo utilizar pero se queda muy mal en el caso de que existan muchas columnas en la tabla)
    $Pedido = new stdClass();
           $Pedido->NoPedido = $NoPedido;
           $Pedido->HojasFabricadas = $Recalculado->NoHojas;
           $Pedido->Estado = $Recalculado->Estado;
           // Actualizo Pedido
           return $this->Actualizar($Pedido);

# solución para rellenar muchos parámetros de manera automática en vez de declararlos uno a uno
// Datos dinámicos
$Recalculado = (object) $_POST;
//$datosDinamicos = (array) $_POST;
// Datos controlados que quieres forzar
$controlados = [
    'NoPedido' => $NoPedido,
    'Estado' => 'Confirmado' // sobrescribimos el estado original
];
// Combino dinámicos + controlados en un solo paso
$Pedido = (object) array_merge($datosDinamicos, $controlados);
// Resultado listo para guardar
print_r($Pedido);




====================================================================================================================================================
[Utilizando clases PDO]:

# ejemplo de solución para mapear de manera simple 
-----------------------------------------------------------------------------------------------------
class Usuario {
    public $nombre;
    public $email;
    public $edad;

    public function __construct(array $data) {
        foreach ($data as $key => $value) {
            if(property_exists($this, $key)) {
                $this->$key = $value;
            }
        }
    }
}

$usuario = new Usuario($_POST);

$stmt = $pdo->prepare("INSERT INTO usuarios (nombre, email, edad) VALUES (:nombre, :email, :edad)");
$stmt->execute(get_object_vars($usuario));
-----------------------------------------------------------------------------------------------------

# ejemplos de utilización
-----------------------------------------------------------------------------------------------------
1️⃣ Insertar nuevos registros
$usuario = new Usuario($_POST);
$stmt->execute(get_object_vars($usuario));


2️⃣ Leer registros y convertirlos en objetos
$stmt = $pdo->query("SELECT * FROM usuarios WHERE id = 1");
$data = $stmt->fetch(PDO::FETCH_ASSOC);

$usuario = new Usuario($data);
echo $usuario->nombre;


3️⃣ Actualizar registros
$stmt = $pdo->prepare("UPDATE usuarios SET nombre=:nombre, email=:email, edad=:edad WHERE id=:id");
$stmt->execute(array_merge(get_object_vars($usuario), ['id' => 1]));
-----------------------------------------------------------------------------------------------------
