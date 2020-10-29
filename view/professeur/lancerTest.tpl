<html lang="fr">

<head>
    <meta charset="utf-8" />
    <title>QCM_LIVE | Prof</title>
    <!-- <link rel="stylesheet" type="text/css" href="./view/css/transition.css"> -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

    <header>
        <?php
        include('view/professeur/nav-prof.tpl');
    ?>
    </header>

    <div class="container-fluid">
        <form action="index.php?controller=professeur&action=traiterFormLancerTest" method="post" class="w-25 mx-auto mt-5">
            <div class="form-group">
                <label for="testChoisit">Choisir un test</label>

                <select class="form-control" name="testChoisit[]">
                    <option value="">--Veuillez choisir un thème--</option>
                    <?php 
                        foreach ($testsDisponibles as $key => $value) {
                            echo("<option value=\"" . $value['id_test'] . "\">" .$value['titre_test'] . " </option>");
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="groupeChoisit">Groupe concerné</label>
                <select class="form-control" name="groupeChoisit[]">
                    <option value="201">201</option>
                    <option value="202">202</option>
                    <option value="203">203</option>
                    <option value="204">204</option>
                    <option value="205">205</option>
                    <option value="206">206</option>
                    <option value="207">207</option>
                    <option value="208">208</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Lancer le test</button>
        </form>

    </div>

</body>

</html>