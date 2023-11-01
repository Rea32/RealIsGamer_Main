<?php
namespace Plataforma\Clase;
require_once 'conn.php';

class plataforma{
    private $id;
    private $nombre;
    private $descripcion;
    private $hardware;
    private $juegos=[];

            
    function __construct($id){
        $this->id = $id;

    }
    public function getId() {
        return $this->id;
    }
    public function getNombre() {
        $queryS = "SELECT nombre_plataforma FROM plataforma WHERE id_plataforma = '$this->id'";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        $this->nombre = $stmt->fetch_row()[0];
        return $this->nombre;
    }

    public function setNombre($nombre): void {
        $this->nombre = $nombre;
    }

        public function getDescripcion() {
        $queryS = "SELECT descripcion FROM plataforma WHERE id_plataforma = '$this->id'";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        $this->descripcion = $stmt->fetch_row()[0];
        $this->descripcion = strip_tags($this->descripcion,'<div><p><b><h2><h3>');
        $this->descripcion = preg_replace("/\[editar\]||\[\d\d?\]/", "", $this->descripcion);
        $stmt->close();
        return $this->descripcion;
    }
    public function getHardware() {
        $queryS = "SELECT hardware FROM plataforma WHERE id_plataforma = '$this->id'";
        $conn = conecta();
        $stmt = $conn->query($queryS);
        $this->hardware = $stmt->fetch_row()[0];
        $this->hardware = strip_tags($this->hardware,'<div><p><b><h2><h3>');
        $this->hardware = preg_replace("/\[editar\]||\[\d\d?\]/", "", $this->hardware);
        $stmt->close();
        return $this->hardware;
    }

    public function setHardware($hardware): void {
        $this->hardware = $hardware;
    }

        public function getJuegos() {
        $conn = conecta();
        $queryS = "SELECT j.id_juego FROM juego j INNER JOIN plataformas_juegos pj ON j.id_juego=pj.id_juego INNER JOIN plataforma p ON pj.id_plataforma=p.id_plataforma WHERE p.id_plataforma= ?";
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


}