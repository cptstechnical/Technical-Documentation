====================================================================================================================================================
[Utilizando clases PDO]:

   # código antiguo
    $Pedido = new stdClass();
           $Pedido->NoPedido = $NoPedido;
           $Pedido->HojasFabricadas = $Recalculado->NoHojas;
           $Pedido->Estado = $Recalculado->Estado;
           // Actualizo Pedido
           return $this->Actualizar($Pedido);

# solución para rellenar muchos parámetros de manera automática en vez de declararlos uno a uno
// Valores que vienen dinámicamente (ej: POST, o resultado de otro proceso)
$datosDinamicos = (array) $Recalculado; // convertir a array si es objeto
// Valores controlados que quieres forzar
$controlados = [
    'NoPedido' => $NoPedido,
    'Estado' => $Recalculado->Estado
];
// Creo objeto vacío
$Pedido = new stdClass();
// Mapear automáticamente todos los campos dinámicos
foreach ($datosDinamicos as $key => $value) {
    $Pedido->$key = $value;
}
// Sobrescribir con valores controlados
foreach ($controlados as $key => $value) {
    $Pedido->$key = $value;
}
// Actualizo Pedido
return $this->Actualizar($Pedido);




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
