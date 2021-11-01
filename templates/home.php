<?php $this->title = "Accueil"; ?>

<?= $this->session->show('edit_article'); ?>
<?= $this->session->show('delete_article'); ?>
<?= $this->session->show('add_comment'); ?>
<?= $this->session->show('flag_comment'); ?>
<?= $this->session->show('delete_comment'); ?>
<?= $this->session->show('register'); ?>
<?= $this->session->show('login'); ?>
<?= $this->session->show('logout'); ?>
<?= $this->session->show('delete_account'); ?>

<?php
if ($this->session->get('pseudo')) {
?>
    <a href="../public/index.php?url=logout">Déconnexion</a>
    <a href="../public/index.php?url=profile">Profil</a>
    <?php if($this->session->get('role') === 'admin') { ?>
        <a href="../public/index.php?url=administration">Administration</a>
    <?php } ?>
    <a href="../public/index.php?url=addArticle">Nouvel article</a>
<?php
} else {
?>
    <a href="../public/index.php?url=register">Inscription</a>
    <a href="../public/index.php?url=login">Connexion</a>
<?php
}
?>
<?php
foreach ($articles as $article) {
?>
    <div>
        <h2><a href="../public/index.php?url=article&articleId=<?= htmlspecialchars($article->getId()); ?>"><?= htmlspecialchars($article->getTitle()); ?></a></h2>
        <p><?= htmlspecialchars($article->getContent()); ?></p>
        <p><?= htmlspecialchars($article->getAuthor()); ?></p>
        <p>Créé le : <?= htmlspecialchars($article->getCreatedAt()); ?></p>
    </div>
    <br>
<?php
}
?>