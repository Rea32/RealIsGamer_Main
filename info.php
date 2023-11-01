<?php

include 'class/usuario.php';
include 'API/metacritic.php';
include 'API/meristation.php';
include 'class/juego.php';
include 'API/pushsquare.php';
session_start();
if(isset($_SESSION['usuarioActivo'])){
    $usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
    $usuarioActivo = new Usuario\Clase\usuario(
            $usuarioActivo['id'], 
            $usuarioActivo['user'], 
            $usuarioActivo['tipo'], 
            $usuarioActivo['correo']
            );
}
if(isset($_POST['nombre_juego'])){
    $nombre_juego= $_POST['nombre_juego']; 
    $nuevo_juego = new \Juego\Clase\juego();

    if($nuevo_juego->existe_juego_en_BD($nombre_juego) > 0){
        $id_juego=$nuevo_juego->existe_juego_en_BD($nombre_juego);
        echo "El juego que estas intentando añadir ya existe";
        $juego_en_BD= new Juego\Clase\juego($id_juego);
        $info_juego=$nuevo_juego->obtenerTodaInfo();
        unset($_POST['nombre_juego']);

        header('Location:info.php?id='.$id_juego);

    }
    else{

        $meristation_api = new Meristation\API\MeristationAPI();
        $meristation_api->getMeristationPage($nombre_juego);
        $info_response = $meristation_api->getMeristationInfo();
        if(isset($info_response['error'])){
            echo '<div class="d-flex justify-content-center"><h1>El juego que estas intentando no existe en Meristation</h1><a><button href="index.php">Volver</button></a></div>';
            
            
        }
        else{
            $info_response['nombre']=$nombre_juego;
            if($nuevo_juego->existe_desarrollador_en_BD($info_response['developers'][0])){
                $info_response['developers'][0]=$nuevo_juego->existe_desarrollador_en_BD($info_response['developers'][0]);

                if($nuevo_juego->insertar_juego_en_BD($info_response)){
                    $id_juego = $nuevo_juego->existe_juego_en_BD($nombre_juego);
                    echo "El juego se ha introducido correctamente";
                    unset($_POST['nombre_juego']);
                    header('Location:info.php?id='.$id_juego);
                }
                else{
                    echo "Error al introducir el juego en la base de datos";
                }
            }
            else{
                
                 $info_response['developers'][0] = $nuevo_juego->insertar_desarrollador_en_BD($info_response['developers'][0]);
                  if($nuevo_juego->insertar_juego_en_BD($info_response)){
                    echo "El juego se ha introducido correctamente";
                    $id_juego = $nuevo_juego->existe_juego_en_BD($nombre_juego);
                    unset($_POST['nombre_juego']);
                    header('Location:info.php?id='.$id_juego);
                }
                else{
                    echo "Error al introducir el juego en la base de datos";
                }

            }

        }


    }
}else{
$metacritic_api = new Metacritic\API\MetacriticAPI();

$id_juego = $_REQUEST['id'];
//$juego1 = new juego($id_juego);
if(!empty($rutaImg)){
    $rutaImg = $_POST['imagen'];
}


$ruta_logo = 'images/logo_juegos/';
$ruta_caratula = 'images/caratula_juegos/c';
$extension_logo = '.png';
$extension_caratula = '.jpg';
//Nos conectamos a la base de datos local de RealIsGamer

$nuevo_juego = new \Juego\Clase\juego($id_juego);
$info_juego = $nuevo_juego->obtenerTodaInfo();


$metacritic_api->getMetacriticPage($info_juego['nombre']);
$score_response = $metacritic_api->getMetacriticScores();
if(array_key_exists('error', $score_response)){
    $score_response['metascritic_score'] = '';
}

$pushsquare_api = new Pushsquare\API\PushsquareAPI();
$pushsquare_api->getPushsquarePage($info_juego['nombre']);
$image_response = $pushsquare_api->getPushsquareScreenshots();
$carpeta='images/img/';
$carpeta_abierta = opendir($carpeta);
$existe_imagen = False;
if ($carpeta_abierta){
    while(($entry = readdir($carpeta_abierta)) != False){
        if($entry == $id_juego.'.jpg'){
            $existe_imagen = True;
            $image_response = $carpeta.$id_juego.'.jpg';
            break;
        }
    }
}

if(!$existe_imagen){
    $destino = $carpeta.$id_juego.'.jpg';

    if (!is_array($image_response) && !empty($image_response)){

        file_put_contents($destino, file_get_contents($image_response));
    }
    else{
         $image_response = '';
         $continue;
    }
}

/*
 * Si se puntua un juego, debemos saber si esa puntuacion ya existe o no por parte
 * de ese usuario, y si es así, utilizar un update en vez de un insert
 */
if(isset($_POST['puntuar'])){
    $juegos_puntuados = $usuarioActivo->getJuegosPuntuados();
    $id_juego = $_POST['id'];
    $puntuacion = $_POST['puntuacion']/10;
    if(in_array($id_juego,$juegos_puntuados)){
        $usuarioActivo->puntuarJuego($id_juego, $puntuacion,'update');
    }  
    else{
        $usuarioActivo->puntuarJuego($id_juego, $puntuacion,'insert');
        
    }
    unset($_POST['puntuar']);
}

?>
<!DOCTYPE html>

<html>
    <head>
       <?php include 'cabecera/head.php'; ?>
        <style>
            .principal{
                width:100%;

            }
            #imgJuego{
                height: 80vh;
            }
            #similares{
                background:transparent;

            }
            .logo{
                opacity: .9;
                color:white;

            }
            .info{

                width: fit-content;
            }
            .info1{
                background-image:  var(--bs-grad-ps);
            }
            .info2{
                background-image:  var(--bs-grad-st);
            }
            .logo{
                margin-top: 20%;
            }
            .titSimilar input{              
                
                border-style: hidden;
                color: var(--third-color);;
            }
            .titSimilar input:hover{
                background-color: #4C96D7;
                color: black;
                opacity: .3;
            }
