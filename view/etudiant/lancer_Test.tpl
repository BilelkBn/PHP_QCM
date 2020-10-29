<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8" />
  <title>QCM_LIVE | Etudiant</title>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" href="./view/etudiant/styles_Etu.scss">

</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <img height="60px" width="60px" src="view/images/user.png">
      <a class="navbar-brand" href="#"> <?php printf ('Mr. %s %s', $nom, $prenom); ?></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
        aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Accueil</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.php?controller=etudiant&action=rejoindreTest">Rejoindre un test</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="#">Voir ses resultat</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Analyser ses resultat</a>
          </li>
        </ul>
        <span class="navbar-text">
          <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Configuration</a>
          <a href="index.php?controller=etudiant&action=deconnexionEtu" class="btn btn-secondary btn-lg active"
            role="button" aria-pressed="true">Deconnexion</a>
        </span>
      </div>
    </nav>
  </header>


  <div id="page-wrap">

    <h1>Final Quiz for Lip building</h1>

    <form action="grade.php" method="post" id="quiz">
      <ol>
        <li>
          <h3>CSS Stands for...</h3>
          <div>
            <input type="radio" name="question-1-answers" id="question-1-answers-A" value="A" />
            <label for="question-1-answers-A">A) Computer Styled Sections </label>
          </div>

          <div>
            <input type="radio" name="question-1-answers" id="question-1-answers-B" value="B" />
            <label for="question-1-answers-B">B) Cascading Style Sheets</label>
          </div>

          <div>
            <input type="radio" name="question-1-answers" id="question-1-answers-C" value="C" />
            <label for="question-1-answers-C">C) Crazy Solid Shapes</label>
          </div>

          <div>
            <input type="radio" name="question-1-answers" id="question-1-answers-D" value="D" />
            <label for="question-1-answers-D">D) None of the above</label>
          </div>

        </li>

        <li>

          <h3>Internet Explorer 6 was released in...</h3>

          <div>
            <input type="radio" name="question-2-answers" id="question-2-answers-A" value="A" />
            <label for="question-2-answers-A">A) 2001</label>
          </div>

          <div>
            <input type="radio" name="question-2-answers" id="question-2-answers-B" value="B" />
            <label for="question-2-answers-B">B) 1998</label>
          </div>

          <div>
            <input type="radio" name="question-2-answers" id="question-2-answers-C" value="C" />
            <label for="question-2-answers-C">C) 2006</label>
          </div>

          <div>
            <input type="radio" name="question-2-answers" id="question-2-answers-D" value="D" />
            <label for="question-2-answers-D">D) 2003</label>
          </div>

        </li>

        <li>

          <h3>SEO Stand for...</h3>

          <div>
            <input type="radio" name="question-3-answers" id="question-3-answers-A" value="A" />
            <label for="question-3-answers-A">A) Secret Enterprise Organizations</label>
          </div>

          <div>
            <input type="radio" name="question-3-answers" id="question-3-answers-B" value="B" />
            <label for="question-3-answers-B">B) Special Endowment Opportunity</label>
          </div>

          <div>
            <input type="radio" name="question-3-answers" id="question-3-answers-C" value="C" />
            <label for="question-3-answers-C">C) Search Engine Optimization</label>
          </div>

          <div>
            <input type="radio" name="question-3-answers" id="question-3-answers-D" value="D" />
            <label for="question-3-answers-D">D) Seals End Olives</label>
          </div>

        </li>

        <li>

          <h3>A 404 Error...</h3>

          <div>
            <input type="radio" name="question-4-answers" id="question-4-answers-A" value="A" />
            <label for="question-4-answers-A">A) is an HTTP Status Code meaning Page Not Found</label>
          </div>

          <div>
            <input type="radio" name="question-4-answers" id="question-4-answers-B" value="B" />
            <label for="question-4-answers-B">B) is a good excuse for a clever design</label>
          </div>

          <div>
            <input type="radio" name="question-4-answers" id="question-4-answers-C" value="C" />
            <label for="question-4-answers-C">C) should be monitored for in web analytics</label>
          </div>

          <div>
            <input type="radio" name="question-4-answers" id="question-4-answers-D" value="D" />
            <label for="question-4-answers-D">D) All of the above</label>
          </div>

        </li>

        <li>

          <h3>Your favorite website is</h3>

          <div>
            <input type="radio" name="question-5-answers" id="question-5-answers-A" value="A" />
            <label for="question-5-answers-A">A) CSS-Tricks</label>
          </div>

          <div>
            <input type="radio" name="question-5-answers" id="question-5-answers-B" value="B" />
            <label for="question-5-answers-B">B) CSS-Tricks</label>
          </div>

          <div>
            <input type="radio" name="question-5-answers" id="question-5-answers-C" value="C" />
            <label for="question-5-answers-C">C) CSS-Tricks</label>
          </div>

          <div>
            <input type="radio" name="question-5-answers" id="question-5-answers-D" value="D" />
            <label for="question-5-answers-D">D) CSS-Tricks</label>
          </div>

        </li>

      </ol>

      <input type="submit" value="Submit Quiz" />

    </form>

  </div>

</body>

</html>