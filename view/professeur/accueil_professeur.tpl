<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="utf-8"/>
        <title>QCM_LIVE | Prof</title>
        <link rel="stylesheet" type="text/css" href="./view/css/accueil_prof.css">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <header>
           <?php include('./view/professeur/nav-prof.tpl') ?>
        </header>

        <div class="container-fluid" id="page_prof">
            <div class="container">
                <h1> Bienvenue <?php printf ('Mr. %s %s', $nom, $prenom); ?> sur QCM LIVE! </h1>
                <p> <strong>QCM LIVE</strong> est une plateforme permettant de créer des QCM pour vos Amphi, de les gérer et de les suivre
                en live!! Si ce n'est pas encore fait je vous invite dès maintenant a créer votre test :</p>
                <a href="index.php?controller=professeur&action=creerTest" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Créer un Test</a>
            </div>
        </div>



    </body>
</html>