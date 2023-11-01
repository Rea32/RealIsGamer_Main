<?php
session_start();
include 'conn.php';
include 'class/usuario.php';
$usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
$usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']); 

function verificarCambioDato($original, $nuevo) {
    if ($original !== $nuevo) {

        return true;
    }
    return false;
}

if (isset($_POST['modificar'])) {

    $nombre = $_POST['nombre'];
    $apellido1 = $_POST['apellido1'];
    $apellido2 = $_POST['apellido2'];
    $fecha_nac = $_POST['fecha_nac'];
    $plataformas = $_POST['plataformas'];
    $generos = $_POST['generos'];
    $id = $usuarioActivo->getId();
    try {

        $conn= conecta();
        $queryD1 = "DELETE FROM usuario_generos WHERE id_usuario=?";
        $stmt = $conn->prepare($queryD1);
        $stmt->bind_param('s', $id);
        $stmt->execute();
        $stmt->close();

        $queryI1 = "INSERT INTO usuario_generos (id_usuario, id_genero) VALUES (?,?)";
        for ($i = 0; $i < sizeof($generos); $i++) {
            $stmt = $conn->prepare($queryI1);
            $stmt->bind_param('ss', $id, $generos[$i]);
            $stmt->execute();
        }

        $queryD2 = "DELETE FROM usuario_plataformas WHERE id_usuario=?";
        $stmt = $conn->prepare($queryD2);
        $stmt->bind_param('s', $id);
        $stmt->execute();
        $stmt->close();

        $queryI2 = "INSERT INTO usuario_plataformas (id_usuario, id_plataforma) VALUES (?,?)";
        for ($i = 0; $i < sizeof($plataformas); $i++) {
            $stmt = $conn->prepare($queryI2);
            $stmt->bind_param('ss',$id, $plataformas[$i]);
            $stmt->execute();
            $stmt->close();
        }
        
    } catch (Exception $e) {
        echo 'Caught exception: ', $e->getCode() . ' -> ' . $e->getMessage(), "\n";
        $conn->rollback();
    }
    $conn->commit();
    $usuarioActivo->setNombre($nombre);
    $usuarioActivo->setApellido1($apellido1);
    $usuarioActivo->setApellido2($apellido2);
    if(!empty($fecha_nac)){$usuarioActivo->setFecha_nac($fecha_nac);}
    $usuarioActivo->setGeneros($generos);
    $usuarioActivo->setPlataformas($plataformas);
    $_SESSION['usuarioActivo'] = $usuarioActivo;
    $usuarioActivo = $_SESSION['usuarioActivo']->printObject($usuarioActivo);
    $usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']); 
}
?>
<!DOCTYPE html>

