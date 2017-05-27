<?php

namespace Site\Models;

class Albums {
    public $db;

    public function __construct($db) {
        $this->db = $db;
    }
    
    public function getAll() {
        $query = $this->db->query('SELECT * FROM albums');
        $albums = $query->fetchAll();

        return $albums;
    }
    
    public function getBySlug($slug)
    {
        $prepare = $this->db->prepare('
            SELECT * FROM albums WHERE slug = :slug LIMIT 1
        ');
        $prepare->bindValue('slug', $slug);
        $prepare->execute();
        $album = $prepare->fetch();

        return $album; 
    }
}