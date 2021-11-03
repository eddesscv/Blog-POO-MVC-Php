<h2>Résultats de recherche</h2>
<h3>Articles associés à la recherche : <?= $value; ?></h3>
<div id="articles">
    <?php if (count($articles) > 0) {
        foreach ($articles as $article) {
            ?>
            <h4><?= htmlspecialchars($article->getTitle()); ?></h4>
            <p><?= substr(htmlspecialchars($article->getContent()), 0, 300); ?></p>
            <?php
        }
    } else {
        ?>
        <p>Aucun résultat</p>
        <?php
    }
    ?>
</div>  