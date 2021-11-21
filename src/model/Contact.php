<?php

namespace App\src\model;

class Contact
{
    /**
     * @var int
     */
    private $id;
    /**
     * @var string
     */
    private $yourName;
    /**
     * @var string
     */
    private $email;
    /**
     * @var string
     */
    private $subject;
    /**
     * @var string
     */
    private $yourMessage;
    /**
     * @var \DateTime
     */
    private $createdAt;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }
    /**
     * @return string
     */
    public function getYourName()
    {
        return $this->yourName;
    }
    /**
     * @param string $yourName
     */
    public function setYourName($yourName)
    {
        $this->yourName = $yourName;
    }
    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }
    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }
    /**
     * @return string
     */
    public function getSubject()
    {
        return $this->subject;
    }
    /**
     * @param string $subject
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;
    }
    /**
     * @return string
     */
    public function getYourMessage()
    {
        return $this->yourMessage;
    }
    /**
     * @param string $yourMessage
     */
    public function setYourMessage($yourMessage)
    {
        $this->yourMessage = $yourMessage;
    }
    /**
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }
    /**
     * @param \DateTime $createdAt
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }
}
