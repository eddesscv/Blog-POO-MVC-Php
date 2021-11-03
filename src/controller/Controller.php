<?php

namespace App\src\controller;

use App\config\Request;
use App\src\constraint\Validation;
use App\src\Manager\ArticleManager;
use App\src\Manager\CommentManager;
use App\src\Manager\UserManager;
use App\src\model\Pagination;
//use App\src\model\View;
use Twig\Environment;
use Twig\Extension\DebugExtension;
use Twig\Loader\FilesystemLoader;
abstract class Controller
{
    protected $articleManager;
    protected $commentManager;
    protected $userManager;
    protected $get;
    protected $post;
    protected $session;
    protected $pagination;
    protected $validation;
    /**
     * @var Environment
     */
    protected $twig;
    public function __construct()
    {
        $this->articleManager = new ArticleManager();
        $this->commentManager = new CommentManager();
        $this->userManager = new UserManager();
        $this->pagination = new Pagination();
        $this->validation = new Validation();
        $request = new Request();
        $this->get = $request->getGet();
        $this->post = $request->getPost();
        $this->session = $request->getSession();
        $this->getTwig();
    }
    public function getTwig()
    {
        $loader = new FilesystemLoader('../templates');
        $this->twig = new Environment($loader, [
            //TODO: activate cache in production
            //'cache' => '/path/to/compilation_cache',
            //TODO: disable debug in production
            'debug' => true,
        ]);
        $this->twig->addExtension(new DebugExtension());
        $this->twig->addGlobal('session', $this->session);
    }
    public function render($template, $options = [])
    {
        echo $this->twig->render($template, $options);
    }
}