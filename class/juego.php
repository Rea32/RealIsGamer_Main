<?php
namespace Juego\Clase;
include 'conn.php';

class juego{
    private $id;
    private $nombre;
    private $lanzamiento;
    private $id_saga;
    private $generos=[];
    private $perspectiva;
    private $solo_multijugador;
    private $plataformas=[];
    private $id_desarrollador;
    private $desarrollador;
    private $punt_usuarios = '-';
            
    function __construct($id=0){
        $this->id = $id;

    }
    public function getId() {
        return $this->id;
    }

    public function getNombre() {

        return $this->nombre;
    }

    public function getLanzamiento() {
        return $this->lanzamiento;
    }

    public function getId_saga() {
        return $this->id_saga;
    }

    public function getGeneros() {
        $queryS = "SELECT g.id_genero FROM juego j INNER JOIN genero_juegos gj ON j.id_juego=gj.id_juego INNER JOIN genero g ON gj.id_genero=g.id_genero WHERE j.id_juego = $this->id";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        while($result=$stmt->fetch_array()){
            array_push($this->generos,$result[0]);
        }
        desconecta($conn);
        return $this->generos;
    }

    public function getPerspectiva() {
        return $this->perspectiva;
    }

    public function getSolo_multijugador() {
        return $this->solo_multijugador;
    }

    public function getPlataformas() {
        if ($this->id == 0){
            $queryS = 'SELECT id_plataforma FROM plataforma';
            $conn = conecta();
            $stmt = $conn->query($queryS);
            while($result=$stmt->fetch_array()){
                array_push($this->plataformas,$result[0]);
            }
        }
        return $this->plataformas;
    }

    public function getDesarrollador($conn) {
        $queryS = 'SELECT nombre_desarrollador FROM desarrollador d INNER JOIN juego j ON d.id_desarrollador=j.id_desarrollador WHERE j.id_desarrollador = ?';      
        $stmt = $conn->prepare($queryS);
        $stmt ->bind_param('s', $this->id_desarrollador);
        $stmt->execute();
        $result=$stmt->get_result();
        $this->desarrollador = $result->fetch_row();
        return $this->desarrollador;
    }

    public function setId($id): void {
        $this->id = $id;
    }

    public function setNombre($nombre): void {
        $this->nombre = $nombre;
    }

    public function setLanzamiento($lanzamiento): void {
        $this->lanzamiento = $lanzamiento;
    }

    public function setId_saga($id_saga): void {
        $this->id_saga = $id_saga;
    }

    public function setGeneros($generos): void {
        $this->generos = $generos;
    }

    public function setPerspectiva($perspectiva): void {
        $this->perspectiva = $perspectiva;
    }

    public function setSolo_multijugador($solo_multijugador): void {
        $this->solo_multijugador = $solo_multijugador;
    }

    public function setPlataformas($plataformas): void {
        $this->plataformas = $plataformas;
    }

    public function setDesarrollador($desarrollador): void {
        $this->desarrollador = $desarrollador;
    }
    public function getId_desarrollador() {
        $queryS = 'SELECT id_desarrollador FROM juego WHERE id_juego = ?';
        $conn= conecta();
        $stmt = $conn->prepare($queryS);
        $stmt ->bind_param('s', $this->id);
        $stmt->execute();
        $result=$stmt->get_result();
        $this->id_desarrollador = $result->fetch_row();
        return $this->id_desarrollador;
    }

    public function setId_desarrollador($id_desarrollador): void {
         $this->id_desarrollador = $id_desarrollador;
    }
    /*
     * Funcion que comprobará si el juego existe en la base de datos usando el
     * nombre como filtro. Devolvera la id del juego en caso de encotrarlo
     */
  
    public function existe_juego_en_BD($nombre_juego) {
        $queryS1 = "SELECT id_juego FROM juego WHERE nombre = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryS1);
        $stmt->bind_param('s', $nombre_juego);
        $stmt->execute();
        $result=$stmt->get_result();

        if($result->num_rows==0){
            return false;
        }
        else{
            return $result->fetch_row()[0];
        }
        desconecta($conn);
        
    }
    /*
     * Comprueba si la desarrolladora ya existe en BD de RiG. Si existe devuelve la id para enlazarlo
     * con el juego. Si no devuelve false.
     */
    public function existe_desarrollador_en_BD($nombre_desarrollador) {
        $queryS1 = "SELECT nombre_desarrollador, id_desarrollador FROM desarrollador WHERE nombre_desarrollador = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryS1);
        $stmt->bind_param('s', $nombre_desarrollador);
        $stmt->execute();
        $result=$stmt->get_result();
        if($result->num_rows==0){
            return false;
        }
        else{
            $result = $result->fetch_assoc();
            return $result['id_desarrollador'];

        }
        desconecta($conn);
        
    }
     public function insertar_desarrollador_en_BD($nombre_desarrollador) {
        $queryI= "INSERT INTO desarrollador(nombre_desarrollador) VALUES (?)";
        $conn = conecta();
        $stmt = $conn->prepare($queryI);
        $stmt->bind_param('s', $nombre_desarrollador);
        $stmt->execute();
        $id=$stmt->insert_id;
        desconecta($conn);
        return $id;
            
     }
    public function insertar_juego_en_BD($info_response) {
        $queryI= "INSERT INTO juego(nombre,id_desarrollador,lanzamiento,descripcion) VALUES (?,?,?,?)";
        $conn = conecta();
        $conn->begin_transaction();
        $stmt = $conn->prepare($queryI);
        $stmt->bind_param('ssss', $info_response['nombre'],$info_response['developers'][0],$info_response['release_date'],$info_response['descripcion']);
        $result=$stmt->execute();
        $id_juego = $stmt->insert_id;
        $this->setId($id_juego);
        if($result == true){
            $queryU= "UPDATE juego SET imagen = ? WHERE id_juego=?";
            $stmt = $conn->prepare($queryU);
            $stmt->bind_param('ss', $id_juego,$id_juego);
            $stmt->execute();

            if($this->insertar_genero_juego_en_BD($id_juego,$info_response['genres'],$conn) && $this->insertar_plataforma_juego_en_BD($id_juego,$info_response['platform'],$conn)){
                $conn->commit();
                desconecta($conn);
                return $id_juego;
            }
            else{
                $conn->rollback();
                desconecta($conn);
                return false;
            }
        }       
    }
    
