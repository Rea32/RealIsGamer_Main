<?php 


include 'class/juego.php';
include 'class/usuario.php';
include 'class/genero.php';

use Genero\Clase\genero;
session_start();
if(isset($_SESSION['usuarioActivo'])){
    $usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
    $usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']);
    

}
$filename = basename($_SERVER['PHP_SELF']);
$filename = ucfirst(substr($filename,0,strpos($filename,'.')));
if(isset($_REQUEST['genero'])){
    if($_REQUEST['genero']=='todos'){
        unset($_REQUEST['genero']);
    }
}
?>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RealIsGamer - <?php echo $filename ?> </title>
        <link rel="icon" type="image/x-icon" href="images\favicon.ico">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <style>
            .contJuego{
                background-image: var(--bs-grad-pst);
                width: 80vw;
            }
            #titulo{
                font-family: "Yellowtail";
                font-size: 2rem;
                width:15vw;
                padding:5%;
                color:white;
            }
            
            #titulo:hover {
                color: var(--bs-third);
            }
            
            #imgJuego{
                width: 400px;
                height: 220px;
            }
            .gen{
                font-family: 'Adventure';
                text-decoration: none;
                font-weight:bolder;
                font-size: 1.2rem;
                color:white;
            }
            .gen:hover{
                color: var(--bs-third);
            }
            .plat a{
                font-family: 'Yellowtail';
                text-decoration: none;
                font-weight:bolder;
                font-size: 1.2rem;
                color:white;
            }
            .plat a:hover{
                color: var(--bs-third);
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

            }
            
        </style>
        <script src='js/index.js'></script> 
        <script src="js/estilo_puntuaciones.js"></script>

       
    </head>
    <body>
        
        <?php
        include 'cabecera/nav.php';
            
            $conn = conecta(); 
            $result = $conn->query('SELECT COUNT(*) as juegos_totales FROM juego');
            $row = $result->fetch_assoc();
            $num_total_rows = $row['juegos_totales'];
            desconecta($conn);
           
         
            
        ?>
        <form method="post" action="<?php $_SERVER['PHP_SELF'] ?>">
            <select name="genero" id="genero" onchange="this.form.submit()">
                <?php
                    $ids_generos = genero::obtener_id_generos();
                    echo '<option value="Todos">Todos los generos</option>';
                    foreach ($ids_generos as $id_genero) {
                        echo '<option value="'.$id_genero.'">';
                        echo $id_genero;
                        echo '</option>'; 
                    }
                ?>
            </select>
        </form>
        <script src="js/bootstrap.bundle.js"></script>
        <script>
            colorContNota();              
        </script>
       
<?php
define('NUM_ITEMS_BY_PAGE', 6);
$start = 0; $page=false;
if (isset($_GET["page"])) {
        $page = $_GET["page"];
    }

    if ($num_total_rows > 0) {

        if (!$page) {
            $start = 0;
            $page = 1;
        } else {
            $start = ($page - 1) * NUM_ITEMS_BY_PAGE;
        }
    
    
    //calculo el total de paginas
    $total_pages = ceil($num_total_rows / NUM_ITEMS_BY_PAGE);
    
}


    $conn = conecta();
    
  
    $result = $conn->query(
        'SELECT id_juego FROM juego LIMIT '.$start.', '.NUM_ITEMS_BY_PAGE
    );

    
    if ($result->num_rows > 0) { 

        echo '<div class="d-flex flex-column justify-content-center align-items-center" >';
        while ($row = $result->fetch_assoc()) {
            $juego = new Juego\Clase\juego($row['id_juego']);
            $info_juego = $juego->obtenerTodaInfo();
        ?>
            <div class="contJuego d-flex mt-3" id="<?php echo $ids_juegos[$i];?>">
                <div id="notaCont" class="notasConts d-flex justify-content-center align-items-center" style="min-width:80px" >
                        <div class="notas"><?php echo $juego->obtener_puntuacion_usuarios(); ?></div>
                </div>
                <a><img id="imgJuego" src="images/img/<?php echo $info_juego['imagen']; ?>.jpg" alt=<?php echo $info_juego['nombre']; ?>></a>
                <div>
                    <a  href="info.php?id=<?php echo $row['id_juego'] ?>"><h5 id="titulo"><?php echo $info_juego['nombre']; ?></h5></a>
                    <p class="ps-3 "><?php $j=0; foreach ($info_juego['nombre_genero'] as $value) { echo'<a class="gen" href="generos.php?id_genero='.$info_juego['id_genero'][$j].'">'.$value.'</a>  '; $j++;} ?></p>
                    <p class="opis-b ps-3"><?php echo date_format($info_juego['lanzamiento'],"d  M  Y" )?> </p>
                    <p class="ps-3 plat"><?php foreach ($info_juego['id_plataforma'] as $plataforma) { ?><a class="ms-2" href="plataformas.php?id_plataforma=<?php echo $plataforma; ?>" style= "width: 65px; height: 60px;"><img style="width:65px; height:65px;" src="images/plataformas/<?php echo $plataforma ?>.png" ></a><?php } ?></p>
                </div>
                <p class="p-3"><?php echo $info_juego['descripcion']; ?></p>
            </div>
        <?php } 
 
    }
 
  
    echo '<ul class="pagination mt-3">';
 
    if ($total_pages > 1) {
        if ($page != 1) {
            echo '<li class="page-item"><a class="page-link" href="MostrarBD.php?page='.($page-1).'"><span aria-hidden="true">Pag Anterior</span></a></li>';
        }
 
        for ($i=1;$i<=$total_pages;$i++) {
            if ($page == $i) {

                echo '<li class="page-item active"><a class="page-link" href="#">'.$page.'</a></li>';
    
            } else {

                echo '<li class="page-item"><a class="page-link" href="MostrarBD.php?page='.$i.'">'.$i.'</a></li>';
            
            }
                
            
        }
 
        if ($page != $total_pages) {

                echo '<li class="page-item"><a class="page-link" href="MostrarBD.php?page='.($page+1).'"><span aria-hidden="true">Siguiente Página</span></a></li>';
 
        }
    }
    echo '</ul>';
    echo '</div>';

?>
        
    </body>
</html>
