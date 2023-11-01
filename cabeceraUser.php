
        <?php
        echo '    <nav class="navbar navbar-expand-lg" style="background-color:rgba(0, 0, 0, 0.888)">
        <div class="container-fluid">
          <div class="navbar-brand">
            <img src="images\newlogo.jpg" alt="Logo" width="50" height="50"  class="d-inline-block align-text-middle">
            <img class="navbar-brand" src="images\brandname.png" width="200" height="50">
          </div>
           
          
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>

          </form>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">News</a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Add
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Juego</a></li>
                  <li><a class="dropdown-item" href="#">Desarrolladora</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link">DB</a>
              </li>
            </ul>
          <div>
            <form class="container-fluid justify-content-end">
             <a href="login.php"> <button class="btn btn-outline-success me-2" type="button" >Log In</button></a>
             
            </form>
          </div>  
         
          </div>
        </div>
    </nav>';
      

