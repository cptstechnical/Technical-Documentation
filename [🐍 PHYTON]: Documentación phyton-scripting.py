=======================================================================================
=======================================================================================
[🐍⚙️ FUNCIONES Y MÉTODOS COMUNES EN PYTHON]:
# print(): imprime texto o variables
print("Hola Mundo")

# type(): muestra el tipo de dato
print(type(123))

# len(): longitud de strings, listas, etc.
print(len("texto"))

# str(), int(), float(): conversión de tipos
num = int("123")

# isinstance(): verifica tipo de dato
if isinstance(num, int):
    print("Es entero")

# slicing: obtener parte de string o lista
print("abcdef"[1:4])  # bcd

# find(): posición de substring (-1 si no encuentra)
print("hola mundo".find("mundo"))

# replace(): reemplaza texto
print("hola mundo".replace("mundo", "admin"))

# split(): divide string en lista
partes = "uno,dos,tres".split(",")

# join(): une lista en string
print("-".join(partes))

# strip(): elimina espacios al inicio y final
print("  texto  ".strip())

# append(): añade elemento a lista
lista = [1,2]
lista.append(3)

# in: verifica existencia en lista o string
if 3 in lista:
    print("Encontrado")

# dict.get(): obtener valor de diccionario con default
d = {"user": "admin"}
print(d.get("user", "no existe"))

# json.dumps(): convierte a JSON string
import json
j = json.dumps(d)

# json.loads(): JSON string a dict/lista
obj = json.loads(j)

# open(): abre archivo, soporta modos 'r', 'w', 'a'
with open("file.txt", "r") as f:
    contenido = f.read()

# escribir en archivo
with open("log.txt", "a") as f:
    f.write("entrada nueva\n")

# os.path.exists(): verifica existencia de archivo o carpeta
import os
print(os.path.exists("config.ini"))

# os.remove(): elimina archivo
os.remove("archivo.tmp")

# os.rename(): renombra o mueve archivo/carpeta
os.rename("old.txt", "new.txt")

# os.makedirs(): crea directorios recursivamente
os.makedirs("logs", exist_ok=True)

# os.listdir(): lista archivos/carpetas
print(os.listdir("/etc"))

# shutil.copy(): copia archivo
import shutil
shutil.copy("origen.txt", "destino.txt")

