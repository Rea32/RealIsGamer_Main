<?php
include 'conn.php';
$conn = conecta();
$idSaga = $_REQUEST['peticion'];
//echo $idSaga;
$queryS = "SELECT J.nombre as Juego, SJ.nombre as Saga, orden FROM saga_juegos SJ INNER JOIN orden_saga_juegos OSJ ON SJ.id_saga=OSJ.id_saga  INNER JOIN juego J ON OSJ.id_juego=J.id_juego WHERE OSJ.id_saga = $idSaga ORDER BY orden" ;
$result = mysqli_query($conn, $queryS);
$juegosSaga = [];
while ($row = mysqli_fetch_assoc($result)) {
    $juegosSaga[] = $row;
}

echo json_encode($juegosSaga);