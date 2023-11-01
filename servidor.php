<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");


$ruta = "images/img/";
$extension=".jpg";

/*
 * Recoge los ids de los juegos filtrados por genero y plataforma anteriormente 
 * y saca al informacion necesaria para mostrarla en la pagina de inicio
 */
if(isset($_POST['peticion'])){
    $peticion= json_decode($_POST['peticion']);
        
        $cont = 0;
        $conn= conecta();
        foreach ($peticion as $key => $value) {
            $queryS="SELECT nombre,imagen,id_juego FROM juego WHERE id_juego = ?";
            $stmt = $conn->prepare($queryS);
            $stmt ->bind_param("i",$value);
            $stmt ->execute();
            $result = $stmt->get_result();
            $respuesta[$cont]=$result->fetch_assoc();
            $respuesta[$cont]['imagen'] = $ruta.$respuesta[$cont]['imagen'].$extension;
             $respuesta[$cont]['genero']='';
            
            $queryS="SELECT nombre_genero FROM genero g INNER JOIN genero_juegos gj ON g.id_genero=gj.id_genero WHERE id_juego = ?";
            $stmt = $conn->prepare($queryS);
            $stmt ->bind_param("i",$value);
            $stmt ->execute();
            $result = $stmt->get_result();

            while($row=$result->fetch_assoc()){
                      $respuesta[$cont]['genero'].= $row['nombre_genero'].'<br> ';
                 }
            $cont++;
        }
        desconecta($conn);
        echo json_encode($respuesta); 
        //echo $peticion -> id1;  
    }
    
    
 
    if(isset($_POST['paquete'])){
        $paquete= json_decode($_POST['paquete']);
        $contGen = 0; $contPlat = 0;
        $conn= conecta();
        //Primero seleccionare los juegos que coinciden en el generos
        foreach ($paquete as $key => $value) {
            if($key == 'generos'){
                foreach ($value as $genero) {
                    $querySG = "SELECT j.id_juego FROM juego j "
                            . "INNER JOIN genero_juegos gj ON j.id_juego = gj.id_juego "
                            . "INNER JOIN genero g ON g.id_genero=gj.id_genero "
                            . "WHERE g.id_genero = ? ";
                    $stmt = $conn ->prepare($querySG);
                    $stmt->bind_param('s', $genero);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    
                    while($row = $result->fetch_row()){
                        
                        $id_juegosG[$contGen]=$row[0];
                        $contGen++;
                    }
                }
                    
            }
            //Despues aquellos coincidentes con las plataformas
            else{
                $cont = 0;
                foreach($id_juegosG as $juegoG){
                    
                    foreach ($value as $plataforma) {
                        $querySP = "SELECT j.id_juego FROM juego j "
                                . "INNER JOIN plataformas_juegos pj ON j.id_juego = pj.id_juego "
                                . "INNER JOIN plataforma p ON p.id_plataforma=pj.id_plataforma "
                                . "WHERE p.id_plataforma = ? AND j.id_juego = ?";
                        $stmt = $conn ->prepare($querySP);
                        $stmt->bind_param('ss', $plataforma,$juegoG);
                        $stmt->execute();
                        $result = $stmt->get_result();
                        if($result->num_rows == 1){
         
                            $id_juegos[$contPlat]=$result->fetch_row()[0];
                            $contPlat++;
                        }
                       
                    }
                }
            }
        }
         desconecta($conn);
        $id_juegos=array_unique($id_juegos); //Eliminamos las ids de juegos repetidos
        $juegos_en_portada = array_rand(array_flip($id_juegos),5);  //Usamos la funcion rand para coger cada vez 5 juegos aleatorios y flip para que en vez de la clave coga el valor
        echo json_encode($juegos_en_portada);
    }
    
    if(isset($_GET['ult_lanz'])){
        $conn= conecta();
        $queryS="SELECT nombre,imagen,id_juego FROM juego ORDER BY lanzamiento DESC LIMIT 10";
        $result = $conn->query($queryS);
        $cont=0;
        while($row=$result->fetch_assoc()){
            foreach ($row as $key => $value) {  
                $respuesta[$cont][$key]=$value;
                $respuesta[$cont]['genero']='';
                if($key == 'id_juego'){
                     $queryS="SELECT nombre_genero FROM genero g INNER JOIN genero_juegos gj ON g.id_genero=gj.id_genero WHERE id_juego = ?";
                     $stmt=$conn->prepare($queryS);
                     $stmt->bind_param('s', $value);
                     $stmt->execute();
                     $result2 = $stmt->get_result();
                     
                     while($row=$result2->fetch_assoc()){
                          $respuesta[$cont]['genero'].= $row['nombre_genero'].'<br> ';
                     }
  
                }
                
            }
           $respuesta[$cont]['imagen'] = $ruta.$respuesta[$cont]['imagen'].$extension;            
            $cont++;
        }
         desconecta($conn);
        echo json_encode($respuesta);
    }

        
        
        
        

  
