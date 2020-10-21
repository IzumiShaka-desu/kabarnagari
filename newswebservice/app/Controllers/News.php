<?php

namespace App\Controllers;

use CodeIgniter\Config\Services;
use CodeIgniter\RESTful\ResourceController;

class News extends ResourceController
{
    protected $modelName = 'App\Models\News_model';
    protected $format = 'json';
    function index()
    {
        return $this->respond($this->model->findAll(), 200);
    }
    public function newsByCategory($kategori)
    {
        return $this->respond($this->model->getNews($kategori), 200);
    }
    public function getRecomendNews(){
        return $this->respond($this->model->getRecommend(), 200);
    } 
    public function create()
    {
        $validation=Services::validation();
        $data=[
            "title" => $this->request->getPost('title'),
            "id_kategori" => $this->request->getPost('id_kategori'),
            "foto" => '-',
            "id_user" => $this->request->getPost('id_user'),
            "tanggal_dibuat" => date('Y-m-d'),
            "konten_berita" => $this->request->getPost('konten_berita'),
        ];
        if($validation->run($data,'news')==FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response,500);
           
        }else{
            $image=$this->request->getFile('image');
            $data['foto']=$image->getRandomName();
            $image->move(ROOTPATH.'public/images',$data['foto']);
            if($this->model->addBerita($data)){
                $response = [
                    'status' => 200,
                    'error' => false,
                    'data' =>['message'=>'berhasil menambahan berita']
                ];
                return $this->respond($response,200);
            }else{
                $response = [
                    'status' => 500,
                    'error' => true,
                    'data' =>['message'=>'gagal menambahan berita']
                ];
                return $this->respond($response,500);
               
            }
        }
    }
    public function delete($id=Null)
    {
        $id = $this->request->getPost('id_berita');
        if($id!==Null){
            if($this->model->deleteBerita($id)){
            $response = [
                'status' => 200,
                'error' => false,
                'data' =>['message'=>'berhasil menghapus berita']
            ];
            return $this->respond($response,200);
        }else{
            $response = [
                'status' => 200,
                'error' => true,
                'data' =>['message'=>'gagal menghapus berita']
            ];
            return $this->respond($response,200);
        }
        }
        
    }
    public function update($id=NULL)
    {
        if($id!==NULL)
        $validation=Services::validation();
        $data=[
            "title" => $this->request->getPost('title'),
            "id_kategori" => $this->request->getPost('id_kategori'),
            "foto" => $this->request->getPost('foto'),
            "id_user" => $this->request->getPost('id_user'),
            "tanggal_dibuat" => date('Y-m-d'),
            "konten_berita" => $this->request->getPost('konten_berita'),
        ];
        if($validation->run($data,'news')==FALSE){
            $response = [
                'status' => 500,
                'error' => true,
                'data' => $validation->getErrors(),
            ];
            return $this->respond($response,500);
           
        }else{
            if($this->request->getFile('image')!==NULL){
            $image=$this->request->getFile('image');
            
            $image->move(ROOTPATH.'public/images',$data['foto'],true);
        }
            if($this->model->editBerita($id,$data)){
                $response = [
                    'status' => 200,
                    'error' => false,
                    'data' =>['message'=>'berhasil menambahan berita']
                ];
                return $this->respond($response,200);
            }else{
                $response = [
                    'status' => 500,
                    'error' => true,
                    'data' =>['message'=>'gagal menambahan berita']
                ];
                return $this->respond($response,500);
               
            }
        }
    }
}
