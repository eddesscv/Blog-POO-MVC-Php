<?php


namespace App\config;

use App\src\controller\BackController;
use App\src\controller\ErrorController;
use App\src\controller\FrontController;
use Exception;

class Router
{
    private $backController;
    private $errorController;
    private $frontController;
    private $request;
    public function __construct()
    {
        $this->backController = new BackController();
        $this->errorController = new ErrorController();
        $this->frontController = new FrontController();
        $this->request = new Request();
    }
    public function run()
    {
        try{
            $url = $this->request->getGet()->get('url');
            if(isset($url))
            {
                if($url === 'article'){
                    $this->frontController->article($this->request->getGet()->get('articleId'));
                }
                elseif($url === 'addArticle'){
                    $this->backController->addArticle($this->request->getPost());
                }
                elseif($url === 'editArticle'){
                    $this->backController->editArticle($this->request->getPost(), $this->request->getGet()->get('articleId'));
                }
                elseif($url === 'deleteArticle') {
                    $this->backController->deleteArticle($this->request->getGet()->get('articleId'));
                }
                elseif($url === 'addComment'){
                    $this->frontController->addComment($this->request->getPost(), $this->request->getGet()->get('articleId'));
                }
                elseif($url === 'flagComment'){
                    $this->frontController->flagComment($this->request->getGet()->get('commentId'));
                }
                elseif($url === 'deleteComment'){
                    $this->backController->deleteComment($this->request->getGet()->get('commentId'));
                }
                else{
                    $this->errorController->errorNotFound();
                }
            } else {
                $this->frontController->home();
            }
        } catch (Exception $e) {
            $this->errorController->errorServer();
        }
    }
}
