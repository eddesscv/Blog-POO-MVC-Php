<?php

namespace App\src\controller;

class ErrorController extends Controller
{
    public function errorNotFound()
    {
        return $this->render('error/error_404.html.twig');
    }
    public function errorServer()
    {
        return $this->render('error/error_500.html.twig');
    }
}
