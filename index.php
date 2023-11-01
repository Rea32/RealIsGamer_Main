<?php
session_start();

include 'class/juego.php';
include 'class/usuario.php';

if(isset($_SESSION['usuarioActivo'])){
    $usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
    $usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']);  
}
else{
    header("Location:index.html");
}


?>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RealIsGamer</title>
        <link rel="icon" type="image/x-icon" href="images\favicon.ico">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <script src='js/index.js'></script> 
    </head>
    <body>
       <?php include 'cabecera/nav.php'; ?>
        <div class="d-md-grid justify-content-end mt-2 me-2" style="position:absolute; right:20px">
           <abbr title="Mas sugerencias"> 
               <button type="button" class="btn btn-outline-primary btn-lg" onclick="pedirJuegosInd(paquetePrefUser())"><img src="images/icons/sincronizar.png" alt="alt"/></button>
            </abbr>
        </div>
        <div id="bodyCont">
            <div id="cont">
                <div id="img1" class="card img" >
                    <form action="info.php" method="post" >  
                        <input name='imagen'  type="submit"  value="" style="width: 800px; height: 400px; background-size: cover; font-size: 0px">
                        <input class="id" type="hidden" name='id' value="">
                        <div class="contentTit">
                            <h2 class="titulo"></h2>            
                        </div>
                        <div class="contentGen">
                            <h3 class="genero"></h3>
                        </div>
                    </form> 

                </div>
                <div id="img2" class="img">
                    <form action="info.php" method="post" >  
                        <input name='imagen'  type="submit"  value="" style="width: 800px; height: 400px; background-size: cover; font-size: 0px">
                        <input class="id" type="hidden" value="" name='id'>
                        <div class="contentTit">
                            <h2 class="titulo"></h2>

                        </div>
                        <div class="contentGen">
                            <h3 class="genero"></h3>
                        </div>
                    </form>

                </div>
                <div id="img3" class="img">
                    <form action="info.php" method="post" > 
                        <input name='imagen'  type="submit"  value="" style="width: 800px; height: 400px; background-size: cover; font-size: 0px">
                        <input class="id" type="hidden" value="" name='id'>
                        <div class="contentTit">
                            <h2 class="titulo"></h2>

                        </div>
                        <div class="contentGen">
                            <h3 class="genero"></h3>
                        </div>
                    </form>

                </div>
                <div id="img4" class="img">
                    <form action="info.php" method="post" > 
                       <input name='imagen'  type="submit"  value="" style="width: 800px; height: 800px; background-size: cover; font-size: 0px; background-position: center" >
                        <input class="id" type="hidden" value="" name='id'>
                        <div class="contentTit2">
                            <h2 class="titulo"></h2>

                        </div>
                        <div class="contentGen">
                            <h3 class="genero"></h3>
                        </div>
                    </form>

                </div>

                <div id="img5" class="img">
                    <form action="info.php" method="post" > 
                        <input name='imagen'  type="submit"  value="" style="width: 800px; height: 400px; background-size: cover; font-size: 0px">
                        <input class="id" type="hidden" value="" name='id'>
                        <div class="contentTit">
                            <h2 class="titulo"></h2>

                        </div>
                        <div class="contentGen">
                            <h3 class="genero"></h3>
                        </div>
                    </form>

                </div>
            </div>

        </div>
        <?php                            include 'cabecera/footer.php';
?>
        <script>
            
            let prefUser;
            function paquetePrefUser(){
                let generos = [];
                let plataformas = [];
                <?php
                    foreach ($usuarioActivo->getGeneros() as $value) {
                        ?>generos.push('<?php echo $value; ?>');console.log('<?php echo $value; ?>');
                                
                <?php } ?>
                                    <?php
                    foreach ($usuarioActivo->getPlataformas() as $value) {
                        ?>plataformas.push('<?php echo $value; ?>');
                <?php } ?>
                    console.log(plataformas);
                    prefUser=({"generos":generos,"plataformas":plataformas});
                    return prefUser;
            }
            pedirJuegosInd(paquetePrefUser());
            


                   

        </script>
        <script src="js/bootstrap.bundle.min.js"></script>    
         

        

    </body>
</html>

