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
        
        if($album)
        {
            $album->songs = $this->_getSongsByAlbumId($album->id);
        }
        
        return $album; 
    }
    
    private function _getSongsByAlbumId($id)
    {
        $prepare = $this->db->prepare('
            SELECT
                s.*
            FROM
                songs_albums AS sa
            LEFT JOIN
                songs AS s
            ON
                sa.id_songs = s.id
            WHERE
                sa.id_albums = :id_album
        ');
        $prepare->bindValue('id_album', $id);
        $prepare->execute();
        $songs = $prepare->fetchAll();

        $songNames = array();
        foreach($songs as $_song)
        {
            $songNames[] = $_song->name;
        }

        return $songNames;
    }
}