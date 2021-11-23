<?php

namespace App\src\controller;

use App\config\Parameter;

class BackController extends Controller
{
    private function checkLoggedIn()
    {
        if(!$this->session->get('pseudo')) {
            $this->session->set('need_login', 'Vous devez vous connecter pour accéder à cette page');
            header('Location: ../public/index.php?url=login');
        } else {
            return true;
        }
    }
    private function checkAdmin()
    {
        $this->checkLoggedIn();
        if(!($this->session->get('role') === 'admin')) {
            $this->session->set('not_admin', 'Vous n\'avez pas le droit d\'accéder à cette page');
            header('Location: ../public/index.php?url=profile');
        } else {
            return true;
        }
    }
    public function administration()
    {
        
        if ($this->checkAdmin()) {
            
            $articles = $this->articleManager->getArticlesAdmin(intval($this->session->get('id')));

            $allArticles = $this->articleManager->getArticles();
            
            $flagComments = $this->commentManager->getFlagComments(intval($this->session->get('id')));
            $unValComments = $this->commentManager->getUnValidComments(intval($this->session->get('id')));
            $valComments = $this->commentManager->getValidComments(intval($this->session->get('id'))); // Comments par user 

            $allValComments = $this->commentManager->getAllValidComments();
            

            $users = $this->userManager->getUsers();

            $unvalidUsers = $this->userManager->getUnvalidUsers();

            $messages = $this->contactManager->getMessages();

            return $this->render('back/administration.html.twig', [
                'articles' => $articles,
                'flagComments' => $flagComments,
                'unValComments' => $unValComments,
                'valComments' => $valComments,
                'users' => $users,
                'allArticles' => $allArticles,
                'allValComments' => $allValComments,
                'messages' => $messages,
                'unvalidUsers' => $unvalidUsers,
            ]);
        }
    }
    public function addArticle(Parameter $post)
    {
        if ($this->checkAdmin()) {
            if ($post->get('submit')) {
                $errors = $this->validation->validate($post, 'Article');
                if (!$errors) {
                    $this->articleManager->addArticle($post, $this->session->get('id'));
                    $this->session->set('add_article', 'Le nouvel article a bien été ajouté');
                    header('Location: ../public/index.php?url=administration');
                }
                return $this->render('back/add_article.html.twig', [
                    'post' => $post,
                    'errors' => $errors
                ]);
            }
            return $this->render('back/add_article.html.twig', [
                'post' => $post
            ]);
        }
    }
    public function editArticle(Parameter $post, $articleId)
    {
        if ($this->checkAdmin()) {
            $article = $this->articleManager->getArticle($articleId);
            if ($post->get('submit')) {
                $errors = $this->validation->validate($post, 'Article');
                if (!$errors) {
                    $this->articleManager->editArticle($post, $articleId, $this->session->get('id'));
                    $this->session->set('edit_article', 'L\'article a bien été modifié');
                    header('Location: ../public/index.php?url=administration');
                }
                return $this->render('back/edit_article.html.twig', [
                    'post' => $post,
                    'errors' => $errors
                ]);
            }
            $post->set('id', $article->getId());
            $post->set('title', $article->getTitle());
            $post->set('imgUrl', $article->getImgUrl());
            $post->set('chapo', $article->getChapo());
            $post->set('content', $article->getContent());
            $post->set('author', $article->getAuthor());
            return $this->render('back/edit_article.html.twig', [
                'post' => $post
            ]);
        }
    }
    public function deleteArticle($articleId)
    {
        if ($this->checkAdmin()) {
            $this->articleManager->deleteArticle($articleId);
            $this->session->set('delete_article', 'L\' article a bien été supprimé');
            header('Location: ../public/index.php?url=administration');
        }
    }
    public function unflagComment($commentId)
    {
        if ($this->checkAdmin()) {
            $this->commentManager->unflagComment($commentId);
            $this->session->set('unflag_comment', 'Le commentaire a bien été désignalé');
            header('Location: ../public/index.php?url=administration');
        }
    }
    public function deleteComment($commentId)
    {
        if ($this->checkAdmin()) {
            $this->commentManager->deleteComment($commentId);
            $this->session->set('delete_comment', 'Le commentaire a bien été supprimé');
            header('Location: ../public/index.php?url=administration');
        }
    }
    public function profile()
    {
        if ($this->checkLoggedIn()) {
            return $this->render('back/profile.html.twig');
        }
    }
    public function updatePassword(Parameter $post)
    { 
        if ($this->checkLoggedIn()) {
            if ($post->get('submit')) {
                $this->userManager->updatePassword($post, $this->session->get('pseudo'));
                $this->session->set('update_password', 'Le mot de passe a été mis à jour');
                header('Location: ../public/index.php?url=profile');               
                
            }
            return $this->render('back/update_password.html.twig');
        }
    }
    public function logout()
    {
        if ($this->checkLoggedIn()) {
            $this->logoutOrDelete('logout');
        }
    }
    public function deleteAccount()
    {
        if ($this->checkLoggedIn()) {
            $this->userManager->deleteAccount($this->session->get('pseudo'));
            $this->logoutOrDelete('delete_account');
        }
    }
    private function logoutOrDelete($param)
    {
        $this->session->stop();
        $this->session->start();
        if ($param === 'logout') {
            $this->session->set($param, 'À bientôt');
        } else {
            $this->session->set($param, 'Votre compte a bien été supprimé');
        }
        header('Location: ../public/index.php');
    }
    public function deleteUser($userId)
    {
        if($this->checkAdmin()) {
            $this->userManager->deleteUser($userId);
            $this->session->set('delete_user', 'L\'utilisateur a bien été supprimé');
            header('Location: ../public/index.php?url=administration');
        }
    }

    public function validComment($commentId)
    {
        if ($this->checkAdmin()) {
            $this->commentManager->validComment($commentId);
            $this->session->set('valid_comment', 'Le commentaire a bien été approuvé');
            header('Location: ../public/index.php?url=administration#val_comment');
        }
    }

    public function validerUser($userId)
    {
        if ($this->checkAdmin()) {
            $this->userManager->validerUser($userId);
            $this->session->set('valid_user', 'L\'utilsateur a bien été validé');
            header('Location: ../public/index.php?url=administration');
        }
    }

    public function deleteMessage($contactId)
    {
        if ($this->checkAdmin()) {
            $this->contactManager->deleteMessage($contactId);
            $this->session->set('delete_message', 'Le message a bien été supprimé');
            header('Location: ../public/index.php?url=administration');
        }
    }
}
