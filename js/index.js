/*Una vez recibidos los ids de los juegos debemos obtener la informacion que que-
 * remos reflejar en la pagina de incio, llamando al servdior para que obtenga
 * estos datos de la BD
 * @param {type} paquete
 * @returns {undefined}
 */
   
    function peticionTabla(peticion){
      peticion = JSON.stringify(peticion);
      console.log(peticion);
      const xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
            info = JSON.parse(this.responseText);  
            console.log(info);
            cargarInfo(info);
            
          }
      };
      xmlhttp.open("POST","servidor.php");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("peticion="+peticion);
  }
  

  /* Esta función AJAX enviara el paquete JSON con la info de los generos y las
   * plataformas preferidas por el usuario al servidor la respuesta se enviara
   * a la funcion peticionTabla 
   */
  function pedirJuegosInd(paquete){
    paquete = JSON.stringify(paquete);
    console.log(paquete);
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          //console.log(this.responseText);
          juegosAMostrar = JSON.parse(this.responseText);  
          peticionTabla(juegosAMostrar);
          
        }
    };
    xmlhttp.open("POST","servidor.php");
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("paquete="+paquete);
}

/* Funcion AJAX que será llamada desde la pagina index.html (pagina para usuarios
 * no registrados
 */
  function pedirUltLanz(){

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
          juegosAMostrar = JSON.parse(this.responseText); 
          
          //console.log(info);
         cargarInfo(juegosAMostrar);
          
        }
    };
    xmlhttp.open("GET","servidor.php?ult_lanz=1");
    xmlhttp.send();
}

  function cargarInfo(info){
    titulos = document.querySelectorAll(".titulo");
    generos = document.querySelectorAll(".genero");
    imagenes= document.querySelectorAll(".img input:first-child");
    ids = document.querySelectorAll(".id");
   
    cont = 0;
    for(let titulo of titulos){
      nombre =info[cont].nombre;
      indice = nombre.indexOf(":");
      if(indice > 0){
        nombre =  nombre.slice(0, indice+1) + "<br> " + nombre.slice(indice+1);     //En caso de que el titulo lleve un titulo secundario separado por ':' hacemos un salto de linea para que quepa mejor en el contenedor
      }
      titulo.innerHTML = nombre;
      console.log(nombre);
      cont++;
    }
    cont = 0;
    for(let genero of generos){
      genero.innerHTML = info[cont].genero;
      cont++;
    }
    cont = 0;
    for(let img of imagenes){
      img.style.backgroundImage="url("+info[cont]['imagen']+")";
      img.setAttribute("value",info[cont]["imagen"]);        //Aqui almacenamos tambien la ruta de la imagen que usaremos si clickamos en la pantalla index y se la llevara en el form hacia la pagina info.php
      cont++;
    }
    cont=0;
    for(let id of ids){
      id.value=info[cont].id_juego;
      cont++;
    }
  
  }
  


