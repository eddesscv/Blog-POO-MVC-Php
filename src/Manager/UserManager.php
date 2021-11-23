<?php

namespace App\src\Manager;

use App\config\Parameter;
use App\src\model\User;

class UserManager extends Manager
{
    private function buildObject($row)
    {
        $user = new User();
        $user->setId($row['id']);
        $user->setPseudo($row['pseudo']);
        $user->setCreatedAt($row['createdAt']);
        $user->setValidUser($row['validUser']);
        $user->setRole($row['name']);
        return $user;
    }
    public function getUsers()
    {
        $sql = 'SELECT user.id, user.pseudo, user.createdAt, user.validUser, role.name FROM user INNER JOIN role ON user.role_id = role.id  WHERE user.validUser = true ORDER BY user.id DESC';
        $result = $this->createQuery($sql);
        $users = [];
        foreach ($result as $row) {
            $userId = $row['id'];
            $users[$userId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $users;
    }
    public function register(Parameter $post)
    {
        $sql = 'INSERT INTO user (pseudo, password, createdAt, validUser, role_id) VALUES (?, ?, NOW(), ?, ?)';
        $this->createQuery($sql, [$post->get('pseudo'), password_hash($post->get('password'), PASSWORD_BCRYPT), 0, 1]);
    }
    public function checkUser(Parameter $post)
    {
        $sql = 'SELECT COUNT(pseudo) FROM user WHERE pseudo = ?';
        $result = $this->createQuery($sql, [$post->get('pseudo')]);
        $isUnique = $result->fetchColumn();
        if ($isUnique) {
            return 'Le pseudo existe déjà';
        }
    }
    public function login(Parameter $post)
    {
        $sql = 'SELECT user.id, user.role_id, user.password, user.validUser, role.name FROM user INNER JOIN role ON role.id = user.role_id WHERE pseudo = ? AND user.validUser = "1"';
        $data = $this->createQuery($sql, [$post->get('pseudo')]);
        $result = $data->fetch();
        if ($result) {
            $isPasswordValid = password_verify($post->get('password'), $result['password']);
            return [
                'result' => $result,
                'isPasswordValid' => $isPasswordValid
            ];
        }
        return null;
    }
    public function updatePassword(Parameter $post, $pseudo)
    {
        $sql = 'UPDATE user SET password = ? WHERE pseudo = ?';
        $this->createQuery($sql, [password_hash($post->get('password'), PASSWORD_BCRYPT), $pseudo]);
    }
    public function deleteAccount($pseudo)
    {
        $sql = 'DELETE FROM user WHERE pseudo = ?';
        $this->createQuery($sql, [$pseudo]);
    }
    public function deleteUser($userId)
    {
        $sql = 'DELETE FROM user WHERE id = ?';
        $this->createQuery($sql, [$userId]);
    }
    public function validerUser($userId)
    {
        $sql = 'UPDATE user SET validUser = ? WHERE id = ?';
        $this->createQuery($sql, [1, $userId]);
    }

    public function getUnvalidUsers ()
    {   
        $sql = 'SELECT user.id, user.pseudo, user.createdAt, user.validUser, role.name FROM user INNER JOIN role ON user.role_id = role.id WHERE user.validUser = false ORDER BY user.id DESC';
        $result = $this->createQuery($sql);
        $users = [];
        foreach ($result as $row) {
            $userId = $row['id'];
            $users[$userId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $users;
    }
}
