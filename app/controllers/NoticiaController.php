<?php

class NoticiaController extends ControllerBase
{
    private $mensagemDeErro = '';

    public function listaAction()
    {   
        $noticias = Noticia::find();
        $this->view->noticia = $noticias;
        $this->view->pick("noticia/listar");
    }

    public function cadastrarAction()
    {
        $categorias = Categoria::find();
        $this->view->categoria = $categorias;
        $this->view->form = new NoticiaForm($categorias);
        $this->view->pick("noticia/cadastrar");
    }

    public function editarAction($id)
    {   
        $categorias = Categoria::find();
        $noticia    = Noticia::findFirst($id);
        if (!$noticia) {
            return $this->response->redirect();
        }
        
        $this->view->categoria  = $categorias;
        $this->view->noticia    = $noticia;
        $this->view->form       = new NoticiaForm($noticia);
        $this->view->pick("noticia/editar");
    }

    public function salvarAction()
    {
        
        if (!$this->request->isPost()) {
            return $this->response->redirect(array('for' => 'noticia.lista'));
        }
        $id = $_POST['id'];
        $categoria_id = $_POST['categoria_id'];
        $publicado = "0";

        if (isset($id)) {
            if ($_POST['publicado'] != "") {
                $publicado = $_POST['publicado'];
                $data_publicacao = $_POST['data_publicacao'];
                $data_publicacao = date("Y-m-d H:i:s");
            }
            $noticia = Noticia::findFirst($id);
            $sDate = date("Y-m-d H:i:s");
            $noticia->setData_ultima_atualizacao($sDate);
            $noticia->setCategoria_id($categoria_id);
            $noticia->setPublicado($publicado);
            $noticia->setData_publicacao($data_publicacao);
            $noticiaForm = new NoticiaForm();
            $noticiaForm->bind($this->request->getPost(), $noticia);

            if (!$noticiaForm->isValid()) {
            
                foreach ($noticiaForm->getMessages() as $m) {
                    $this->flashSession->error($m->getMessage());
                    return $this->dispatcher->forward([
                        'controller' => $this->router->getControllerName(),
                        'action' => 'cadastrar'
                    ]);
                }
            }

            if (!$noticia->update()) {
                foreach ($noticia->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                    return $this->response->redirect('noticia');
                }
            }

            $this->flashSession->success('Notícia atualizada com sucesso!');        
            return $this->response->redirect(array('for' => 'noticia.lista'));

        }

        if ($_POST['publicado'] != "") {
            $publicado = $_POST['publicado'];
            $data_publicacao = $_POST['data_publicacao'];
            $data_publicacao = date("Y-m-d H:i:s");
        }

        $noticia = new Noticia();        
        $sDate = date("Y-m-d H:i:s");
        $noticia->setData_ultima_atualizacao($sDate);
        $noticia->setData_cadastro($sDate);
        $noticia->setCategoria_id($categoria_id); 
        $noticia->setPublicado(1);
        $noticia->setData_publicacao($data_publicacao);       
        $noticiaForm = new NoticiaForm();
        $noticiaForm->bind($this->request->getPost(), $noticia);
        
        if (!$noticiaForm->isValid()) {
            
            foreach ($noticiaForm->getMessages() as $m) {
                $this->flashSession->error($m->getMessage());
                return $this->dispatcher->forward([
                    'controller' => $this->router->getControllerName(),
                    'action' => 'cadastrar'
                ]);
            }
        }
        if (!$noticia->save()) {
            foreach ($noticia->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
                return $this->response->redirect(array('for' => 'noticia.lista'));
            }
        }

        $this->flashSession->success('Notícia adicionada com sucesso!');        
        return $this->response->redirect(array('for' => 'noticia.lista'));
    }

    public function excluirAction($id)
    {

       $noticia = noticia::findFirst($id);

       if (!$noticia) {
           $this->flashSession->notice('Registro não encontrado!');
           return $this->response->redirect('noticia');
       }

       if (!$noticia->delete()) {
           $this->flashSession->notice('Não foi possível excluir a noticia.');
           return $this->response->redirect('posts');
       }
       $this->flashSession->success('Noticia excluída com sucesso.');
       return $this->response->redirect(array('for' => 'noticia.lista'));
    }

}