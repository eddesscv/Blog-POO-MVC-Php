<?php
$url = isset($post) && $post->get('id') ? 'editComment' : 'addComment';
$submit = $url === 'addComment' ? 'Ajouter' : 'Mettre à jour';
?>
<form method="post" action="../public/index.php?url=<?= $url; ?>&articleId=<?= htmlspecialchars($article->getId()); ?>">
    <label for="pseudo">Pseudo</label><br>
    <input type="text" id="pseudo" name="pseudo" value="<?= isset($post) ? htmlspecialchars($post->get('pseudo')): ''; ?>"><br>
    <?= isset($errors['pseudo']) ? $errors['pseudo'] : ''; ?>
    <label for="content">Message</label><br>
    <textarea id="content" name="content"><?= isset($post) ? htmlspecialchars($post->get('content')): ''; ?></textarea><br>
    <?= isset($errors['content']) ? $errors['content'] : ''; ?>
    <input type="submit" value="<?= $submit; ?>" id="submit" name="submit">
</form>