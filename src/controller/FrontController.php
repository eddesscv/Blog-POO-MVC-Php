<?php

namespace App\src\controller;

use App\config\Parameter;

class FrontController extends Controller
{
    public function home()
    {
        $articles = $this->articleManager->getArticles();
        return $this->view->render('home', [
            'articles' => $articles
        ]);
    }
    public function article($articleId)
    {
        $article = $this->articleManager->getArticle($articleId);
        $comments = $this->commentManager->getCommentsFromArticle($_GET['articleId']);
        return $this->view->render('single', [
            'article' => $article,
            'comments' => $comments
        ]);
    }
    public function addComment(Parameter $post, $articleId)
    {
        if ($post->get('submit')) {
            $errors = $this->validation->validate($post, 'Comment');
            if (!$errors) {
                $this->commentManager->addComment($post, $articleId);
                $this->session->set('add_comment', 'Le nouveau commentaire a bien été ajouté');
                header('Location: ../public/index.php');
            }
            $article = $this->articleManager->getArticle($articleId);
            $comments = $this->commentManager->getCommentsFromArticle($articleId);
            return $this->view->render('single', [
                'article' => $article,
                'comments' => $comments,
                'post' => $post,
                'errors' => $errors
            ]);
        }
    }
    public function flagComment($commentId)
    {
        $this->commentManager->flagComment($commentId);
        $this->session->set('flag_comment', 'Le commentaire a bien été signalé');
        header('Location: ../public/index.php');
    }
    public function register(Parameter $post)
    {
        if ($post->get('submit')) {
            $errors = $this->validation->validate($post, 'User');
            if ($this->userManager->checkUser($post)) {
                $errors['pseudo'] = $this->userManager->checkUser($post);
            }
            if (!$errors) {
                $this->userManager->register($post);
                $this->session->set('register', 'Votre inscription a bien été effectuée');
                header('Location: ../public/index.php');
            }
            return $this->view->render('register', [
                'post' => $post,
                'errors' => $errors
            ]);
        }
        return $this->view->render('register');
    }
    public function login(Parameter $post)
    {
        if($post->get('submit')) {
            $result = $this->userManager->login($post);
            if($result && $result['isPasswordValid']) {
                $this->session->set('login', 'Content de vous revoir');
                $this->session->set('id', $result['result']['id']);
                $this->session->set('role', $result['result']['name']);
                $this->session->set('pseudo', $post->get('pseudo'));
                header('Location: ../public/index.php');
            }
            else {
                $this->session->set('error_login', 'Le pseudo ou le mot de passe sont incorrects');
                return $this->view->render('login', [
                    'post'=> $post
                ]);
            }
        }
        return $this->view->render('login');
    }
}
