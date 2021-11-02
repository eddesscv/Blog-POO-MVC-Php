<?php $this->title = "Article"; ?>
<h2><?= htmlspecialchars($article->getTitle()); ?></h2>
<p><?= htmlspecialchars($article->getContent()); ?></p>
<p><?= htmlspecialchars($article->getAuthor());?></p>
<p>Créé le : <?= htmlspecialchars($article->getCreatedAt());?></p>
<br>
<div class="actions">
    <a href="../public/index.php?url=editArticle&articleId=<?= $article->getId(); ?>">Modifier</a>
    <a href="../public/index.php?url=deleteArticle&articleId=<?= $article->getId(); ?>">Supprimer</a>
</div>
<br>
<a href="../public/index.php">Retour à l'accueil</a>
<div id="comments" class="text-left" style="margin-left: 50px">
    <h3>Ajouter un commentaire</h3>
    <?php include('form_comment.php'); ?>
    <h3>Commentaires</h3>
    <?php
    foreach($comments as $comment) {
    ?>
         <h4><?= htmlspecialchars($comment->getPseudo());?></h4>
        <p><?= htmlspecialchars($comment->getContent());?></p>
        <p>Posté le <?= htmlspecialchars($comment->getCreatedAt());?></p>
        <?php
        if($comment->isFlag()) {
            ?>
            <p>Ce commentaire a déjà été signalé</p>
            <?php
        } else {
            ?>
            <p><a href="../public/index.php?url=flagComment&commentId=<?= $comment->getId(); ?>">Signaler le commentaire</a></p>
            <?php
        }
        ?>
        <p><a href="../public/index.php?url=deleteComment&commentId=<?= $comment->getId(); ?>">Supprimer le commentaire</a></p>
        <br>
        <?php
    }
    ?>
    <?php
    for($i = 1; $i <= $pagination->getPageNumber(); $i++) {
        if($pagination->getPage() == $i){
            echo $i;
        } else {
            ?>
            <a href="../public/index.php?url=article&articleId=<?= $article->getId(); ?>&page=<?= $i; ?>"><?= $i; ?></a>
            <?php
        }
    }
    ?>
</div>