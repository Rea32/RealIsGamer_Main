<?php

 echo '<nav class="navbar navbar-expand-lg" >
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                '; isset($_SESSION["usuarioActivo"]) ?  $href="index.php": $href="index.html";echo'
                <a href= "';echo $href;echo'">
                    <div class="navbar-brand">
                        <img id="logo" src="images\newlogo.jpg" alt="Logo" width="50" height="50"  class="align-text-middle">
                        <img class="navbar-brand" src="images\brandname.png" width="200" height="50">
                    </div>
                </a>




                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="d-flex mt-1" role="search" action="info.php" method="post">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="nombre_juego">
                        <button class="btn btn-outline-success" type="submit" name="search">Search</button>
                    </form>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0  ms-4">                    

                        <li class="nav-item dropdown" >
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Añadir
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" id="btn_add_juego" href="'; if (isset($_SESSION["usuarioActivo"])){echo "insertJuegoAdm.php";}echo'"> Juego</a></li>
                                <li><a class="dropdown-item" href="#">Desarrolladora</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                         <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Listado de juegos
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="MostrarBD.php">Orden de entrada</a>
                                    
                                </li>
                                <li><a class="dropdown-item" href="Ranking.php">Ranking</a></li>
                            </ul>
                        </li>
                    </ul>
                    

                </div>
                <div>
                     
                            <li class="nav-item dropstart me-3" id="punto">
                                '; if (isset($_SESSION["usuarioActivo"])){ 
                                echo '<a class="nav-link rounded border" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <p>'; echo $usuarioActivo->getUser(); echo'<br>';
                                       echo $usuarioActivo->getTipo(); echo'</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="perfil.php">Mi perfil</a></li>
                                    <li><a class="dropdown-item" href="cerrarSesion.php">Cerrar sesion</a></li>
                                </ul>
                            </li>';
                                }else{
                                   echo '<a href="login.php"> <button class="btn btn-outline-success me-2" type="button" >Log In</button></a></li>'; 
                                } echo '


                      
                    </div>  
            </div>
        </nav>';