<html>
    <head>
        <?php include 'cabecera/head.php'; ?>
            <style>
                .generos, .plataformas{
                    font-size: 1.2rem;
                }
            </style>
            </head>
            <body class="perfil">
                <form method='post' action='<?php echo $_SERVER['PHP_SELF']; ?>' onsubmit="return validacion()" onclick="comprobarCheckeados()">
                    <div class="text-center row g-3 mt-5">
                        <div class="col-12"><img class='rounded-3' src="images/avatar vergil.png"></div>
                        <h3 class="col-12"><?php echo $usuarioActivo->getUser(); ?></h3>
                        <div class='col-4'><label>Nombre: </label> <input class="form-control"  value='<?php echo $usuarioActivo->getNombre(); ?>' name='nombre' type='text'></div>
                        <div class='col-4'><label>Apellido 1: </label> <input class="form-control"  value='<?php echo $usuarioActivo->getApellido1(); ?>' name='apellido1' type='text'></div>
                        <div class='col-4'><label>Apellido 2: </label> <input class="form-control"  value='<?php echo $usuarioActivo->getApellido2(); ?>' name='apellido2' type='text'></div>
                        <div class='col-6'><label>Correo Electrónico: </label><input class="form-control"   value='<?php echo $usuarioActivo->getCorreo(); ?>' disabled></div>
                        <div class='col-6'><label>Fecha_Nac: </label><input class="form-control"  type='date' value='<?php echo $usuarioActivo->getFecha_nac(); ?>' name='fecha_nac'></div>

                    </div>
                <div class="accordion" id="accordionExample">

                    <div class="accordion-item mt-3 " >
                        <h2 class="accordion-header" >
                            <button class="accordion-button collapsed bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne"  >
                                Generos favoritos
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample"  >
                            <div class=' accordion-body row  mb-3'>
                                <div id='generos' class="generos row">
                                    <?php
                                    $conn = conecta();
                                    $queryS = "SELECT id_genero, nombre_genero FROM genero ORDER BY nombre_genero";
                                    $result = mysqli_query($conn, $queryS);
                                    while ($row = $result->fetch_assoc()) {
                                        ?>
                                    <div class="col-3 p-2">
                                       <?php if (in_array($row['id_genero'],$usuarioActivo->getGeneros())) {
                                            ?>
                                            
                                            <input onclick="camposGenYPlatVacios()" class="inputGen" type="checkbox" name="generos[]" value="<?php echo $row['id_genero'] ?>" checked > 

                                        <?php } else { ?>
                                            <input onclick="camposGenYPlatVacios()" class="inputGen" type="checkbox" name="generos[]" value="<?php echo $row['id_genero'] ?>">
                                        <?php } ?>
                                        <label for="<?php echo $row['id_genero'] ?>"><?php echo $row['nombre_genero'] ?></label> 
                                    </div>
                                        <?php
                                    }

                                    desconecta($conn);
                                    ?>
                                </div>
                            </div>

                        </div>
                    </div>
                
                    <label id="labelGen"></label>
                    <div class="accordion-item  mb-3" >
                        <h2 class="accordion-header" >
                            <button class="accordion-button collapsed bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo"  >
                                Plataformas favoritas
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample"  >
                            <div class='accordion-body row mb-3'>
                                <div id='plataformas' class="plataformas row">
                                  
                                    <?php
                                    $conn = conecta();
                                    $queryS = "SELECT id_plataforma, nombre_plataforma FROM plataforma ORDER BY nombre_plataforma";
                                    $result = mysqli_query($conn, $queryS);
                                    while ($row = $result->fetch_assoc()) { ?>
                                          <div class="col-3 p-2">

                                                
                                        <?php if (in_array($row['id_plataforma'], $usuarioActivo->getPlataformas())) {
                                            ?>
                                      
                                            <input onclick="camposGenYPlatVacios()" class="inputPlat" type="checkbox" name="plataformas[]" value="<?php echo $row['id_plataforma'] ?>" checked >

                                        <?php } else { ?>
                                            <input onclick="camposGenYPlatVacios()" class="inputPlat" type="checkbox" name="plataformas[]" value="<?php echo $row['id_plataforma'] ?>">
                                        <?php } ?>
                                            <label for="<?php echo $row['id_plataforma'] ?>"><?php echo $row['nombre_plataforma'] ?></label> 
                                        </div>


                                        <?php
                                    }

                                    desconecta($conn);
                                    ?>
                                      
                                </div>
                            </div>
                        </div>
                    </div>
                    <label id="labelPlat"></label>
                    </div>
                    <script>

                        function comprobarCheckeados() {

                            const modificar = document.getElementById('modificar');



                            modificar.removeAttribute('disabled');




                        }
                    </script>
                    <input id="modificar"  class="btn-secondary btn-lg" type='submit' value="Modificar" name='modificar' disabled="false">
                    

                </form>
                <button class="btn btn-success"><a href="index.php" class="btn-close-white btn-lg">Volver</a></button>
                <script src="js/bootstrap.js"></script>
                <script src="js/alerts.js"></script>
                <script src="js/validaciones.js"></script>
            </body>
</html>
