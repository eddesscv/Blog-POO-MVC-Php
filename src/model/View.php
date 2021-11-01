<?php

namespace App\src\model;

use App\config\Request;

class View
{
    private $file; // fichier vue
    private $title; // titre de la page
    private $session;
    public function __construct()
    {
        $request = new Request();
        $this->session = $request->getSession();
    }
    public function render($template, $data = [])
    {
        $this->file = '../templates/' . $template . '.php';
        $content  = $this->renderFile($this->file, $data);
        $view = $this->renderFile('../templates/base.php', [
            'title' => $this->title,
            'content' => $content,
            'session' => $this->session
        ]);
        echo $view;
    }
    private function renderFile($file, $data)
    {
        if (file_exists($file)) {
            extract($data);
            ob_start(); //commencer la temporisation
            require $file;
            return ob_get_clean(); //arreter la temporisation
        }
        header('Location: index.php?url=notFound');
    }
}