# datetime para fechas y horas
from datetime import datetime
print(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

# time.time(): timestamp actual en segundos
import time
print(time.time())

# subprocess para ejecutar comandos shell
import subprocess
output = subprocess.check_output(["ls", "-la"]).decode()

# logging para manejo de logs
import logging
logging.basicConfig(filename="/var/log/py.log", level=logging.INFO)
logging.info("Operación realizada")

# try/except para manejo de excepciones
try:
    raise Exception("Error crítico")
except Exception as e:
    logging.error(str(e))

# requests para peticiones HTTP (requiere instalación)
import requests
response = requests.get("https://api.example.com")
print(response.text)


=======================================================================================
=======================================================================================
[🐍⚙️ ADMINISTRACIÓN DE SISTEMAS EN PYTHON]:
import subprocess

# Ejecutar comando y obtener salida completa
salida = subprocess.getoutput("df -h")

# Ejecutar comando y obtener salida en bytes
salida_bytes = subprocess.check_output(["uptime"])

# Ejecutar comando con shell (cuidado con inyección)
salida = subprocess.run("ls -la", shell=True, capture_output=True, text=True).stdout

# Escapar argumentos para seguridad (no usar shell=True)
import shlex
cmd = ["ls", "-la", shlex.quote("/ruta con espacios")]
output = subprocess.run(cmd, capture_output=True, text=True).stdout

# syslog con syslog library (para integración con systemd/journal)
import syslog
syslog.syslog(syslog.LOG_INFO, "Mensaje de info del sistema")


=======================================================================================
=======================================================================================
[🐍⚙️ MANEJO DE ARCHIVOS EN PYTHON]:
# Leer archivo completo
with open("log.txt", "r") as f:
    contenido = f.read()

# Escribir texto (sobrescribe)
with open("log.txt", "w") as f:
    f.write("entrada nueva\n")

# Añadir al final
with open("log.txt", "a") as f:
    f.write("otra entrada\n")

# Leer línea por línea
with open("config.ini", "r") as f:
    lineas = f.readlines()

# Verificar permisos
import os
print(os.access("data.txt", os.R_OK))  # lectura
print(os.access("data.txt", os.W_OK))  # escritura

# Eliminar archivo
os.remove("archivo.tmp")

# Crear carpeta recursiva
os.makedirs("logs", exist_ok=True)

# Eliminar carpeta vacía
os.rmdir("logs")

# Listar archivos en carpeta
archivos = os.listdir("/etc")

# Buscar archivos con patrón (glob)
import glob
txts = glob.glob("*.txt")

# Manejar archivos comprimidos (zip)
import zipfile
with zipfile.ZipFile("archivo.zip", "r") as zip_ref:
    zip_ref.extractall("/ruta/destino")


=======================================================================================
=======================================================================================
[🐍⚙️ SESIONES Y COOKIES (CON FLASK COMO EJEMPLO)]:
from flask import Flask, session, request, make_response

app = Flask(__name__)
app.secret_key = "clave_secreta"

@app.route("/")
def index():
    # Usar sesión
    session["user"] = "admin"

    # Leer cookie
    usuario = request.cookies.get("usuario", "invitado")

    # Crear cookie
    resp = make_response(f"Hola {usuario}")
    resp.set_cookie("usuario", "admin", max_age=3600, httponly=True, secure=True, samesite='Strict')
    return resp

if __name__ == "__main__":
    app.run()


=======================================================================================
=======================================================================================
[🐍⚙️ ENVÍO DE EMAILS]:
import smtplib
from email.message import EmailMessage

msg = EmailMessage()
msg.set_content("Contenido del correo")
msg["Subject"] = "Asunto"
msg["From"] = "remitente@example.com"
msg["To"] = "destino@example.com"

with smtplib.SMTP("localhost") as s:
    s.send_message(msg)


=======================================================================================
=======================================================================================
[🐍⚙️ BASES DE DATOS (USANDO SQLITE3 COMO EJEMPLO)]:
import sqlite3

conn = sqlite3.connect("mi_db.sqlite")
cursor = conn.cursor()

cursor.execute("SELECT * FROM usuarios WHERE email = ?", (email,))
resultados = cursor.fetchall()

conn.close()


=======================================================================================
=======================================================================================
[🐍⚙️ VALIDAR Y SANITIZAR DATOS]:
import re

# Validar email simple
email = "test@dominio.com"
pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
if re.match(pattern, email):
    print("Email válido")

# Sanitizar texto (remover caracteres no deseados)
import html
safe_text = html.escape("<script>alert('x')</script>")


=======================================================================================
=======================================================================================
[🐍⚙️ CRIPTOGRAFÍA Y SEGURIDAD]:
import hashlib
import bcrypt
from cryptography.fernet import Fernet

# Hash SHA256
hash_sha = hashlib.sha256(b"mensaje").hexdigest()

# bcrypt para contraseñas (instalar bcrypt)
password = b"clave123"
hashed = bcrypt.hashpw(password, bcrypt.gensalt())
if bcrypt.checkpw(password, hashed):
    print("Autenticado")

# Cifrado simétrico con Fernet (cryptography)
key = Fernet.generate_key()
cipher = Fernet(key)
token = cipher.encrypt(b"texto secreto")
texto = cipher.decrypt(token)


=======================================================================================
=======================================================================================
[🐍⚙️ FORMULARIOS Y SEGURIDAD (Ejemplo con Flask)]:
from flask import request, session
import secrets

# Generar CSRF token
session["csrf"] = secrets.token_hex(32)

# Validar CSRF token recibido
if request.form.get("csrf") == session.get("csrf"):
    # Token válido
    pass

