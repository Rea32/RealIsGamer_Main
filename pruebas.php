<?php
include 'class/usuario.php';
include 'class/juego.php';
//$usuario_activo = new usuario(3, 'Raulito86', 'user', 'darkwarrior@hotmail.com');
/*$result=$usuario_activo->puntuarJuego(1, 8.2);
print_r($result);*/
//$juegos_puntuados = $usuario_activo->getJuegosPuntuados();
$juego_actual =  new Juego\Clase\juego(181);
$puntuaciones = $juego_actual->obtener_puntuacion_usuarios($juego_actual->getId());
print_r($puntuaciones);
