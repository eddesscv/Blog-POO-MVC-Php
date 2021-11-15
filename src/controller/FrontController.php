<?php

namespace App\src\controller;

use App\config\Parameter;

class FrontController extends Controller
{
    public function home()
    {
        $pagination = $this->pagination->paginate(6, $this->get->get('page'), $this->articleManager->total());
        $articles = $this->articleManager->getArticles($pagination->getLimit(), $this->pagination->getStart());
        
        return $this->render('front/home.html.twig', [
            'articles' => $articles,
            'pagination' => $pagination,
        ]);
    }
    public function blog()
    {
        $pagination = $this->pagination->paginate(6, $this->get->get('page'), $this->articleManager->total());
        $articles = $this->articleManager->getArticles($pagination->getLimit(), $this->pagination->getStart());
        return $this->render('front/blog.html.twig', [
            'articles' => $articles,
            'pagination' => $pagination,
        ]);
    }
    public function article($articleId)
    {
        $article = $this->articleManager->getArticle($articleId);
        $articlesLast3 = $this->articleManager->getArticlesLast3(); // dérnieres articles
        $pagination = $this->pagination->paginate(20, $this->get->get('page'), $this->commentManager->total($articleId));
        $comments = $this->commentManager->getCommentsFromArticle($articleId, $pagination->getLimit(), $pagination->getStart());
        return $this->render('front/single.html.twig', [
            'articlesLast3' => $articlesLast3,
            'article' => $article,  
            'comments' => $comments,
            'pagination' => $pagination,
        ]);
    }
    public function addComment(Parameter $post, $articleId)
    {
        if ($post->get('submit')) {
            $errors = $this->validation->validate($post, 'Comment');
            if (!$errors) {
                $this->commentManager->addComment($post, $articleId);
                $this->session->set('add_comment', 'Le nouveau commentaire a bien été envoyé... En attente de validation');
                header('Location: ../public/index.php?url=article&articleId='.$articleId);
            }
            $article = $this->articleManager->getArticle($articleId);
            $comments = $this->commentManager->getCommentsFromArticle($articleId);
            return $this->render('front/single.html.twig', [
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
        header('Location: ../public/index.php?url=blog');
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
            return $this->render('front/register.html.twig', [
                'post' => $post,
                'errors' => $errors
            ]);
        }
        return $this->render('front/register.html.twig');
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
                return $this->render('front/login.html.twig', [
                    'post'=> $post
                ]);
            }
        }
        return $this->render('front/login.html.twig');
    }
    public function search(Parameter $post)
    {
        $value = $post->get('search');
        if(!$value) {
            $this->session->set('error_search', 'Veuillez renseigner des informations dans la zone de recherche');
            header('Location: ../public/index.php');
        }
        $isArticle = $post->get('articles');
        $articles = [];
        if($isArticle) {
            $articles = $this->articleManager->search($value);
        }
        return $this->render('front/search.html.twig', [
            'value' => $value,
            'articles' => $articles,
        ]);
    }
    public function contact()
    {
        
        return $this->render('front/contact.html.twig', [
        ]);
    }
}
