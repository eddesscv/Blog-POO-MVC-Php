<?php $this->title = "Accueil"; ?>

<?= $this->session->show('edit_article'); ?>
<?= $this->session->show('delete_article'); ?>
<?= $this->session->show('add_comment'); ?>
<?= $this->session->show('flag_comment'); ?>
<?= $this->session->show('delete_comment'); ?>
<?= $this->session->show('register'); ?>
<a href="../public/index.php?url=register">Inscription</a>
<a href="../public/index.php?url=login">Connexion</a>
<a href="../public/index.php?url=addArticle">Nouvel article</a>
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