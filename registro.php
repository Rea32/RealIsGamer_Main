<?php 
include 'conn.php';
include 'class/usuario.php';
if(isset($_SESSION['usuarioActivo'])){
   session_close();  
}
    

?>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Real Is Gamer - Registro</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="icon" type="image/x-icon" href="images\favicon.ico">
        <style>
            
        </style>
<script>
/* Funcion AJAX que permite comprobar en tiempo real si el correo del usuario o el nombre de
 * usuario ya existen en la base de datos, enviando estos campos y encargandose el servidor
 * de consultar y responder al usuario en el cliente en tiempo real
 */

function comprobarInfo(input){
    console.log('Aqui');
    const botonEnviar=document.getElementById('btnLogIn');
    campo=input.name;
    valor=input.value;
    info = JSON.stringify(({campo:campo,valor:valor}));

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            if(this.responseText == 0){
                input.style.backgroundColor = 'var( --bs-white)';
                botonEnviar.removeAttribute("disabled");
                const sub = document.getElementsByClassName('subPass');
                if (sub !== undefined){
                    for (elements of sub){
                        elements.remove();
                    }
                }
            }
            else{
                input.style.backgroundColor = 'var( --bs-danger)';
                botonEnviar.setAttribute("disabled","true");
                const csub = document.createElement('sub');
                input.style.backgroundColor = 'var( --bs-orange)';
                csub.innerHTML = "Ese nombre ya esta registrado";
                csub.setAttribute("class","subPass")
                input.insertAdjacentElement("afterend",csub);
            }   
        }
    };
    xmlhttp.open("POST","comprobacionesRegistro.php");
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("info="+info);
}




