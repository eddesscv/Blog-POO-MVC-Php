<?php

namespace App\src\constraint;

class Validation
{
    public function validate($data, $name)
    {
        if ($name === 'Article') {
            $articleValidation = new ArticleValidation();
            return $articleValidation->check($data);
        }
        if ($name === 'Comment') {
            $commentValidation = new CommentValidation();
            return $commentValidation->check($data);
        }
        if ($name === 'User') {
            $userValidation = new UserValidation();
            return $userValidation->check($data);
        }
        if ($name === 'Contact') {
            $contactValidation = new ContactValidation();
            return $contactValidation->check($data);
        }
        return null;
    }
}
