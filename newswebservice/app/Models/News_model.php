<?php namespace App\Models;

use CodeIgniter\Model;

class News_model extends Model{
    protected $table='news';
    public function getNews($kategori)
    {  
        $data=[];
            foreach($this->db->table($this->table)->getWhere(['nama_kategori'=>$kategori])->getResultArray() as $row){
                array_push($data,$row);
            } 
            
            return $data;
    }
    public function getRecommend(){
        
        $data=[];
            foreach($this->db->query('SELECT * FROM rekomen_news')->getResult('array') as $row){
                array_push($data,$row);
            } 
            return $data;
    }
    public function addBerita($berita){
        return $this->db->table('berita')->insert($berita);
        
    }
    public function deleteBerita($id)
    {
        return $this->db->table('berita')->delete(["id_berita"=>$id]);
    }
    public function editBerita($id,$berita)
    {
       return $this->db->table('berita')->update($berita,["id_berita"=>$id]);
    }
}