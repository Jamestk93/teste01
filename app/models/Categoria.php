<?php

class Categoria extends BaseModel
{
    
    public $id;
    public $nome_categoria;

    public function initialize()
    {
        $this->setSource("categoria");
        $this->hasMany('id', 'Noticia', 'categoria_id', ['alias' => 'Noticia']);
    }

    public function getSource()
    {
        return 'categoria';
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getNome_categoria()
    {
        return $this->nome_categoria;
    }

    public function setNome_categoria($nome_categoria)
    {
        $this->nome_categoria = $nome_categoria;
    }
    

}
