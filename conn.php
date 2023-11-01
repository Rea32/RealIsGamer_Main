<?php
function conecta(){
  //$conn = new mysqli("localhost:3306", "root", "", "juegos2");
  $conn = new mysqli("localhost:3306", "root", "", "real_is_gamer");
  if(mysqli_connect_errno()){
       echo'La conexion no se ha podido realizar';
    }
    return $conn;
}

function desconecta($conn){
    $conn->close();
}
 

