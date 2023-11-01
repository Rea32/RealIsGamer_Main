<?php

include 'API/meristation.php';
include 'class/juego.php';


$nombre_juego= $_POST['nombre_juego']; 
/*$genres=['Acción','RPG'];
$id_juego=1;
*/
$nuevo_juego = new \Juego\Clase\juego();
//$nuevo_juego->insertar_genero_juego_en_BD($id_juego, $genres);
if($nuevo_juego->existe_juego_en_BD($nombre_juego)>0){
    $id_juego=$nuevo_juego->existe_juego_en_BD($nombre_juego);
    echo "El juego que estas intentando añadir ya existe";
    $juego_en_BD= new Juego\Clase\juego($id_juego);
    $info_juego=$nuevo_juego->obtenerTodaInfo();
    header('Location:info.php?id='.$info_juego['id_juego']);

}
else{

    $meristation_api = new Meristation\API\MeristationAPI();
    $meristation_api->getMeristationPage($nombre_juego);
    $info_response = $meristation_api->getMeristationInfo();
    if(isset($info_response['error'])){
        echo "El juego que estas intentando no existe en Meristation";
    }
    else{
        $info_response['nombre']=$nombre_juego;
        //print_r($info_response);
        if($nuevo_juego->existe_desarrollador_en_BD($info_response['developers'][0])){
            $info_response['developers'][0]=$nuevo_juego->existe_desarrollador_en_BD($info_response['developers'][0]);
            
            if($nuevo_juego->insertar_juego_en_BD($info_response)){
                echo "El juego se ha introducido correctamente";
                header('Location:info.php?id='.$nuevo_juego->getId());
            }
            else{
                echo "Error al introducir el juego en la base de datos";
            }
        }
        else{
            print_r($info_response);
             $info_response['developers'][0] = $nuevo_juego->insertar_desarrollador_en_BD($info_response['developers'][0]);
              if($nuevo_juego->insertar_juego_en_BD($info_response)){
                echo "El juego se ha introducido correctamente";
                header('Location:info.php?id='.$nuevo_juego->getId());
            }
            else{
                echo "Error al introducir el juego en la base de datos";
            }
             
        }
        //$nuevo_juego->ingresar_en_BD($info_response);
    }
    
    
}