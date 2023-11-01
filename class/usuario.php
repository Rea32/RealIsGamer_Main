<?php
namespace Usuario\Clase;
class usuario {

    private $id;
    private $user;
    private $tipo;
    private $correo;
    private $contrasenya;
    private $generos = [];
    private $plataformas = [];
    private $nombre;
    private $apellido1;
    private $apellido2;
    private $fecha_nac;
    private $juegos_puntuados;
    

    public function __construct($id, $user, $tipo, $correo) {
        $this->id = $id;
        $this->user = $user;
        $this->tipo = $tipo;
        $this->correo = $correo;

        
    }

    function getId() {
        return $this->id;
    }

    function getUser() {
        return $this->user;
    }

    function getTipo() {
        return $this->tipo;
    }

    function getCorreo() {
        return $this->correo;
    }

    function getContrasenya() {
        return $this->contrasenya;
    }

    function setId($id): void {
        $this->id = $id;
    }

    function setUser($user): void {
        $this->user = $user;
    }

    function setTipo($tipo): void {
        $this->tipo = $tipo;
    }

    function setCorreo($correo): void {
        $this->correo = $correo;
    }

    function setContrasenya($contrasenya): void {
        $this->contrasenya = $contrasenya;
    }
    function getGeneros() {
        $queryS = "SELECT g.id_genero FROM usuarios u INNER JOIN usuario_generos ug ON u.id_usuario=ug.id_usuario INNER JOIN genero g ON ug.id_genero=g.id_genero WHERE u.id_usuario = $this->id";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        while($result=$stmt->fetch_array()){
            array_push($this->generos,$result[0]);
        }
        desconecta($conn);
        return $this->generos;
    }

    function getPlataformas() {
        $queryS = "SELECT p.id_plataforma FROM usuarios u INNER JOIN usuario_plataformas up ON u.id_usuario=up.id_usuario INNER JOIN plataforma p ON up.id_plataforma=p.id_plataforma WHERE u.id_usuario = $this->id";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        while($result=$stmt->fetch_array()){
            array_push($this->plataformas,$result[0]);
        }
        desconecta($conn);
        return $this->plataformas;
    }
    

    function setGeneros($generos): void {
        $this->generos = $generos;
    }

    function setPlataformas($plataformas): void {
        $this->plataformas = $plataformas;
    }

    function getNombre() {
        $conn = conecta();
        $queryS = "SELECT nombre FROM usuarios WHERE id_usuario= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $this->nombre = $stmt->get_result()->fetch_row()[0];
        desconecta($conn);
        return $this->nombre;
    }

    function getApellido1() {
        $conn = conecta();
        $queryS = "SELECT apellido1 FROM usuarios WHERE id_usuario= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $this->apellido1 = $stmt->get_result()->fetch_row()[0];
        desconecta($conn);
        return $this->apellido1;
    }

    function getApellido2() {       
        $conn = conecta();
        $queryS = "SELECT apellido2 FROM usuarios WHERE id_usuario= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $this->apellido2 = $stmt->get_result()->fetch_row()[0];
        desconecta($conn);
        return $this->apellido2;
    }

    function getFecha_nac() {
        $conn = conecta();
        $queryS = "SELECT fecha_nac FROM usuarios WHERE id_usuario= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $this->fecha_nac = $stmt->get_result()->fetch_row()[0];
        desconecta($conn);
        return $this->fecha_nac;
    }

    function setNombre($nombre): void {
        $queryU = "UPDATE usuarios SET nombre = ? WHERE id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryU);
        $stmt->bind_param('ss', $nombre,  $this->id);
        $stmt->execute();
        $stmt->close();
        $this->nombre = $nombre;
    }

    function setApellido1($apellido1): void {
        $queryU = "UPDATE usuarios SET apellido1 = ? WHERE id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryU);
        $stmt->bind_param('ss', $apellido1,  $this->id);
        $stmt->execute();
        $stmt->close();
        $this->apellido1 = $apellido1;
    }

    function setApellido2($apellido2): void {
        $queryU = "UPDATE usuarios SET apellido2 = ? WHERE id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryU);
        $stmt->bind_param('ss', $apellido2,  $this->id);
        $stmt->execute();
        $stmt->close();
        $this->apellido2 = $apellido2;
    }

    function setFecha_nac($fecha_nac): void {
        $queryU = "UPDATE usuarios SET fecha_nac = ? WHERE id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryU);
        $stmt->bind_param('ss', $fecha_nac,  $this->id);
        $stmt->execute();
        $stmt->close(); 
        $this->fecha_nac = $fecha_nac;
    }
   function getJuegosPuntuados(){
        $this->juegos_puntuados=[];
        $queryS1 = "SELECT id_juego FROM usuario_juegosvotados WHERE id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryS1);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_row()){
            foreach ($row as $value) {
              array_push($this->juegos_puntuados,$value);  
            } 
        }
        desconecta($conn);
        return $this->juegos_puntuados;     
    }
    function recogerPuntuacionUsuario($id_juego){    
        $queryS1 = "SELECT puntuacion FROM usuario_juegosvotados WHERE id_juego = ? and id_usuario = ?";
        $conn = conecta();
        $stmt = $conn->prepare($queryS1);
        $stmt->bind_param('ss',$id_juego, $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        if($result->num_rows ==1){
            $puntuacion_juego = $result->fetch_row();
            return $puntuacion_juego[0]; 
        }
        else{
            return -1;
        }

        desconecta($conn);
    
    }
    function puntuarJuego($id_juego,$puntuacion,$sentencia){
        try{
            if($sentencia == 'insert'){
                $query = "INSERT INTO usuario_juegosvotados (puntuacion,id_juego,id_usuario)  VALUES (?,?,?)";

            }
            else{

                $query = "UPDATE usuario_juegosvotados SET puntuacion = ? WHERE id_juego= ? AND id_usuario = ?";
            }
            
            $conn = conecta();
            $conn->begin_transaction();
            $stmt = $conn->prepare($query);
            $stmt->bind_param('sss',$puntuacion,$id_juego, $this->id);
            $result = $stmt->execute(); 
            if ($result){
               $conn->commit();  
            }
            else{
               $conn->rollback();  
            }
           return $result;
        } catch (Exception $ex) {
            echo $ex;
        }
        desconecta($conn);

    }

    
    
    static function printObject($class){
        
        foreach ($class as $key => $value) {
            $object[$key] = $value;
        }
        return $object;
        
    }
    


}