input[type=range] {
  height: 32px;
  -webkit-appearance: none;
  margin: 10px 0;
  width: 100%;
}
input[type=range]:focus {
  outline: none;
}
input[type=range]::-webkit-slider-runnable-track {
  width: 100%;
  height: 16px;
  cursor: pointer;
  animate: 0.2s;
  box-shadow: 0px 0px 0px #000000;
  background: #B1B1B1;
  border-radius: 25px;
  border: 1px solid #8A8A8A;
}
input[type=range]::-webkit-slider-thumb {
  box-shadow: 1px 1px 2px #828282;
  border: 2px solid #EC4C4C;
  height: 23px;
  width: 35px;
  border-radius: 6px;
  background: #4C96D7;
  cursor: pointer;
  -webkit-appearance: none;
  margin-top: -5px;
}
input[type=range]:focus::-webkit-slider-runnable-track {
  background: #B1B1B1;
}
input[type=range]::-moz-range-track {
  width: 100%;
  height: 16px;
  cursor: pointer;
  animate: 0.2s;
  box-shadow: 0px 0px 0px #000000;
  background: #B1B1B1;
  border-radius: 25px;
  border: 1px solid #8A8A8A;
}
input[type=range]::-moz-range-thumb {
  box-shadow: 1px 1px 2px #828282;
  border: 2px solid #EC4C4C;
  height: 23px;
  width: 35px;
  border-radius: 6px;
  background: #4C96D7;
  cursor: pointer;
}
input[type=range]::-ms-track {
  width: 100%;
  height: 16px;
  cursor: pointer;
  animate: 0.2s;
  background: transparent;
  border-color: transparent;
  color: transparent;
}
input[type=range]::-ms-fill-lower {
  background: #B1B1B1;
  border: 1px solid #8A8A8A;
  border-radius: 50px;
  box-shadow: 0px 0px 0px #000000;
}
input[type=range]::-ms-fill-upper {
  background: #B1B1B1;
  border: 1px solid #8A8A8A;
  border-radius: 50px;
  box-shadow: 0px 0px 0px #000000;
}
input[type=range]::-ms-thumb {
  margin-top: 1px;
  box-shadow: 1px 1px 2px #828282;
  border: 2px solid #EC4C4C;
  height: 23px;
  width: 35px;
  border-radius: 6px;
  background: #4C96D7;
  cursor: pointer;
}
input[type=range]:focus::-ms-fill-lower {
  background: #B1B1B1;
}
input[type=range]:focus::-ms-fill-upper {
  background: #B1B1B1;
}

