<?php $this->title = 'Mon profil'; ?>
<div>
    <h2><?= $this->session->get('pseudo'); ?></h2>
    <p><?= $this->session->get('id'); ?></p>
    <a href="../public/index.php?url=updatePassword">Modifier son mot de passe</a>
    <a href="../public/index.php?url=deleteAccount">Supprimer mon compte</a>
</div>
<br>
<a href="../public/index.php">Retour à l'accueil</a>