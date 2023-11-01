<?php
namespace Genero\Clase;
require_once 'conn.php';

class genero{
    private $id;
    private $nombre_genero;
    private $descricpion;
    private $juegos=[];

            
    function __construct($id){
        $this->id = $id;

    }
    public function getId() {
        return $this->id;
    }

    public function getDescricpion() {
        return $this->descricpion;
    }
    public function getNombre_genero() {
        $conn = conecta();
        $queryS = "SELECT nombre_genero FROM genero WHERE id_genero= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $this->nombre_genero = $stmt->get_result()->fetch_row()[0];
        return $this->nombre_genero;
    }

    public function setNombre_genero($nombre_genero): void {
        $this->nombre_genero = $nombre_genero;
    }

        public function getJuegos() {
        $conn = conecta();
        $queryS = "SELECT j.id_juego FROM juego j INNER JOIN genero_juegos gj ON j.id_juego=gj.id_juego INNER JOIN genero g ON gj.id_genero=g.id_genero WHERE g.id_genero= ?";
        $stmt = $conn->prepare($queryS);
        $stmt->bind_param('s', $this->id);
        $stmt->execute();
        $result = $stmt->get_result();
        while($row=$result->fetch_row()){
            array_push($this->juegos,$row[0]); 
        }
        $stmt->close();
        desconecta($conn);
        return $this->juegos;
    }

    public function setId($id): void {
        $this->id = $id;
    }

    public function setDescricpion($descricpion): void {
        $this->descricpion = $descricpion;
    }

    public function setJuegos($juegos): void {
        $this->juegos = $juegos;
    }
    public static function obtener_id_generos(){
        $conn = conecta();
        $queryS = "SELECT id_genero FROM genero"; 
        $result = $conn->query($queryS);
        $ids_generos=[];
        while($row = $result->fetch_assoc()){
            array_push($ids_generos,$row['id_genero']);
        }
        desconecta($conn);
        return $ids_generos;
    }


}