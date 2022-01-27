<?php

class Noticia extends BaseModel      //\Phalcon\Mvc\Model
{

    public $id;
    public $categoria_id;
    public $titulo;
    public $texto;
    public $publicado;
    public $data_publicacao;
    public $data_ultima_atualizacao;
    public $data_cadastro;

    public function initialize()
    {
        $this->setSource("noticia");        
        $this->belongsTo('categoria_id', '\Categoria', 'id', ['alias' => 'Categoria']);
    }

    public function getSource()
    {
        return 'noticia';
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getCategoria_id()
    {
        return $this->categoria_id;
    }

    public function setCategoria_id($categoria_id)
    {
        $this->categoria_id = $categoria_id;
    }

    public function getTitulo()
    {
        return $this->titulo;
    }

    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;
    }

    public function getTexto()
    {
        return $this->texto;
    }

    public function setTexto($texto)
    {
        $this->texto = $texto;
    }

    public function getPublicado()
    {
        return $this->publicado;
    }

    public function setPublicado($publicado)
    {
        $this->publicado = $publicado;
    }

    public function getData_publicacao()
    {
        return $this->data_publicacao;
    }

    public function setData_publicacao($data_publicacao)
    {
        $this->data_publicacao = $data_publicacao;
    }

    public function getData_ultima_atualizacao()
    {
        return $this->data_ultima_atualizacao;
    }

    public function setData_ultima_atualizacao($data_ultima_atualizacao)
    {
        $this->data_ultima_atualizacao = $data_ultima_atualizacao;
    }

    public function getData_cadastro()
    {
        return $this->data_cadastro;
    }

    public function setData_cadastro($data_cadastro)
    {
        $this->data_cadastro = $data_cadastro;
    }

}
