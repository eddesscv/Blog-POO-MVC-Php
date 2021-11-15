<?php

namespace App\src\controller;

use App\config\Parameter;

class ContactController extends Controller
{
    private $errorMessage = "";
    private $successMessage = "";
    
    public function index()
    {
        return $this->render('front/contact.html.twig', ['errorMessage' => $this->errorMessage, 'successMessage' => $this->successMessage]);    }
    
    public function sendMessage()
    {
        if(!empty($_POST["send"])) {
            $name = $_POST["name"];
            $email = $_POST["email"];
            $subject = $_POST["subject"];
            $message = $_POST["message"];
            $toEmail = "ednilsonmendes@outlook.com";
            $mailHeaders = "From: " . $name . "<". $email .">\r\n";
            if(mail($toEmail, $subject, $message, $mailHeaders)) {
              $mail_msg = "Vos informations de contact ont été reçues avec succés.";
              $type_mail_msg = "success";
            }else{
              $mail_msg = "Erreur lors de l'envoi de l'e-mail.";
              $type_mail_msg = "error";
            }
          }
        
        // Exécution de l'action par défaut pour réafficher le formulaire de contact
        header('Location: ../public/index.php?url=contact');
    }
}
