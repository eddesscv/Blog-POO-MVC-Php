<?php

namespace App\src\Manager;

use PDO;
use Exception;

abstract class Manager
{
    private $connection;
    private function checkConnection()
    {
        //Vérifie si la connexion est nulle et fait appel à getConnection()
        if ($this->connection === null) {
            return $this->getConnection();
        }
        //Si la connexion existe, elle est renvoyée, inutile de refaire une connexion
        return $this->connection;
    }
    private function getConnection()
    {
        //Tentative de connexion à la base de données
        try {
            $this->connection = new PDO(DB_HOST, DB_USER, DB_PASS);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //On renvoie la connexion
            return $this->connection;
        }
        //On lève une erreur si la connexion échoue
        catch (Exception $errorConnection) {
        }
    }
    protected function createQuery($sql, $parameters = null)
    {
        if($parameters)
        {
            $result = $this->checkConnection()->prepare($sql);
            $result->execute($parameters);
            return $result;
        }
        $result = $this->checkConnection()->query($sql);
        return $result;
    }
}
