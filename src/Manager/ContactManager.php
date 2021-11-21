<?php

namespace App\src\Manager;

use App\config\Parameter;
use App\src\model\Contact;

class ContactManager extends Manager
{
    private function buildObject($row)
    {
        $contact = new Contact();
        $contact->setId($row['id']);
        $contact->setYourName($row['yourName']);
        $contact->setEmail($row['email']);
        $contact->setSubject($row['subject']);
        $contact->setYourMessage($row['yourMessage']);
        $contact->setCreatedAt($row['createdAt']);
        return $contact;
    }

    public function total()
    {
        $sql = 'SELECT COUNT(*) FROM contact';
        return $this->createQuery($sql)->fetchColumn();
    }
    public function getMessages()
    {
        $sql = 'SELECT contact.id, contact.yourName, contact.email, contact.subject, contact.yourMessage, contact.createdAt FROM contact ORDER BY contact.id DESC';
        $result = $this->createQuery($sql);
        $messages = [];
        foreach ($result as $row) {
            $contactId = $row['id'];
            $messages[$contactId] = $this->buildObject($row);
        }
        $result->closeCursor();
        return $messages;
    }

    public function sendMessage(Parameter $post)
    {   
        $sql = 'INSERT INTO contact (yourName, email, subject, yourMessage, createdAt) VALUES (?, ?, ?, ?, NOW())';
        $this->createQuery($sql, [$post->get('yourName'), $post->get('email'), $post->get('subject'), $post->get('yourMessage')]); 
    }
    
    public function deleteMessage($contactId)
    {
        $sql = 'DELETE FROM contact WHERE id = ?';
        $this->createQuery($sql, [$contactId]);
    }
    
}
