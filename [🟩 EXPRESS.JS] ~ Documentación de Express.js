//=======================================================================================
//=======================================================================================
// [🟩⚙️ FUNCIONES Y MÉTODOS COMUNES EN NODE.JS CON EXPRESS]:

// Importar módulos esenciales
const express = require('express');
const app = express();
const port = 3000;

// Middleware para parsear JSON en requests
app.use(express.json());

// GET: ruta básica
app.get('/', (req, res) => {
    res.send('Hola Mundo');
});

// POST: recibir datos JSON
app.post('/data', (req, res) => {
    console.log(req.body);  // Acceso al body (objeto JSON)
    res.json({ received: true, data: req.body });
});

// Middleware personalizado (logging simple)
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url} - ${new Date().toISOString()}`);
    next();
});

// Manejo de rutas con parámetros
app.get('/user/:id', (req, res) => {
    const userId = req.params.id;
    res.send(`Usuario ${userId}`);
});

// Query params
app.get('/search', (req, res) => {
    const q = req.query.q || 'Nada';
    res.send(`Buscando: ${q}`);
});

// Escuchar servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});

//=======================================================================================
//=======================================================================================
// [🟩⚙️ ADMINISTRACIÓN DE SISTEMAS / EJECUCIÓN DE COMANDOS]:

const { exec, execSync } = require('child_process');

// Ejecutar comando async
exec('uptime', (error, stdout, stderr) => {
    if (error) {
        console.error(`Error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.error(`stderr: ${stderr}`);
        return;
    }
    console.log(`Uptime:\n${stdout}`);
});

// Ejecutar comando sync (bloqueante)
try {
    const result = execSync('ls -la /var/www');
    console.log(result.toString());
} catch (err) {
    console.error('Error al ejecutar comando:', err);
}

// Sanitizar entrada para comandos (prevención inyección)
const userInput = 'nombreUsuario';
const safeInput = userInput.replace(/[^a-zA-Z0-9_-]/g, '');
exec(`grep ${safeInput} /var/log/syslog`, (e, out) => {
    if (!e) console.log(out);
});

//=======================================================================================
//=======================================================================================
// [🟩⚙️ MANEJO DE ARCHIVOS]:

const fs = require('fs');
const path = require('path');

// Leer archivo (async)
fs.readFile('log.txt', 'utf8', (err, data) => {
    if (err) console.error('Error leyendo archivo:', err);
    else console.log(data);
});

// Escribir archivo (async, sobrescribe)
fs.writeFile('log.txt', 'Nueva entrada\n', err => {
    if (err) console.error(err);
});

// Añadir contenido (append)
fs.appendFile('log.txt', 'Otra línea\n', err => {
    if (err) console.error(err);
});

// Verificar existencia y permisos
fs.access('config.json', fs.constants.R_OK | fs.constants.W_OK, err => {
    if (err) console.log('No existe o sin permisos');
    else console.log('Archivo accesible');
});

// Crear carpeta (mkdir recursivo)
fs.mkdir('logs', { recursive: true }, err => {
    if (err) console.error(err);
});

// Eliminar archivo
fs.unlink('temp.tmp', err => {
    if (err) console.error(err);
});

// Listar archivos en directorio
fs.readdir('/etc', (err, files) => {
    if (!err) console.log(files);
});

// Obtener info archivo
console.log(path.basename('/ruta/a/archivo.txt')); // archivo.txt
console.log(path.dirname('/ruta/a/archivo.txt'));  // /ruta/a

//=======================================================================================
//=======================================================================================
// [🟩⚙️ SESIONES Y COOKIES (con express-session y cookie-parser)]:

const session = require('express-session');
const cookieParser = require('cookie-parser');

app.use(cookieParser());
app.use(session({
    secret: 'clave-secreta', // mantener en .env
    resave: false,
    saveUninitialized: true,
    cookie: {
        secure: false,  // true si usas HTTPS
        httpOnly: true, // no accesible desde JS
        maxAge: 3600000 // 1 hora en ms
    }
}));

// Guardar dato en sesión
app.get('/login', (req, res) => {
    req.session.user = 'admin';
    res.send('Sesión iniciada');
});

// Leer dato de sesión
app.get('/profile', (req, res) => {
    res.send(`Usuario: ${req.session.user || 'anónimo'}`);
});

// Borrar sesión
app.get('/logout', (req, res) => {
    req.session.destroy();
    res.send('Sesión cerrada');
});

