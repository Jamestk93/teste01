<?php

use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class NoticiaForm extends \Phalcon\Forms\Form
{
    public function initialize($object = null)
    {
        // print_r($object);die();
        if ($object) {
            $this->add(new Hidden('id'));
        }
        $titulo = new \Phalcon\Forms\Element\Text('titulo', [
            'class' => 'form-control',
            'placeholder' => 'Adicione o título',
            'width' => "100%",

        ]);
        $titulo->addValidator(
          new PresenceOf(['message' => 'O campo "Título é obrigatório"'])
        );
        $titulo->addValidator(new \Phalcon\Validation\Validator\StringLength([
            'max' => 255,
            "messageMaximum" => "O limite de caracteres do título é 255."
        ]));
        $this->add($titulo);

        $texto = new \Phalcon\Forms\Element\TextArea('texto', [
            'class' => 'form-control tinymce-editor',
            'placeholder' => 'Texto da notícia'
        ]);
        $this->add($texto);
        
        $publicado = new \Phalcon\Forms\Element\Check('publicado', [
            'class' => 'form-check-input',
            'type' => 'checkbox'
        ]);
        $this->add($publicado);

        $data_publicacao = new \Phalcon\Forms\Element\Date('data_publicacao', [
            'class' => 'data_publicacao'
        ]);
        $this->add($data_publicacao);
        
        
    }
}