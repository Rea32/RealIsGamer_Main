<?php 
include 'class/juego.php';
include 'class/usuario.php';
include 'class/plataforma.php';

session_start();
if(isset($_SESSION['usuarioActivo'])){
    $usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
    $usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']);
}
$filename = basename($_SERVER['PHP_SELF']);
$filename = ucfirst(substr($filename,0,strpos($filename,'.')));
$ruta_caratula = 'images/caratula_juegos/c';
$extension_caratula = '.jpg';
?>
<?php
$id_plataforma = $_REQUEST['id_plataforma'];


$plataforma_activa = new Plataforma\Clase\plataforma($id_plataforma);
$nombre_plataforma = $plataforma_activa->getNombre();
$id_juegos = $plataforma_activa->getJuegos();

$info_juegos=[];
foreach ($id_juegos as $id_juego) {
    $ejemplos_juegos = new Juego\Clase\juego($id_juego);
    array_push($info_juegos,$ejemplos_juegos->obtenerTodaInfo());
    

}

function array_sort_by(&$arrIni, $col, $order = SORT_ASC)
{
    $arrAux = array();
    foreach ($arrIni as $key=> $row)
    {
        $arrAux[$key] = is_object($row) ? $arrAux[$key] = $row->$col : $row[$col];
        //$arrAux[$key] = strtolower($arrAux[$key]);
    }
    array_multisort($arrAux, $order, $arrIni);
}

array_sort_by($info_juegos, 'lanzamiento');



foreach ($info_juegos as $info_juego) {
    
}
    
$descripcion = $plataforma_activa->getDescripcion();
$hardware = $plataforma_activa->getHardware();


?>
<html>
    <head>
        <?php
            include 'cabecera/head.php';
        ?>
        <style>
            .titSimilar input{              
                border-style: hidden;
                color: var(--third-color);;
            }
            .titSimilar input:hover{
                background-color: #4C96D7;
                color: black;
                opacity: .3;
            }
        </style>
    </head>
    <body>
       <?php
        include 'cabecera/nav.php';
        ?>
        <div class='d-flex justify-content-center'>
            <h1><img class="logo pe-3" src="images/plataformas/<?php echo $id_plataforma.'.png'; ?>"><?php echo $nombre_plataforma ?></h1>
        </div>
        <div class="p-5 ms-5 me-5">
            <div class="contDescImg row">
                <div class="col-9"><?php echo $descripcion; ?></div>
                <img class="col-3" src="images/plataformas/<?php echo $id_plataforma.'img'; ?>.png">
            </div>
            <div class="contDescImg row mb-3">
                <img class="col-4" src="images/plataformas/<?php echo $id_plataforma.'img2'; ?>.jpg">
                <div class="col-8"><?php echo $hardware; ?></div>
            </div>
            <h2>Ultimos ejemplos de la plataforma</h2>
            <div class="card-body d-xxl-flex justify-content-center align-items-center">
                <?php for($i = sizeof($info_juegos)-1;$i > sizeof($info_juegos)-6;$i--){ ?>

                <div class="card text-bg-primary d-md-flex mb-3" style="width:20%; min-height:31vh">
                    <div class="titSimilar card-header d-flex justify-content-center align-items-center">
                        <form method="post" action="info.php">

                            <input type="submit" name="nombre" value="<?php echo $info_juegos[$i]['nombre'] ?>">
                            <input type="hidden" name="id" value="<?php echo $info_juegos[$i]['id_juego'] ?>">
           
                        </form>
                    </div>
                    <div class="card-body d-flex row-cols-2">
                        <img src="<?php echo $ruta_caratula . $info_juegos[$i]['id_juego'] . $extension_caratula; ?>" class="img-fluid rounded-start" style='width:150px; height:200px; max-height:100%;' alt="caratula <?php echo $info_juegos[$i]['nombre']; ?>">
                        <div class="contPlat row-cols-3 ms-3">
                            <?php foreach ($info_juegos[$i]['id_genero'] as $genero){ ?>
                            <a class="me-1 ms-1 col-md-2" href="generos.php?id_genero=<?php echo $genero ?>" style="width: 65px; height: 60px;" ><?php echo $genero ?></a>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        </div>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>