//=======================================================================================
//=======================================================================================
// [🟩⚙️ CONEXIONES A BD (ejemplo con MySQL usando mysql2)]:

const mysql = require('mysql2/promise');

async function conectar() {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'pass',
        database: 'mi_db'
    });

    const [rows] = await connection.execute('SELECT * FROM usuarios WHERE email = ?', ['admin@dominio.com']);
    console.log(rows);

    await connection.end();
}

// Llamar función async
conectar().catch(console.error);

//=======================================================================================
//=======================================================================================
// [🟩⚙️ VALIDACIÓN Y SANITIZACIÓN]:

const validator = require('validator');

const email = 'test@dominio.com';

if (validator.isEmail(email)) {
    console.log('Email válido');
}

const safeEmail = validator.normalizeEmail(email);

console.log(safeEmail);

//=======================================================================================
//=======================================================================================
// [🟩⚙️ CRIPTOGRAFÍA Y SEGURIDAD]:

const crypto = require('crypto');

// Hash SHA-256
const hash = crypto.createHash('sha256').update('mensaje').digest('hex');
console.log(hash);

// Hash de contraseña (bcrypt)
const bcrypt = require('bcrypt');
const password = 'clave123';

bcrypt.hash(password, 10, (err, hashed) => {
    if (err) throw err;
    console.log('Hash:', hashed);

    // Verificar contraseña
    bcrypt.compare(password, hashed, (err, res) => {
        if (res) console.log('Contraseña válida');
        else console.log('Contraseña inválida');
    });
});

// Cifrado simétrico AES-256-CBC
const key = crypto.randomBytes(32);
const iv = crypto.randomBytes(16);

function encrypt(text) {
    const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);
    let encrypted = cipher.update(text, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    return encrypted;
}

function decrypt(encrypted) {
    const decipher = crypto.createDecipheriv('aes-256-cbc', key, iv);
    let decrypted = decipher.update(encrypted, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
}

const texto = 'texto secreto';
const cifrado = encrypt(texto);
const descifrado = decrypt(cifrado);

console.log({ cifrado, descifrado });

//=======================================================================================
//=======================================================================================
// [🟩⚙️ MANEJO DE FORMULARIOS Y CSRF]:

const csurf = require('csurf');
const cookieParser2 = require('cookie-parser');

// Configurar middleware para cookies y CSRF
app.use(cookieParser2());
const csrfProtection = csurf({ cookie: true });

app.get('/form', csrfProtection, (req, res) => {
    res.send(`<form action="/process" method="POST">
                <input type="hidden" name="_csrf" value="${req.csrfToken()}">
                <input type="text" name="name">
                <button type="submit">Enviar</button>
              </form>`);
});

app.post('/process', csrfProtection, (req, res) => {
    res.send('Datos recibidos');
});

//=======================================================================================
//=======================================================================================
// [🟩⚙️ EJECUTAR SCRIPT NODE DESDE CONSOLA]:

// node script.js arg1 arg2

console.log('Argumentos:');
process.argv.forEach((val, index) => {
    console.log(`${index}: ${val}`);
});

// Leer entrada estándar
const readline = require('readline');
const rl = readline.createInterface({ input: process.stdin, output: process.stdout });

rl.question('Escribe algo: ', (answer) => {
    console.log(`Entrada: ${answer}`);
    rl.close();
});

//=======================================================================================
//=======================================================================================
// [🟩⚙️ LOGS Y MONITORIZACIÓN]:

const winston = require('winston');

const logger = winston.createLogger({
    level: 'info',
    format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.json()
    ),
    transports: [
        new winston.transports.File({ filename: 'logs/error.log', level: 'error' }),
        new winston.transports.File({ filename: 'logs/combined.log' }),
    ],
});

logger.info('Mensaje informativo');
logger.error('Mensaje de error');

//=======================================================================================
//=======================================================================================
// [🟩⚙️ RECOMENDACIONES DE SEGURIDAD]:

// - Usar helmet para hardening HTTP headers
// - Validar y sanitizar toda entrada de usuario (validator.js)
// - Manejar errores con try/catch y middleware de errores en Express
// - Configurar CORS según necesidades (express cors middleware)
// - Usar HTTPS y cookies seguras (secure, httpOnly, sameSite)
// - Limitar tamaño máximo de body (express.json({limit: '1mb'}))
// - Proteger rutas sensibles con autenticación y autorización

