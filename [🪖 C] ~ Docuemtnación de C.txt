#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <mysql/mysql.h>

/*************************************************************************************
 * 🪖🔠 FUNCIONES Y MÉTODOS COMUNES EN C
 *************************************************************************************/

/* printf(): imprime salida a consola */
printf("Hola Mundo\n");

/* strlen(): obtiene longitud de un string */
size_t len = strlen("texto");

/* strcpy(): copia un string a otro */
char destino[20];
strcpy(destino, "origen");

/* strcat(): concatena dos strings */
strcat(destino, " añadido");

/* strcmp(): compara dos strings */
if (strcmp("abc", "abc") == 0) {
    printf("Son iguales");
}

/* malloc() / free(): asignación y liberación de memoria dinámica */
char *buffer = malloc(100);
if (buffer != NULL) {
    strcpy(buffer, "dinámico");
    free(buffer);
}

/* calloc(): asignación de memoria e inicialización a cero */
int *array = calloc(10, sizeof(int));
free(array);

/* sizeof(): obtener el tamaño de un tipo de dato o estructura */
size_t size = sizeof(int);  // 4 bytes en sistemas comunes

/*************************************************************************************
 * 🪖🔠 MANEJO DE ARCHIVOS EN C
 *************************************************************************************/

/* fopen(): abre un archivo con el modo especificado */
FILE *file = fopen("log.txt", "w");  // "r", "w", "a", etc.
if (file == NULL) {
    perror("Error al abrir archivo");
    exit(1);
}

/* fprintf(): escribir en el archivo */
fprintf(file, "Nueva línea en archivo\n");

/* fclose(): cierra el archivo */
fclose(file);

/* fgets(): leer una línea desde el archivo */
char buffer[256];
FILE *file_read = fopen("log.txt", "r");
if (file_read != NULL) {
    while (fgets(buffer, sizeof(buffer), file_read)) {
        printf("%s", buffer);
    }
    fclose(file_read);
}

/* file_exists(): comprobar si un archivo existe */
if (access("log.txt", F_OK) == 0) {
    printf("El archivo existe");
}

/* remove(): eliminar un archivo */
remove("log.txt");

/*************************************************************************************
 * 🪖🔠 MANEJO DE MEMORIA EN C
 *************************************************************************************/

/* malloc(): asignación de memoria dinámica */
int *arr = malloc(5 * sizeof(int));  // 5 enteros
if (arr == NULL) {
    fprintf(stderr, "Error al asignar memoria\n");
    exit(1);
}
arr[0] = 10;  // Usar memoria
free(arr);  // Liberar memoria

/* realloc(): redimensionar memoria dinámica */
arr = realloc(arr, 10 * sizeof(int));
if (arr == NULL) {
    fprintf(stderr, "Error al redimensionar memoria\n");
    exit(1);
}

/*************************************************************************************
 * 🪖🔠 SEGURIDAD Y VALIDACIONES EN C
 *************************************************************************************/

/* Validar punteros nulos */
int *ptr = NULL;
if (ptr == NULL) {
    fprintf(stderr, "Error: puntero nulo\n");
}

/* Sanitizar input (eliminar salto de línea de fgets) */
char input[100];
fgets(input, sizeof(input), stdin);
input[strcspn(input, "\n")] = 0;  // Eliminar newline

/* Validación de rango */
int num = 42;
if (num < 0 || num > 100) {
    printf("Número fuera de rango\n");
}

/*************************************************************************************
 * 🪖🔠 CONEXIÓN A MYSQL EN C (usando libmysqlclient)
 *************************************************************************************/

/* Conexión a MySQL */
MYSQL *conn;
conn = mysql_init(NULL);
if (conn == NULL) {
    fprintf(stderr, "Error al inicializar MySQL: %s\n", mysql_error(conn));
    exit(1);
}

/* Conectar a la base de datos */
if (mysql_real_connect(conn, "localhost", "usuario", "clave", "mi_db", 0, NULL, 0) == NULL) {
    fprintf(stderr, "Error de conexión: %s\n", mysql_error(conn));
    mysql_close(conn);
    exit(1);
}

/* Ejecutar una consulta SQL */
if (mysql_query(conn, "SELECT * FROM usuarios")) {
    fprintf(stderr, "Error en la consulta: %s\n", mysql_error(conn));
    mysql_close(conn);
    exit(1);
}

/* Obtener el resultado de la consulta */
MYSQL_RES *result = mysql_store_result(conn);
if (result == NULL) {
    fprintf(stderr, "Error al obtener resultados: %s\n", mysql_error(conn));
    mysql_close(conn);
    exit(1);
}

/* Imprimir los resultados */
MYSQL_ROW row;
while ((row = mysql_fetch_row(result)) != NULL) {
    printf("ID: %s, Nombre: %s\n", row[0], row[1]);
}

/* Liberar resultados y cerrar conexión */
mysql_free_result(result);
mysql_close(conn);

/*************************************************************************************
 * 🪖🔠 HILOS (THREADS) EN C CON PTHREADS
 *************************************************************************************/

/* Crear un hilo con pthreads */
#include <pthread.h>

void* tarea(void* arg) {
    printf("Hilo en ejecución\n");
    return NULL;
}

int main() {
    pthread_t thread;
    if (pthread_create(&thread, NULL, tarea, NULL) != 0) {
        perror("Error al crear hilo");
        return 1;
    }
    pthread_join(thread, NULL);  // Esperar a que termine el hilo
    return 0;
}

/*************************************************************************************
 * 🪖🔠 SOCKETS EN C (TCP CLIENT/SERVER)
 *************************************************************************************/

/* Servidor TCP */
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main() {
    int server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == -1) {
        perror("Error al crear socket");
        return 1;
    }

    struct sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(8080);
    address.sin_addr.s_addr = INADDR_ANY;

    if (bind(server_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
        perror("Error en bind");
        return 1;
    }

    listen(server_fd, 3);
    printf("Esperando conexiones...\n");

    int new_socket = accept(server_fd, NULL, NULL);
    if (new_socket < 0) {
        perror("Error al aceptar conexión");
        return 1;
    }

    char* message = "Hola, cliente\n";
    send(new_socket, message, strlen(message), 0);

    close(new_socket);
    close(server_fd);
    return 0;
}

/* Cliente TCP */
int main() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        perror("Error al crear socket");
        return 1;
    }

    struct sockaddr_in server_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(8080);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    if (connect(sock, (struct sockaddr*)&server_addr, sizeof(server_addr)) == -1) {
        perror("Error al conectar");
        return 1;
    }

    char buffer[1024];
    recv(sock, buffer, sizeof(buffer), 0);
    printf("Mensaje del servidor: %s\n", buffer);

    close(sock);
    return 0;
}