    public function insertar_genero_juego_en_BD($id_juego,$genres,$conn) {

        $this->comprobar_generos_compuestos($genres);
        var_dump($genres);
        foreach ($genres as $genre) {
            $queryS = "SELECT id_genero FROM genero WHERE nombre_genero = ?";
            $stmt = $conn->prepare($queryS);
            $stmt->bind_param('s', $genre);
            $stmt->execute();
            $result = $stmt->get_result();            
            if ($result == true) {
                $id_genero = $result->fetch_row()[0];
                $queryI = "INSERT INTO genero_juegos (id_genero,id_juego) VALUES (?,?)";
                $stmt = $conn->prepare($queryI);
                $stmt->bind_param('ss', $id_genero, $id_juego);
                $result = $stmt->execute(); 

            }
  
            else {
                echo 'El genero especificado no existe en la BD RIG';
                return false;
            }
        }
        if ($result){
         echo 'El genero se ha introducido correctamente';
         return true;
        }
        else{
            echo 'El genero '.$id_genero.' no se ha introducido correctamente';
            return false;
        }
    }
    /*
     * Funcion ampliable que combina en caso de dos generos en un mismo juego
     * aunandolos en un genero que los describe mejor
     */
    public function comprobar_generos_compuestos(&$genres){
        var_dump($genres);
        var_dump(in_array('RPG', $genres));
        if(in_array('Acción', $genres)&& in_array('RPG', $genres)){
            $genres=['Action-RPG'];
        } 
        else if(in_array('Acción', $genres)&& in_array('Plataformas', $genres)){
            $genres=['Metroidvania'];
        } 

        
    }
    /*
     * Inserta en la tabla plataformas_juegos todas las plataformas correspondientes
     * a un genero
     */
    public function insertar_plataforma_juego_en_BD($id_juego,$platforms,$conn) {
       
        foreach ($platforms as $platform) {
            if (preg_match('/^(PC[0-9])/', $platform) == 1){        
                $platform='PC';
            }
            $queryI= "INSERT INTO plataformas_juegos (id_plataforma, id_juego) VALUES (?,?)";
            $stmt = $conn->prepare($queryI);
            $stmt->bind_param('ss', $platform,$id_juego);
            $result = $stmt->execute();           
        }
        if ($result){        
                echo 'Las plataformas se han introducido correctamente';
                return true;
                }
        else{
            echo 'La plataforma '.$platform.' no se ha introducido correctamente';
            return false;
        }
        desconecta($conn);
    }
    /*
     * Este metodo reccogera toda la info de la instancia juego declarada y la
     * devolvera un array asociativo con toda esa info
     */
    public function obtenerTodaInfo(){
        $queryS1 = "SELECT * FROM juego WHERE id_juego = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryS1);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        $infoJuego = $result->fetch_assoc();
        
        $infoJuego['lanzamiento'] = new \DateTime( $infoJuego['lanzamiento']);
        $querySD = "SELECT nombre_desarrollador FROM desarrollador WHERE id_desarrollador = ?";
        $stmt = $conn->prepare($querySD);
        $stmt->bind_param('s', $infoJuego['id_desarrollador']);
        $stmt->execute();
        $result = $stmt->get_result();
        $infoJuego['desarrollador'] = $result->fetch_row();        
        
        $querySG = "SELECT nombre_genero, gj.id_genero FROM genero g INNER JOIN genero_juegos gj ON g.id_genero=gj.id_genero WHERE id_juego = ?";
        $stmt = $conn->prepare($querySG);
        $stmt->bind_param("i", $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        $i = 0;
        $infoJuego['nombre_genero'] = [];
        $infoJuego['id_genero']=[];
        while ($row = $result->fetch_assoc()) {
            //var_dump($row);
            $infoJuego['nombre_genero'][$i] = $row['nombre_genero'];
            $infoJuego['id_genero'][$i] = $row['id_genero'];
            $i++;
        }

        $querySP = "SELECT nombre_plataforma, pj.id_plataforma FROM plataforma p INNER JOIN plataformas_juegos pj ON p.id_plataforma = pj.id_plataforma  WHERE id_juego = ?";
        $stmt = $conn->prepare($querySP);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        $i = 0;
        $infoJuego['nombre_plataforma'] = [];
        $infoJuego['id_plataforma']=[];
        while ($row = $result->fetch_assoc()) {            
            $infoJuego['nombre_plataforma'][$i] = $row['nombre_plataforma'];
            $infoJuego['id_plataforma'][$i] = $row['id_plataforma'];
            $i++;
        }
        return $infoJuego;
    }
    
    /*
     * Filtra los juegos segun el genero enviado como parametro. Implementar para
     * filtrado en página de listado
     */
    public static function filtrar_por_genero($id_genero){
        if($id_genero == 'Todos'){
            return 0;
        }
        else{
            $querySG = "SELECT j.id_juego FROM juego j INNER JOIN genero_juegos gj ON j.id_juego = gj.id_juego INNER JOIN genero g ON g.id_genero=gj.id_genero WHERE g.id_genero = $id_genero";
            $conn = conecta();      
            $result = $conn->query($querySG);
            $id_juegos=[];
            while($row = $result->fetch_assoc()){
                array_push($id_juegos,$row['id_juego']);
            }
            desconecta($conn);
            return $id_juegos;
        }
    }
    
    
    /*Funcion que recibira la info de un juegos y devolvera un array con toda la info de juegos con
    generos iguales    
    */
    public function juegos_similares($info_juego){
        $info_juegosG = [];
        $conn=conecta();
        $querySG = "SELECT j.id_juego FROM juego j INNER JOIN genero_juegos gj ON j.id_juego = gj.id_juego INNER JOIN genero g ON g.id_genero=gj.id_genero WHERE g.id_genero = ? ";
        foreach ($info_juego['id_genero'] as $genero) {
            $stmt = $conn ->prepare($querySG);
            $stmt->bind_param('s', $genero);
            $stmt->execute();
            $result = $stmt->get_result();
            $contGen = 0; $id_juegosG = [];
            while($row = $result->fetch_row()){
                $id_juegosG[$contGen]=$row[0];
                $contGen++;
            }
 
        }
         $id_juegosG = array_rand(array_flip($id_juegosG),sizeof($id_juegosG)<5 ? sizeof($id_juegosG) : 5);
        foreach ($id_juegosG as $id_juegoG) {
            if ( $id_juegoG != $info_juego['id_juego']){
                $this->id = $id_juegoG;
                array_push($info_juegosG,$this->obtenerTodaInfo($id_juegoG));
            }
        } 
       
        return $info_juegosG;    
    }
    /*
     * Obtiene la puntuacion media de todos los usuarios, en caso de no existir 
     * ninguna puntuación sobre el juego devuelve ?
     */
     public function obtener_puntuacion_usuarios(){
        $queryS = "SELECT puntuacion FROM usuario_juegosvotados WHERE id_juego = ?";
        $conn= conecta();
        $stmt = $conn ->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        $n_usuarios = $result->num_rows;
        if($n_usuarios > 0){
            $total_puntuacion = 0;
            while ($puntuacion = $result->fetch_array()) {
                $total_puntuacion += $puntuacion[0];
            }
            $puntuacion_media = $total_puntuacion/$n_usuarios;
            $this->punt_usuarios = $puntuacion_media;
            return round($puntuacion_media,1); 
        }
        else{
            return '?';
        }

     }
     /*
      * 
      */
     public function getPunt_usuarios() {
        $queryS = "SELECT puntuacion FROM usuario_juegosvotados WHERE id_juego = ?";
        $conn= conecta();
        $stmt = $conn ->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        $n_usuarios = $result->num_rows;
        if($n_usuarios > 0){
            $total_puntuacion = 0;
            while ($puntuacion = $result->fetch_array()) {
                $total_puntuacion += $puntuacion[0];
            }
            $puntuacion_media = $total_puntuacion/$n_usuarios;
            $this->punt_usuarios = $puntuacion_media;
         return $this->punt_usuarios;
     }
     else{
            $this->punt_usuarios = '?';
            return $this->punt_usuarios;
        }
     }

     public function setPunt_usuarios($punt_usuarios): void {
        if($punt_usuarios!= '?'){
            $queryU = "UPDATE juego SET punt_usuarios = ? WHERE id_juego = ?";
            $conn= conecta();
            $stmt = $conn ->prepare($queryU);
            $stmt->bind_param('ss', $punt_usuarios,$this->id);
            $stmt->execute();
            $stmt->close();
            $this->punt_usuarios = $punt_usuarios;
        }else{
            $this->punt_usuarios = 'NULL';
        }
 
    }
}
        
     


    


