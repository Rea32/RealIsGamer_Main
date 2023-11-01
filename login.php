<?php 
session_start();
include 'conn.php';  
include 'class/usuario.php';

/*
 * Verifica si el login es correcto consultando en la tabla usuarios de la BD
 */
function verificarLogIn($conn,$correo,$pass){

    $queryS = "SELECT correo,contraseña FROM usuarios WHERE correo = '$correo'";
    $stmt = $conn->prepare($queryS);
    $stmt ->execute();
    $stmt->bind_result($correo,$hash);
    $stmt->fetch();
        if (password_verify($pass, $hash)) {
             return true;
        } 
        else {
            return false;
        }

}   

?>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <title>Real Is Gamer - Login</title>
       
  

        <link rel="icon" href="images\newlogo.jpg" sizes="32x32" type="images/jpg">
        <link rel="icon" href="images\newlogo.jpg" sizes="16x16" type="images/jpg">
        <link rel="icon" src="images\favicon.ico">
        <link rel="stylesheet" href="css/bootstrap.css">

        
        <style>


          body{
            background-color: var(--secondary-color);
            font-family: 'Yellowtail';
          }
          .form-signin{
              display: flex;
              height: 90vh;
              justify-content: center;
              align-items: center;
          }
          
          .form-floating{
              width: 300px;
          }
          form{
               background-color: var(--primary-color);
               padding: 10px;
               box-shadow: 2px 5px 2px;
               border-radius: 12px;
          }
          .btn{
            font-family: 'Yellowtail';
            color: white;
            font-weight:bolder;
          }
            .btn:hover{
            font-family: 'Megaman';
            opacity: .3;
            background-color: var(--primary-color);
            font-weight:bolder;
          }
          a{
            font-family: 'Yellowtail';
            color: white;
            font-weight:bolder;
            text-decoration: none;

          }
            a:hover{
            font-family: 'Megaman';
            opacity: .3;
            background-color: var(--primary-color);
            font-weight:bolder;
          }
          .icon{
              border-radius: 12px;
              position: relative;
              top:-50px;
          }
        </style>

      </head>
      <body class="text-center bg-primary">
          
        <main class="form-signin" >
        
            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="bg-secondary">
                <img class="icon" src="images\newlogo.jpg" alt="" width="100" height="80">
                <h1 class="h3 mb-10 fw-bold">Please sign in</h1>

                <div class="form-floating mb-4">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="correo">
                    <label for="floatingInput">Correo Electrónico</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pass">
                    <label for="floatingPassword">Contraseña</label>
                </div>
                <div class="checkbox mb-3">
                  <label>
                    <input type="checkbox" value="remember-me"> Remember me
                  </label>
                </div>
<?php if(isset($_POST['signIn'])){
            $correo = $_POST['correo'];
            $pass = $_POST['pass'];
            $conn = conecta();
            if(verificarLogIn($conn,$correo,$pass)){
                $queryS = "SELECT id_usuario,user, nombre, apellido1,apellido2,tipo_usuario,fecha_nac, correo FROM usuarios WHERE correo = ?";
                $stmt = $conn ->prepare($queryS);
                $stmt ->bind_param("s",$correo);
                $stmt ->execute();
                $result = $stmt ->get_result();
                while($row = $result->fetch_assoc()){
                    $usuarioActivo = new Usuario\Clase\usuario($row['id_usuario'],$row['user'],$row['tipo_usuario'],$row['correo']);
                    $usuarioActivo->setNombre($row['nombre']);
                    $usuarioActivo->setApellido1($row['apellido1']);
                    $usuarioActivo->setApellido2($row['apellido2']);                
                    $usuarioActivo->setFecha_nac($row['fecha_nac']);

                }
                $stmt->close();
                $id=$usuarioActivo->getId();
                $queryS1 = "SELECT id_genero FROM usuario_generos WHERE id_usuario = ?";
                $stmt = $conn ->prepare($queryS1);
                $stmt ->bind_param("s", $id);
                $stmt ->execute();
                $result = $stmt ->get_result();
                    
                $i = 0;
                $generos=array();
                while($row = $result->fetch_array()){
                    $generos[$i]=$row[0];
                    $i++;
                   
                }
                
                $usuarioActivo->setGeneros($generos);
                
                $queryS1 = "SELECT id_plataforma FROM usuario_plataformas WHERE id_usuario = ?";
                $stmt = $conn ->prepare($queryS1);
                $stmt ->bind_param("s",$id);
                $stmt ->execute();
                $result = $stmt ->get_result();
                $i = 0;
                $plataformas=array();
                while($row = $result->fetch_row()){
                    $plataformas[$i]=$row[0];
                    $i++;  
                }
                $result->close();
                $usuarioActivo->setPlataformas($plataformas);
                
                $_SESSION['usuarioActivo']=$usuarioActivo;
                
                desconecta($conn);
                header("Location:index.php");
                }else{ ?>
            <p style="color:red"> Usuario o contraseña incorrectas.<br></p> 
                <?php }
                
            }
            
         ?>
            <p>Puedes registarte <a href="registro.php" target="target">aqui</a> </p>
            <button class="w-100 btn btn-lg bg-third" type="submit" name="signIn">Log In</button>
            <!--<p class="mt-5 mb-3 text-muted">© 2017–2021</p>-->
          </form>
            <script src="js/bootstrap.js"></script>

        </main>
          <button type="button" class="btn btn-lg bg-third"> <a href="index.html" >Volver</a></button>

</body>
</html>
