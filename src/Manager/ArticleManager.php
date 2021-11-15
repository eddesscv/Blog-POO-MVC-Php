<?php

namespace App\src\Manager;

use App\config\Parameter;
use App\src\model\Article;

class ArticleManager extends Manager
{
    private function buildObject($row)
    {
        $article = new Article();
        $article->setId($row['id']);
        $article->setTitle($row['title']);
        $article->setImgUrl($row['imgUrl']);
        $article->setChapo($row['chapo']);
        $article->setContent($row['content']);
        $article->setAuthor($row['pseudo']);
        $article->setCreatedAt($row['createdAt']);
        $article->setUpdatedAt($row['updatedAt']);
        return $article;
    }
    public function total()
    {
        $sql = 'SELECT COUNT(*) FROM article';
        return $this->createQuery($sql)->fetchColumn();
    }
    public function getArticles($limit = null, $start = null)
    {
        $sql = 'SELECT article.id, article.title, article.imgUrl, article.chapo, article.content, user.pseudo, article.createdAt, article.updatedAt FROM article INNER JOIN user ON article.user_id = user.id  ORDER BY article.id DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql);
        $articles = [];
        foreach ($result as $row) {
            $articleId = $row['id'];
            $articles[$articleId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $articles;
    }

    // Les 3 dérnieres articles
    public function getArticlesLast3()
    {
        $sql = 'SELECT article.id, article.title, article.imgUrl, article.chapo, article.content, user.pseudo, article.createdAt, article.updatedAt FROM article INNER JOIN user ON article.user_id = user.id  ORDER BY article.id DESC LIMIT 0,3';
        
        $result = $this->createQuery($sql);
        $articlesLast3 = []; 
        foreach ($result as $row) {
            $articleId = $row['id'];
            $articlesLast3[$articleId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $articlesLast3;
    }

    // Les articles affichées dans le panel admin, par créator
    public function getArticlesAdmin($idAdmin, $limit = null, $start = null)
    {
        $sql = 'SELECT article.id, article.title, article.imgUrl, article.chapo, article.content, article.user_id as pseudo, article.createdAt, article.updatedAt FROM article WHERE article.user_id=? ORDER BY article.id DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql, [$idAdmin]);
        $articles = [];
        foreach ($result as $row) {
            $articleId = $row['id'];
            $articles[$articleId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $articles;
    }

    // Single
    public function getArticle($articleId)
    {
        $sql = 'SELECT article.id, article.title, article.imgUrl, article.chapo, article.content, user.pseudo, article.createdAt, article.updatedAt FROM article INNER JOIN user ON article.user_id = user.id WHERE article.id = ?';
        $result = $this->createQuery($sql, [$articleId]);
        $article = $result->fetch();
        $result->closeCursor();
        return $this->buildObject($article);
    }
    public function addArticle(Parameter $post, $userId)
    {
        //Permet de récupérer les variables $title et $content
        $sql = 'INSERT INTO article (title, imgUrl, chapo, content, createdAt, user_id) VALUES (?, ?, ?, ?, NOW(), ?)';
        $this->createQuery($sql, [$post->get('title'), $post->get('imgUrl'),$post->get('chapo'), $post->get('content'), $userId]);
    }
    public function editArticle(Parameter $post, $articleId, $userId)
    {
        $sql = 'UPDATE article SET title=:title, imgUrl=:imgUrl, chapo=:chapo, content=:content, updatedAt=NOW(), user_id=:userId WHERE id=:articleId';
        $this->createQuery($sql, [
            'title' => $post->get('title'),
            'imgUrl' => $post->get('imgUrl'),
            'chapo' => $post->get('chapo'),
            'content' => $post->get('content'),
            'userId' => $userId,
            'articleId' => $articleId
        ]);
    }
    public function deleteArticle($articleId)
    {
        $sql = 'DELETE FROM comment WHERE article_id = ?';
        $this->createQuery($sql, [$articleId]);
        $sql = 'DELETE FROM article WHERE id = ?';
        $this->createQuery($sql, [$articleId]);
    }
    public function search($value)
    {
        $sql = '
            SELECT article.id, article.imgUrl, article.chapo, article.title, article.content, user.pseudo, article.createdAt, article.updatedAt
            FROM article
            INNER JOIN user
            ON article.user_id = user.id
            WHERE article.title
            LIKE ?
            OR article.content
            LIKE ?
            ORDER BY article.id DESC';
        $result = $this->createQuery($sql, ['%' . $value . '%', '%' . $value . '%']);
        $articles = [];
        foreach ($result as $row) {
            $articleId = $row['id'];
            $articles[$articleId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $articles;
    }
}
