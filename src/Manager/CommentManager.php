<?php

namespace App\src\Manager;

use App\config\Parameter;
use App\src\model\Comment;

class CommentManager extends Manager
{
    private function buildObject($row)
    {
        $comment = new Comment();
        $comment->setId($row['id']);
        $comment->setPseudo($row['pseudo']);
        $comment->setContent($row['content']);
        $comment->setCreatedAt($row['createdAt']);
        $comment->setFlag($row['flag']);
        $comment->setValidComment($row['validComment']);
        return $comment;
    }

    public function total($articleId)
    {
        $sql = 'SELECT COUNT(*) FROM comment WHERE article_id = ?';
        return $this->createQuery($sql, [$articleId])->fetchColumn();
    }

    public function getCommentsFromArticle($articleId, $limit = null, $start = null)
    {
        $sql = 'SELECT id, pseudo, content, createdAt, flag, validComment FROM comment WHERE article_id = ? and validComment = true ORDER BY createdAt DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql, [$articleId]);
        $comments = [];
        foreach ($result as $row) {
            $commentId = $row['id'];
            $comments[$commentId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $comments;
    }
    public function addComment(Parameter $post, $articleId)
    {
        $sql = 'INSERT INTO comment (pseudo, content, createdAt, flag, validComment, article_id) VALUES (?, ?, NOW(), ?, ?, ?)';
        $this->createQuery($sql, [$post->get('pseudo'), $post->get('content'), 0, 0, $articleId]);
    }
    public function flagComment($commentId)
    {
        $sql = 'UPDATE comment SET flag = ? WHERE id = ?';
        $this->createQuery($sql, [1, $commentId]);
    }
    public function unflagComment($commentId)
    {
        $sql = 'UPDATE comment SET flag = ? WHERE id = ?';
        $this->createQuery($sql, [0, $commentId]);
    }
    public function deleteComment($commentId)
    {
        $sql = 'DELETE FROM comment WHERE id = ?';
        $this->createQuery($sql, [$commentId]);
    }
    public function getFlagComments()
    {
        $sql = 'SELECT id, pseudo, content, createdAt, flag, validComment FROM comment WHERE flag = ? ORDER BY createdAt DESC';
        $result = $this->createQuery($sql, [1]);
        $flagComments = [];
        foreach ($result as $row) {
            $commentId = $row['id'];
            $flagComments[$commentId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $flagComments;
    }

    public function validComment($commentId)
    {
        $sql = 'UPDATE comment SET validComment = ? WHERE id = ?';
        $this->createQuery($sql, [1, $commentId]);
    }
   
    public function getUnValidComments ($idAdmin, $limit = null, $start = null)
    {   
        $sql = 'SELECT comment.id, comment.pseudo, comment.content, comment.createdAt, comment.flag, comment.validComment, comment.article_id FROM comment INNER JOIN article ON comment.article_id = article.id INNER JOIN user ON article.user_id = user.id WHERE article.user_id = ? and validComment = false ORDER BY createdAt DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql, [$idAdmin]);
        $unValComments = [];
        foreach ($result as $row) {
            $commentId = $row['id'];
            $unValComments[$commentId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $unValComments;
    }

    public function getValidComments ($idAdmin, $limit = null, $start = null)
    {   
        $sql = 'SELECT comment.id, comment.pseudo, comment.content, comment.createdAt, comment.flag, comment.validComment, comment.article_id FROM comment INNER JOIN article ON comment.article_id = article.id INNER JOIN user ON article.user_id = user.id WHERE article.user_id = ? and validComment = true ORDER BY createdAt DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql, [$idAdmin]);
        $comments = [];
        foreach ($result as $row) {
            $commentId = $row['id'];
            $comments[$commentId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $comments;
    }

    public function getAllValidComments ($limit = null, $start = null)
    {   
        $sql = 'SELECT comment.id, comment.pseudo, comment.content, comment.createdAt, comment.flag, comment.validComment, comment.article_id    FROM comment INNER JOIN article ON comment.article_id = article.id INNER JOIN user ON article.user_id = user.id WHERE validComment = true ORDER BY createdAt DESC';
        if ($limit) {
            $sql .= ' LIMIT ' . $limit . ' OFFSET ' . $start;
        }
        $result = $this->createQuery($sql);
        $comments = [];
        foreach ($result as $row) {
            $commentId = $row['id'];
            $comments[$commentId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $comments;
    }
}
