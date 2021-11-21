<?php
namespace App\src\constraint;
use App\config\Parameter;
class ContactValidation extends Validation
{
    private $errors = [];
    private $constraint;
    public function __construct()
    {
        $this->constraint = new Constraint();
    }
    public function check(Parameter $post)
    {
        foreach ($post->all() as $key => $value) {
            $this->checkField($key, $value);
        }
        return $this->errors;
    }
    private function checkField($name, $value)
    {
        if($name === 'yourName') {
            $error = $this->checkYourName($name, $value);
            $this->addError($name, $error);
        }
        elseif ($name === 'email') {
            $error = $this->checkEmail($name, $value);
            $this->addError($name, $error);
        }
        elseif ($name === 'subject') {
            $error = $this->checkSubject($name, $value);
            $this->addError($name, $error);
        }
        elseif ($name === 'yourMessage') {
            $error = $this->checkYourMessage($name, $value);
            $this->addError($name, $error);
        }
    }
    private function addError($name, $error) {
        if($error) {
            $this->errors += [
                $name => $error
            ];
        }
    }
    private function checkYourName($name, $value)
    {
        if($this->constraint->notBlank($name, $value)) {
            return $this->constraint->notBlank('yourName', $value);
        }
        if($this->constraint->minLength($name, $value, 2)) {
            return $this->constraint->minLength('yourName', $value, 2);
        }
        if($this->constraint->maxLength($name, $value, 255)) {
            return $this->constraint->maxLength('yourName', $value, 255);
        }
    }
    private function checkEmail($name, $value)
    {
        if($this->constraint->notBlank($name, $value)) {
            return $this->constraint->notBlank('email', $value);
        }
        if($this->constraint->minLength($name, $value, 2)) {
            return $this->constraint->minLength('email', $value, 2);
        }
        
    }
    private function checkSubject($name, $value)
    {
        if($this->constraint->notBlank($name, $value)) {
            return $this->constraint->notBlank('subject', $value);
        }
        if($this->constraint->minLength($name, $value, 2)) {
            return $this->constraint->minLength('subject', $value, 2);
        }
    }
    private function checkYourMessage($name, $value)
    {
        if($this->constraint->notBlank($name, $value)) {
            return $this->constraint->notBlank('yourMessage', $value);
        }
        if($this->constraint->minLength($name, $value, 2)) {
            return $this->constraint->minLength('yourMessage', $value, 2);
        }
    }
}