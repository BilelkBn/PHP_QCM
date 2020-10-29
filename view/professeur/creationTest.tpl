<html lang="fr">

<head>
    <meta charset="utf-8"/>
    <title>QCM_LIVE | Prof</title>
    <link rel="stylesheet" type="text/css" href="./view/css/creationTest.css">
    <link rel="stylesheet" type="text/css" href="./view/css/transition.css">

     <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>


<body>

<header>  
    <?php
        include('view/professeur/nav-prof.tpl');
    ?>
</header>

<div class="w-full max-w-xl ldt-bounce-in">
        <div class="bg-blue-100 text-center">
            <img class="w-8 mr-auto ml-auto pt-4" src="./view/images/user.png" >
            <h3 class="font-bold"><?php printf ('%s', $username); ?></h3>
        </div>
        <form action="index.php?controller=professeur&action=creerTest" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <div id="info">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                    Titre
                </label>
                <input
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    id="username" type="text" name="Titre" placeholder="Titre">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="groupe">
                    Groupe concerné
                </label>
                <select class="shadow border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
                    name="groupe" id="groupe">
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
        </div>
            <div id="valid">
                <img class="ldt-throw-in" src="./view/images/icon_validation.png">
                <p><strong>Test Enregistré! </strong> </p>
            </div>
            <div class="flex items-center justify-center">
                <button
                    id="bouton"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                    type="submit" onclick="chgValid()">
                    Créer un test
                </button>
            </div>
        </form>
    </div>
<script type="text/javascript"> 
    function chgValid() { 
    let part1 = document.getElementById('info'); 
    let part2 = document.getElementById('valid'); 
    let btn = document.getElementById('bouton');
    
        if(part1.style.display != 'none') { 
            part1.style.display = 'none'; 
            part2.style.display = 'block';
            btn.style.display ='none'; 
        }
}

</script>
    
</body>

</html>