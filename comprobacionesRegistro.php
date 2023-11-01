<?php
include 'conn.php';
$conn = conecta();
$info= json_decode($_POST['info']);
foreach ($info as $key=> $value) {

    if($key == "campo"){
        $campo = $value;
        
    }
    else{
        $valor = $value;
    }

    
}

    $queryS = "SELECT * FROM usuarios WHERE $campo = '$valor'";
   
    $result = $conn->query($queryS);
    
   echo $result->num_rows;


desconecta($conn);
