<style>
    nav img {
        display: inline-block;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <a class="navbar-brand" href="#">
        <img class="mr-3" height="55px" width="55px" src="./view/images/user.png" />
        <?php printf ('%s %s', $prenom, $nom); ?></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
        aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item" id="accueil">
                <a class="nav-link" href="index.php?controller=utilisateur&action=accueil">Accueil</a>
            </li>

            <li class="nav-item" id="lancerTest">
                <a class="nav-link" href="">Rejoindre un test</a>
            </li>
            <li class="nav-item" id="suivreTest">
                <a class="nav-link" href="">Voir ses resultat</a>
            </li>
            <li class="nav-item" id="analyserResultats">
                <a class="nav-link" href="#">Analyser ses resultat</a>
            </li>
        </ul>
        <span class="navbar-text">
            <a href="index.php?controller=etudiant&action=deconnexionEtu" class="btn btn-danger btn-lg active"
                role="button" aria-pressed="true">Déconnexion</a>
        </span>
    </div>
</nav>


<!-- Pour changer le lien qui est actif dans la navbar -->
<script>
        var idLien;
        var url = $(location).prop('href');
        var paramsUrl = url.split('&');
    
        for (var i = 0; i < paramsUrl.length; i++) {
            var nomDesParams = paramsUrl[i].split('=');
    
            if (nomDesParams[0] == "action") {
                idLien = nomDesParams[1];
                break;
            }
        }
    
        $(' #' + idLien).addClass("active");
    
    </script>