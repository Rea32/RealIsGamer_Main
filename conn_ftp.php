<?php
$ftp_server = "localhost";
$ftp_username = "Rea";
$ftp_password = "Quantico2023";

// Conexión al servidor FTP
$conn_id = ftp_connect($ftp_server);


// Iniciar sesión
//$login_result = ftp_login($conn_id, $ftp_username, $ftp_password);

//if ($conn_id && $login_result) {
if ($conn_id) {
   // Conexión y autenticación exitosa
   // Aquí puedes realizar operaciones de FTP como subir, descargar, eliminar archivos, etc.
   // Puedes utilizar las funciones FTP de PHP para eso, como ftp_put(), ftp_get(), ftp_delete(), etc.
   // Ejemplo: ftp_put($conn_id, "archivo_destino.txt", "archivo_local.txt", FTP_BINARY);
} else {
   // Error al conectar o iniciar sesión en el servidor FTP
   echo "Error al conectar o iniciar sesión en el servidor FTP.";
}

// Cerrar la conexión FTP
ftp_close($conn_id);


