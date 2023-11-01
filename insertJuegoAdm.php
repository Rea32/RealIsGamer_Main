<!DOCTYPE html>
<?php      session_start(); ?>


<html>
    <head>
        <?php include 'cabecera/head.php' ?>
        <style>
            @font-face {
                font-family: 'Yellowtail';
                src: url('fonts\Yellowtail-Regular.otf');
            }
            @font-face {
                font-family: 'Megaman';
                src: url('fonts\megaman_2.ttf');
            }
            header{
                display: flex;
                justify-content: center;
                font-family: "Yellowtail";
            }
            #body{
                display: flex;
                flex-direction: column;
                margin-top: 1%;
            }
            #allCategories{
                display: flex;
                align-items: center;
                margin-top: 5%;
                margin-right: 10%;
                margin-left: 10%;
            }
            .col{
                display:flex;
                flex-direction: column;
                margin: 5%;
                flex-wrap: wrap;
            }
            .contCategoria{
                display: flex;
                flex-direction: column;
                 margin: 5%;
                
            }
            #button{
               display: flex;
               justify-content: center;
               margin-top: 30px;
            }
            
            #btnSubmit{
                width: 180px;
                height: 40px;
            }
   
            :root{
                --primary-color:#4C96D7;
                --secondary-color:#B1B1B1;
                --third-color:#EC4C4C;
            }
            [data-bs-theme="primary"] {
            --bs-body-color: var(--primary-color);
            --bs-body-color-rgb: var(--primary-color);
            --bs-body-bg: var(--secondary-color);
            --bs-tertiary-bg-rgb: var(--primary-color);
            --bs-nav-link-color:white;

          }
          body{
            background-color: var(--secondary-color);
          }
          .navbar{
            background-color: rgba(0, 0, 0, 0.888);

          }
          li{
            color: var(--third-color);
          }
          .nav-link{
            color:var(--third-color);
          }

          .nav-link:hover{
            color:var(--primary-color);
          }
          .nav-link:active{
            color:white;
          }
        </style>

        <script>
            function OrdenSaga(){
                const saga = document.getElementById('saga');
                const ordenSaga = document.getElementById('ordenSaga');
                if(saga.value != "null"){
                    
                    ordenSaga.style.display = "block";
                    sagaSelect = saga.value;
                    peticionTabla(sagaSelect);
                    
                }
                else{
                    ordenSaga.style.display = "none";
                }
            }
        function peticionTabla(peticion){
                
                const xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText != "vacio"){
                            respuesta = JSON.parse(this.responseText);
                            console.log(respuesta);
                            tablaOrdenSaga(respuesta);
                        }
                    }
                };
            xmlhttp.open("GET","consultarSaga.php?peticion="+peticion);
            xmlhttp.send();
            
            }
            
            function tablaOrdenSaga(juegosSaga){
                
             
               const select = document.getElementById("nSaga");
               const oldOption = document.querySelectorAll(".juegos");
               if(oldOption.length > 0){
                   for (option of oldOption){
                       option.remove();
                   }
               }
               if(juegosSaga.length > 0){
                    let i = 0;
                    let j = 1;
                    while(i < juegosSaga.length){
                        if(j < juegosSaga[i].orden){
                            const option = document.createElement("option");
                            option.innerHTML = j + " - ";
                            option.setAttribute("class","juegos");
                            option.setAttribute("value",j);
                            select.appendChild(option);
                            j++;
                        }

                        else{
                            const option = document.createElement("option");
                            option.innerHTML = juegosSaga[i].orden + " - " + juegosSaga[i].Juego;
                            option.setAttribute("class","juegos");
                            console.log(option);
                            console.log(juegosSaga[i].Juego);
                            select.appendChild(option);
                            i++; j++;
                        }
   
                   }
                   for(k = 0; k < 5; k++){
                                const option = document.createElement("option");
                                option.innerHTML = j + " - ";
                                option.setAttribute("class","juegos");
                                option.setAttribute("value",j);
                                select.appendChild(option);
                                j++;
                    }
               }
               else{
                   for( i = 0; i < 10;i++){
                    
                        const option = document.createElement("option");
                        option.innerHTML = i + " - ";
                        option.setAttribute("class","juegos");
                        option.setAttribute("value",i);
                        console.log(option);
                        select.appendChild(option);
                   }
               }
              
              
               
            }
        </script>
        <script src="js/ftp.js"></script>

    </head>
    <body>
    <?php 

    include 'class/usuario.php';
   
    if(isset($_SESSION['usuarioActivo'])){
        $usuarioActivo = Usuario\Clase\usuario::printObject($_SESSION['usuarioActivo']);
        $usuarioActivo = new Usuario\Clase\usuario($usuarioActivo['id'], $usuarioActivo['user'], $usuarioActivo['tipo'], $usuarioActivo['correo']);
    }


    include 'conn.php';

    if (isset($_POST['anadir'])){
        $conn =conecta();
        $nombre = trim($_POST['nombre']);
        $idSaga = $_POST['idSaga'];
        $idDesarrollador = $_POST['desarrollador'];
        $lanazamiento = $_POST['lanzamiento'];
        if(isset($_POST['multijugador'])){$multijugador = $_POST['multijugador'];}      
        $perspectiva = $_POST['perspectiva'];
        $ordenSaga = $_POST['ordenSaga'];
        //mysqli_begin_transaction($conn);
        
        if($idSaga == "null"){
            
            $queryI="INSERT INTO juego(nombre,id_desarrollador,lanzamiento,perspectiva,solo_multijugador) VALUES (?,?,?,?,?)";
            $stmt = $conn->prepare($queryI);
            $stmt ->bind_param("sissi",  $nombre,$idDesarrollador, $lanazamiento,$perspectiva,$multijugador);
            $stmt ->execute();
        }else{
            $queryI="INSERT INTO juego(nombre,id_saga,id_desarrollador,lanzamiento,perspectiva,solo_multijugador) VALUES (?,?,?,?,?,?)";
            $stmt = $conn->prepare($queryI);
            $stmt ->bind_param("ssissi",  $nombre, $idSaga,$idDesarrollador, $lanazamiento,$perspectiva,$multijugador);
            $stmt ->execute();
            $juego =$stmt->insert_id;
            $queryISaga="INSERT INTO orden_saga_juegos(id_saga,id_juego,orden) VALUES (?,?,?)";
            $stmt2 = $conn->prepare($queryISaga);
            $stmt2 ->bind_param("iii",$idSaga,$juego,$ordenSaga);
            $stmt2 ->execute();
            $queryI="INSERT INTO juego(imagen) VALUES (?)";
            $stmt = $conn->prepare($queryI);
            $stmt ->bind_param("s",$juego);
            $stmt ->execute();
        }
        
    if($stmt->affected_rows ==1){
        $plataformas[] =$_POST['plataformas'];
        $genero=$_POST['genero'];
        $juego =$stmt->insert_id;
        
        for($i=0;$i<sizeof($plataformas[0]);$i++){
            $plataformaID = $plataformas[0][$i];
            $queryI="INSERT INTO plataformas_juegos(id_plataforma,id_juego) VALUES (?,?)";
            $stmt = mysqli_prepare($conn, $queryI);
            $stmt ->bind_param("si",$plataformaID,$juego);
            $result = mysqli_execute($stmt);
            
        }
            $queryI="INSERT INTO genero_juegos(id_genero,id_juego) VALUES (?,?) ";
            $stmt = mysqli_prepare($conn, $queryI);
            $stmt ->bind_param("si",$genero,$juego);
            $result = mysqli_execute($stmt);
            
       
        ?>
    <div id='notificacion'>
        <h2 style='margin-left:30%; margin-right:30%; justify-content:center;'>Has añadido <br><span style="color:#ec4c4c; font-family: 'Megaman';"><?php echo $nombre ?></span><br> a la Base de Datos</h2>

    <?php }else{ 
          echo '<h2>Ha habido un problema.Vuelva a intentarlo mas tarde </h2>'; 
    }?>

        <button id="volver" style='margin-left:50%; margin-right:50%;'> <a href="index.php">Volver</a></button>
    </div> <?php }else{
        
        
        $conn = conecta();
        $queryS = "SELECT id_desarrollador, nombre_desarrollador FROM desarrollador ORDER BY nombre_desarrollador";
        $result = mysqli_query($conn, $queryS);
        $desarrolladores=[];
        while($fila=mysqli_fetch_assoc($result)){
            $desarrolladores[]=$fila;
           
        }
        $queryS = "SELECT id_saga, nombre FROM saga_juegos ORDER BY nombre";
        $result = mysqli_query($conn, $queryS);
        $sagas=[];
        while($fila=mysqli_fetch_assoc($result)){
            $sagas[]=$fila;
        }
        $queryS = "SELECT id_genero,nombre_genero FROM genero";
        $result = mysqli_query($conn, $queryS);
        $generos = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $generos[] = $row;
        }
        
        $queryS = "SELECT id_plataforma, nombre_plataforma FROM plataforma ORDER BY nombre_plataforma";
        $result = mysqli_query($conn, $queryS);
        $plataformas = [];
        while($row=$result->fetch_assoc()){
            $plataformas[]=$row;
           
        }
        
        $perspectivas = array('RV-First Person','RV-Third Person','Third Person','God Vision','Isometric','Scroll','First Person','Cenital','Lateral','Gestión de Menus','First & Third Person');
        sort($perspectivas);

        $queryInsert ="INSERT INTO Juego(nombre, id_desarrollador,id_saga,lanzamiento, perspectiva)  VALUES ('Tales of Onogoro', 1,'2022-03-17', 'RV-First Person')";
        // put your code here
        ?>
        <?php include 'cabecera/nav.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <div id="body">
   
        <header><h1>Introduce los datos del juego</h1></header>
       
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
            <div id="allCategories">
                <div class="col">
                
                    <div class="contCategoria">
                        <label>Nombre: </label>
                        <input type="text" name="nombre">
                    </div>
                    <div class="contCategoria">
                    <label>Desarrollador: </label>
                        <select name="desarrollador">

                            <?php for($i=0;$i<sizeof($desarrolladores);$i++){ ?>
                                <option value="<?php echo $desarrolladores[$i]['id_desarrollador'];?>"><?php echo $desarrolladores[$i]['nombre_desarrollador']; ?></option>

                            <?php } ?>

                        </select>
                    </div>
                    <div class="contCategoria">
                         <label>Parte de la saga: </label>
                         <select name='idSaga' id="saga" onclick="OrdenSaga()">
                              <option value="null" >No forma parte de ninguna saga</option>
                            <?php for($i=0;$i<sizeof($sagas);$i++){ ?>
                                <option value="<?php echo $sagas[$i]['id_saga'];?>"><?php echo $sagas[$i]['nombre']; ?></option>

                            <?php } ?>
                                <option name="nuevaSaga" >Añadir saga</option>
                        </select>
                         <span id="ordenSaga" style="display:none;"> 
                             <label>Orden de la saga:</label>
                              <select name='ordenSaga' id="nSaga">
                                  <option value="null" >Historias Independientes</option>
                              </select>
                         </span>
                        
                    </div>
                </div>
                <div class="col">
                    
                    <div class="contCategoria">
                        <label>Fecha de lanzamiento: </label>
                        <input type="date" name="lanzamiento">
                    </div>
                    <div class="contCategoria">
                        <label>Genero: </label>
                        <select name="genero" >
                             <?php for($i=0;$i<sizeof($generos);$i++){ ?>
                            <option value="<?php echo $generos[$i]['id_genero'] ?>"><?php echo $generos[$i]['nombre_genero'] ?></option>
                            <?php } ?>
                        </select>
                        <span>
                            <label>Solo Multijugador: </label>
                            <input type="checkbox" name="multijugador" value="1" >
                        </span>
                    </div>

                    <div class="contCategoria">
                        <label>Perspectiva: </label>
                        <select name="perspectiva" >
                             <?php for($i=0;$i<sizeof($perspectivas);$i++){ ?>
                            <option><?php echo $perspectivas[$i] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="col">
                     <label>Plataformas: </label>
                    <div class="contPlataformas">

                        
                             <?php for($i=0;$i<sizeof($plataformas);$i++){ ?>
                            <input type="checkbox" name="plataformas[]" value="<?php echo $plataformas[$i]['id_plataforma'] ?>" >
                            <label for="<?php echo $plataformas[$i]['id_plataforma'] ?>"><?php echo $plataformas[$i]['nombre_plataforma'] ?></label>
                            
                            <?php
                            if($i % 2 == 0){
                                echo '<br>';
                             }} ?>
                       
                    </div>
                </div>
            </div>
            <div id="button"> <input id="btnSubmit" type="submit" value="Añadir" name="anadir"> </div>
           
        </form>
        </div>
       
    <?php } ?>


    </body>
</html>