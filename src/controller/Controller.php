<?php

namespace App\src\controller;

use App\config\Request;
use App\src\constraint\Validation;
use App\src\Manager\ArticleManager;
use App\src\Manager\CommentManager;
use App\src\Manager\UserManager;
use App\src\model\Pagination;
use App\src\model\View;

abstract class Controller
{
    protected $articleManager;
    protected $commentManager;
    protected $userManager;
    protected $view;
    protected $get;
    protected $post;
    protected $session;
    protected $pagination;
    protected $validation;

    public function __construct()
    {
        $this->articleManager = new ArticleManager();
        $this->commentManager = new CommentManager();
        $this->userManager = new UserManager();
        $this->view = new View();
        $this->pagination = new Pagination();
        $this->validation = new Validation();
        $request = new Request();
        $this->get = $request->getGet();
        $this->post = $request->getPost();
        $this->session = $request->getSession();
    }
}
