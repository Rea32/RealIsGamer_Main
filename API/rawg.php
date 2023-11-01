<?php
// URL de la API
$url = 'https://api.rawg.io/api/games';

// Realizar la solicitud GET
$response = file_get_contents($url);

// Verificar si la solicitud fue exitosa
if ($response !== false) {
    // Decodificar la respuesta JSON a un array
    $data = json_decode($response, true);

    if ($data) {
        // Puedes acceder a los datos de la API a través de $data
        var_dump($data);
    } else {
        echo "Error al decodificar la respuesta JSON.";
    }
} else {
    echo "Error al realizar la solicitud GET.";
}