</script>
<script src="js/validaciones.js"></script>
        <?php 
        if(isset($_POST['signIn'])){
            $conn= conecta();
            $conn->begin_transaction();
            try{
                $user = trim($_POST['user']);
                $tipo_usuario = "user";
                $correo = trim($_POST['correo']);
                $contrasenya = password_hash(trim($_POST['contrasenya']), PASSWORD_DEFAULT);
                //INSERT INTO `usuarios` (`id_usuario`, `user`, `nombre`, `apellido1`, `apellido2`, `tipo_usuario`, `fecha_nac`, `correo`, `contraseña`) VALUES (NULL, 'Rea21', 'Carlos', 'Reales', 'Acon', '', '1986-04-26', 'reales1986@gmail,com', '1234')

                
                $queryI = "INSERT INTO usuarios (id_usuario, user, tipo_usuario, correo, contraseña) VALUES (NULL, ?,?,?,?)";
                $stmt = $conn->prepare($queryI);
                $stmt->bind_param('ssss',$user,$tipo_usuario,$correo,$contrasenya);
                $stmt->execute();
                $id_usuario = $stmt->insert_id;
                $result=$stmt->get_result();


                $plataformas=$_POST['plataformas'];
                $generos=$_POST['generos'];

                $queryI = "INSERT INTO usuario_generos (id_usuario, id_genero) VALUES (?,?)";
                for($i = 0;$i < sizeof($generos);$i++){
                    $stmt = $conn->prepare($queryI);
                    $stmt->bind_param('ss',$id_usuario,$generos[$i]);
                    $stmt->execute(); 
                }

                $queryI = "INSERT INTO usuario_plataformas (id_usuario, id_plataforma) VALUES (?,?)";          
                for($i = 0;$i < sizeof($plataformas);$i++){
                    $stmt = $conn->prepare($queryI);
                    $stmt->bind_param('ss',$id_usuario,$plataformas[$i]);
                    $stmt->execute(); 
                }
                if(!empty($_POST['nombre'])){
                    $nombre = trim($_POST['nombre']);
                    $queryI = "UPDATE usuarios SET nombre = ? WHERE id_usuario = ?";
                    $stmt = $conn->prepare($queryI);
                    $stmt->bind_param('ss',$nombre,$id_usuario);
                    $stmt->execute(); 
                }
                if(!empty($_POST['apellidos'])){
                    $apellidos = trim($_POST['apellidos']);
                    $apellidos = explode(' ',$apellidos);
                    if(sizeof($apellidos) > 1 ){
                        for ($i = 0;$i < 2;$i++) {
                            if($i == 0){
                                $apellido1 = $apellidos[$i];
                            }
                            else{
                                $apellido2=$apellidos[$i];
                            }

                        }  
                    }else{
                         $apellido1=$apellidos[0];
                    }
                    if (isset($apellido2)){
                        $queryI = "UPDATE usuarios SET apellido1 = ?, apellido2 = ? WHERE id_usuario = ?";
                        $stmt = $conn->prepare($queryI);
                        $stmt->bind_param('sss',$apellido1,$apellido2,$id_usuario);
                    }
                    else{
                        $queryI = "UPDATE usuarios SET apellido1 =? WHERE id_usuario = ?";
                        $stmt = $conn->prepare($queryI);
                        $stmt->bind_param('ss',$apellido1,$id_usuario);   
                    }

                    $stmt->execute(); 

                }
                if(!empty($_POST['fecha_nac'])){
                    $fecha_nac = $_POST['fecha_nac'];
                    $queryI = "UPDATE usuarios SET fecha_nac = ? WHERE id_usuario = ?";
                    $stmt = $conn->prepare($queryI);
                    $stmt->bind_param('ss',$fecha_nac,$id_usuario); 
                    $stmt->execute(); 
                }
                 $conn->commit();
            }catch(Exception $e){
                 echo 'Caught exception: ',  $e->getCode().' -> '.$e->getMessage(), "\n";
                 $conn->rollback();
            }
                session_start();
                $usuarioActivo = new \Usuario\Clase\usuario($id_usuario, $user, $tipo_usuario, $correo);
                if(!empty($nombre)){$usuarioActivo->setNombre($nombre);}
                if(!empty($apellido1)){$usuarioActivo->setApellido1($apellido1);}
                if(!empty($apellido2)){$usuarioActivo->setApellido2($apellido2);}
                $usuarioActivo->setGeneros($generos);
                $usuarioActivo->setPlataformas($plataformas);
                if(!empty($fecha_nac)){$usuarioActivo->setFecha_nac($fecha_nac);}
                $_SESSION['usuarioActivo'] = $usuarioActivo;
                desconecta($conn);
                ?>
    
      

    </head>
    <body class='body'>
        <div class="text-center">
            <img style="width:60vw; height:40vw"src="images/registro_exito.png">
            <h1 class="registro_h1 mt-5">Registro realizado con exito</h1>
            <button type="button" class="btn btn-lg bg-third mt-2 mb-2"> <a href="index.php" >Volver</a></button>
            
        </div>
          </body>
        <?php
        }else{
        ?>
        <body class='body'>
        <div class="form mb-5">
           <img class="icon bg-dark p-3 shadow-lg" src="images\logoName.png" alt="" >
           <form id='form' class="row g-4" method="post" onsubmit="return validacion()" action="<?php echo $_SERVER['PHP_SELF']; ?>" >
                <div class="col-md-6">
                    <label><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>Usuario:</label>
                    <input name="user" type="text" class="input form-control" placeholder="Usuario" required minlength="5" maxlength="28" onchange="comprobarInfo(this)">
                </div>
                <div class="col-md-6">
                    <label><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>Correo Electrónico:</label>
                    <input name="correo" type="email" class="input form-control" placeholder="mail@correo.com" onchange="comprobarInfo(this)" onchange= required >
                </div>

                <div class="col-md-5">
                    <label><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>Contraseña:</label>
                    <input name="contrasenya" id="pass1" type="password" class="input form-control" placeholder="Contraseña"  minlength="8" maxlength="28" onchange='comprobarRepPass(this)' required>
                </div>
                <div class="col-md-5">
                    <label><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>Repite contraseña:</label>
                    <input id="pass2" type="password" class="input form-control" placeholder="Repite Contraseña" onchange='comprobarRepPass(this)' required>
                </div>


                <div class="col-4">
                    <label>Nombre:</label>
                    <input name="nombre" type="text" class="form-control" placeholder="Nombre" aria-label="First name">
                </div>
                <div class="col-md-5">
                    <label>Apellidos:</label>
                    <input name="apellidos" type="text" class="form-control" placeholder="Apellidos" aria-label="Last name">
                </div>   
                 <div class="col-md-3">
                    <label>Fecha Nacimiento</label>
                    <input name="fecha_nac" type="date" class="form-control" placeholder="dd/mm/yyyy">
                </div>  
                <label id='labelGen'><b><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>Generos favoritos:</b></label>
                <div class='row g-2'>
                <?php 
                    $conn = conecta();
                    $queryS = "SELECT id_genero,nombre_genero FROM genero";
                    $result = mysqli_query($conn, $queryS);
                    
                    while ($row = mysqli_fetch_assoc($result)) {?>          
                        <div class="generos col-auto">
                            <input class="inputGen" type="checkbox" name="generos[]" value="<?php echo $row['id_genero'] ?>" >
                            <label class='me-auto' for="<?php echo $row['id_genero'] ?>"><?php echo $row['nombre_genero'] ?></label>
                        </div>  
                   <?php }
                ?>
                </div>
                <label id="labelPlat"><b><abbr title="Este campo es obligatorio" style="text-decoration:none">*</abbr>¿Que plataformas son tus favoritas?</b></label>
                <div class='row g-2 mb-3'>
                <?php 
                    $queryS = "SELECT id_plataforma, nombre_plataforma FROM plataforma ORDER BY nombre_plataforma";
                    $result = mysqli_query($conn, $queryS);
                    while($row=$result->fetch_assoc()){ ?>
                        <div class="generos col-auto">
                            <input class="inputPlat" type="checkbox" name="plataformas[]" value="<?php echo $row['id_plataforma'] ?>" >
                            <label for="<?php echo $row['id_plataforma'] ?>"><?php echo $row['nombre_plataforma'] ?></label> 
                        </div>
                        <?php }
                    desconecta($conn);
                ?>
                </div>
                    <p class="position-relative start-100 w-auto">*campos obligatorios</p>
                    <input disabled="false" id="btnLogIn" class="w-100 btn btn-lg bg-third mb-4" type="submit" name="signIn" value="Log In" >
                    
                    
            </form>
             <button class="btn btn-success mb-4"><a href="index.php" class="btn-close-white btn-lg">Volver</a></button>

        </div>
              </body>
            <?php } ?>
        <script src="js/bootstrap.bundle.min.js"></script>
        
        
  
</html>
