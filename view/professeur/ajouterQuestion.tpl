<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <title>QCM_LIVE | Prof</title>
    <link rel="stylesheet" type="text/css" href="./view/css/accueil_prof.css">

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

    <script>
        $(document).ready(function () {
            var max_fields = 10;
            var wrapper = $(".container");
            var addQuest = $(".addRep");

            var x = 1;
            $(addQuest).click(function (e) {
                e.preventDefault();
                if (x < max_fields) {
                    x++;
                    $(wrapper).append('<tr><th scope="row"><input type="text" name="reponse' + x + '[reponse]" required></th><td><input type="checkbox" name="reponse' + x + '[valid]"></td><td><a href="#" class="delete">Delete</a></td><tr>');
                } else {
                    alert('Vous avez atteint la limite')
                }
            });

            $(wrapper).on("click", ".delete", function (e) {
                e.preventDefault();
                $(this).parent('td').parent('tr').remove();
                x--;
            })
        });

    </script>

    

    <form action="index.php?controller=professeur&action=insererDonnees" method="POST">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Theme</th>
                    <th>Titre</th>
                    <th scope="col">Questions</th>
                    <th scope="col">Reponse</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">
                        <select name="Question[theme]" required>
                            <option value="">--Veuillez choisir un thème--</option>
                            <?php 
                        foreach ($themes as $key => $value) {
                            echo("<option value=\"" . $value['id_theme'] . "\">" .$value['titre_theme'] . " </option>");
                        }
                    ?>
                        </select>
                    </th>
                    <td><input type="text" name="Question[titre]" required></td>
                    <td><input type="text" name="Question[question]" required></td>
                    <td>
                        <table class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th>Reponse</th>
                                    <th scope="col">Bonne Reponse</th>
                                    <th scope="col">Supprimer</th>
                                </tr>
                            </thead>
                            <tbody class="container">
                                <tr>
                                    <th scope="row"><input type="text" name="reponse1[reponse]" required></th>
                                    <td><input type="checkbox" name="reponse1[valid]"></td>
                                </tr>
                                <tr>

                            </tbody>
                        </table>
                        <button class="addRep btn btn-success">Ajouter une reponse &nbsp;

                    </td>
                </tr>

            </tbody>
        </table>
        <button class=" btn btn-danger" type="submit">Ajouter cette question</button>
    </form>

    <form class="form-inline" action="index.php?controller=professeur&action=insererTheme" method="POST">
        <div class="form-group mx-sm-3 mb-2">
            <label for="inputPassword2" class="sr-only">Titre du theme : </label>
            <input type="text" class="form-control" name="theme[]" required>
        </div>
        <br>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Description du theme</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="theme[]" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary mb-2">Ajouter le theme</button>
    </form>

</body>

</html>