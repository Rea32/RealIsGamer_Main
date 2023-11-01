<?php 
include 'class/juego.php';
include 'class/usuario.php';
include 'class/genero.php';

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
$id_genero = $_REQUEST['id_genero'];
$genero_activo = new Genero\Clase\genero($id_genero);
$nombre_genero = $genero_activo->getNombre_genero();
$id_juegos = $genero_activo->getJuegos();

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
    //var_dump($info_juego);
}
        

     
$queryS = "SELECT descripcion FROM genero WHERE id_genero = '$id_genero'";
$conn = conecta();
$stmt = $conn->query($queryS);
$descripcion = $stmt->fetch_row()[0];
$descripcion = strip_tags($descripcion,'<div><p><h2>');
$descripcion = preg_replace("/\[(editar)?||([1-9][0-9]?)?\]/", "", $descripcion);
$stmt->close();



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
             <h1><?php echo $nombre_genero ?></h1>
        </div>
        <div class="p-5 ms-5 me-5">
            <?php echo $descripcion; ?>
            <h2>Ultimos ejemplos del género</h2>
            <div class="card-body d-xxl-flex justify-content-center align-items-center">
                <?php for($i = sizeof($info_juegos)-1;$i > sizeof($info_juegos)-5;$i--){ ?>

                <div class="card text-bg-primary d-md-flex mb-3" style="width:20%; min-height:31vh">
                    <div class="titSimilar card-header d-flex justify-content-center align-items-center">
                        <form method="post" action="info.php">

                            <input type="submit" name="nombre" value="<?php echo $info_juegos[$i]['nombre'] ?>">
                            <input type="hidden" name="id" value="<?php echo $info_juegos[$i]['id_juego'] ?>">
           
                        </form>
                    </div>
                    <div class="card-body d-flex row-cols-2">
                        <img src="<?php echo $ruta_caratula . $info_juegos[$i]['id_juego'] . $extension_caratula; ?>" class="img-fluid rounded-start" style='width:150px; height:200px; max-height:100%;' alt="caratula <?php echo $info_juego['nombre']; ?>">
                        <div class="contPlat row ms-2">
                            
                            
                            <?php foreach ($info_juegos[$i]['id_plataforma'] as $plataforma){ ?>
                            
                                
                            <a class="bg-primary d-flex col-2 ms-2 p-1" style="width:65px; height:65px;" href="plataformas.php?id_plataforma=<?php echo $plataforma ?>">
                                <img class="logoPlat object-fit-fill" src="images/plataformas/<?php echo $plataforma ?>.png" style="width:60px; height:60px;">
                            </a>
                             
                                
                            
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>