.notas{
    font-weight: bolder;
    color:white;
    font-size: 2.5rem;
    -webkit-text-stroke: 1px black;
}
.notasConts{
    border: 1px solid black;
    border-radius: 10%;
    width: 80px;
    height: 80px;
    background-color:#B1B1B1;
}
.genCont{
    text-decoration: none;
    color:black;
}
.genCont:hover{
    text-decoration: none;
    color:var(--bs-third);
}
        </style>
        <script src="js/estilo_puntuaciones.js"></script>
        <script>
            function recogerPuntuacionUsuario(){
                let h5 = document.getElementById('nota');
                let puntuacion = <?php isset($usuarioActivo) ? $puntuacion= $usuarioActivo->recogerPuntuacionUsuario($id_juego): $puntuacion = -1;echo $puntuacion; ?>;
                let inputPuntuar = document.getElementById('puntuar');
                if(puntuacion >= 0){
                    h5.innerHTML = puntuacion;
                    inputPuntuar.value = 'Cambiar Puntuacion';
                }else{
                    h5.innerHTML = '?';
                    inputPuntuar.value = 'Puntuar';
                }

            }

        </script>


    </head>
    <body  class="text-center">
        <?php
        include 'cabecera/nav.php';
        ?>

        <div id="body" class="body d-inline-flex">
            <div class="principal">
                <div class="card text-bg-dark " style="max-width: 1344px; width: 100vw; height: 756px;">
                    <img src="<?php echo $image_response ?>" class="card-img"   alt="<?php echo $info_juego['nombre']; ?> Imagen no disponible" style=" min-width: 480px; width:100%;height: 100%;">
                    <div class="card-img-overlay">
                        <p class="card-text"></p>
                        <img src="<?php echo $ruta_logo . $info_juego['imagen'] . $extension_logo; ?>" alt='' class="logo" style="max-height: 400px;max-width: 1000px;opacity:.8">
                    </div>
                </div>
                <div class="info" style="max-width: 1344px">
                    <div class="card mb-3" style="width:70vw; max-width: 1344px;">
                        <div class="row g-0">
                            <div class="caratula d-md-flex col-md-4" style="height:100%">
                                <img src="<?php echo $ruta_caratula . $id_juego . $extension_caratula; ?>" class="img-fluid rounded-start" style='width:500px; height:700px; max-height:33em;' alt="caratula <?php echo $info_juego['nombre']; ?>">
                            </div>
                            <div class="info1 col-md-3">
                                <div class="card-body text-start">
                                    <h4 class="titPrincipal card-title">Titulo:</h4><p class="titCont"><?php echo $info_juego['nombre']; ?></p>
                                    <h5 class="fechaLanz card-text">Fecha de Lanzamiento:</h5><p class="fechaCont"><?php echo date_format($info_juego['lanzamiento'],"d  M  Y" ); ?></p>
                                    <h5 class="desarrollador card-text">Desarrollador:</h5><p class="devCont"><?php echo $info_juego['desarrollador'][0]; ?></p>
                                    <h5 class="gen card-text">Genero:</h5><?php $i = 0; foreach ($info_juego['nombre_genero'] as $nombre_gen){
                                        echo '<form action="generos.php" method="post"><input type="hidden" name="id_genero" value="'.$info_juego['id_genero'][$i].'" ><input class="genCont" type="submit" name="nombre_genero" value="'.$nombre_gen.'" ></form>';
                                   $i++;} ?>
                                    
                                    <h5 class="persp card-text">Perspectiva:</h5><p class="perspCont"><?php echo $info_juego['perspectiva']; ?></p>
                                    <h5 class="plat card-text">Plataformas:</h5><p class="platCont"><?php foreach ($info_juego['id_plataforma'] as $plataforma) {
                                            echo '<a href="plataformas.php?id_plataforma='.$plataforma.'"><img class="logoPlat me-3" src="images/plataformas/'.$plataforma.'.png" style="width:60px; height:60px;"></a>';
                                        } ?></p>
                                    <h5 class="plat card-text">Nota:</h5><p class="platCont"><?php echo $score_response['metascritic_score']; ?></p>
                                </div>

                            </div>
                            <div class="info2 col-md-3">
                                <div class="card-body text-start">
                                    <h5 class="persp card-text">Descripción:</h5><p class="descrCont"><?php echo $info_juego['descripcion']; ?></p>
                                </div>
                            </div>
                            <!-- NOTAS USUARIOS -->
                             <?php $juego_activo = new Juego\Clase\juego($id_juego); ?>
                                <div class="info3 col-md-2 bg-third">
                                <div class="card-body d-flex flex-column justify-content-around align-items-center h-100 ">
                                    <h5 class="userscore card-text">Notas usuarios:</h5>
                                    <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">
                                        <div class='d-flex flex-column align-items-center' >
                                            <div class="notasConts d-flex justify-content-center align-items-center" id="notaCont"><h5 for="customRange1" class="notas form-label" id="nota"></h5></div>
                                            <input type="hidden" name="id" value="<?php echo $id_juego ?>">
                                            
                                            <input type="range" class="form-range" name="puntuacion"  id="customRange1" min="0" max="100"  oninput="ponerNota(this)" >
                                        </div>
                                  
                                         <span tabindex="0" data-bs-toggle="popover" data-bs-trigger=" <?php isset($usuarioActivo) ? $enabled = 'disabled' : $enabled = 'hover focus'; echo $enabled; ?>" data-bs-content="Debes estar logeado para puntuar los juegos">
                                             <input class="btn btn-success" id="puntuar" type="submit" value="Puntuar"  name="puntuar"  <?php isset($usuarioActivo) ? $enabled = 'enabled' : $enabled = 'disabled'; echo $enabled;?>>
                                        </span>

                                     </form>

                                    <div class="d-flex flex-column align-items-center">
                                       
                                        <div id="notaCont" class="notasConts d-flex flex-column justify-content-center" >
                                            <div class="notas puntMedia"><?php echo $juego_activo->obtener_puntuacion_usuarios(); ?></div>
                                        </div>
                                        <p class="userScoreCont" ></p>
                                        <p class="o2">Puntuacion Media de Usuarios</p>
                                        <p id="totalVotos"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            <div id="similares" class="d-">
                <h1>Juegos Similares</h1>
                <?php  
                $juegos_similares =  new Juego\Clase\juego();
                $infoJuegosG = $juegos_similares->juegos_similares($info_juego);
                foreach ($infoJuegosG as $infoJuegoG) { 
                    $indice = strpos( $infoJuegoG['nombre'],':');                   
                    if($indice > 0){
                        $nombre = explode(':',$infoJuegoG['nombre']);
                        $infoJuegoG['nombre']=$nombre[0]."\n".$nombre[1];
                   
                    }
                    echo '<div class="card text-bg-primary mb-3" style="max-width: 18rem;">
                        <div >
                            <form class="titSimilar card-header" method="post" action="'.$_SERVER['PHP_SELF'].'" style="overflow:hidden;">
                                <input class="shadow" type="submit" name="id" value="'.$infoJuegoG['nombre'].'">
                                <input type="hidden" name="id" value="'.$infoJuegoG['id_juego'].'">
                            </form>
                        </div>
                          <img src="images/img/'.$infoJuegoG['imagen'].'.jpg" class="card-img" alt="...">

                        <div class="card-body"><div class="genSimilar card-title d-flex justify-content-center row">';
                        $i = 0;
                        foreach ($infoJuegoG['id_plataforma'] as $value) {
                           echo '<a class="bg-primary d-flex col-3 ms-2 mb-2 p-1" style="width:65px; height:65px;" href="plataformas.php?id_plataforma=<?php echo $plataforma ?>">
                                    <img class="logoPlat object-fit-fill" src="images/plataformas/'.$value.'.png" style="width:60px; height:60px;">
                                </a>';
                            
                            $i++;
                        
                        }
                        
                    echo'  </div>      
                        </div>
                    </div>';
                                    
             }?>
             
            </div>

        </div>

                <script src="js/bootstrap.bundle.js"></script>
   
                <script type="text/javascript">
                    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
                    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
                </script>

                <script>

                    
                    <?php if(isset($usuarioActivo)){
                        echo 'recogerPuntuacionUsuario();';
                    }?>
                      
                    colorContNota();

                </script>
                
    </body>
</html>
<?php }