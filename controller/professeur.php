<?php 

function deconnexionProf(){
	require('./model/professeurBD.php');

	decoProf($_SESSION['profil']['id_prof']);
	$_SESSION['profil']=array();
	$url = "index.php?controller=utilisateur&action=ident";
	header ("Location:" .$url) ;
}

function creerTest(){
	require('./model/professeurBD.php');

	$nom = $_SESSION['profil']['nom']; 
	$prenom = $_SESSION['profil']['prenom'];
	$username= $_SESSION['profil']['login_prof'];

	if(count($_POST)==0){
		require ('./view/professeur/creationTest.tpl'); 
	} //lance tant qu'on a pas envoyé d'info via la methode POST
		
	else { //quand on soumet le formulaire
		$titre = $_POST['Titre'];
		$num_group = $_POST['groupe'];
		$id_prof = $_SESSION['profil']['id_prof'];
		creer_test($id_prof, $num_group, $titre); 
		sleep (1); //met en pause le programme le temps de l'animation(en seconde)

		$url = "index.php?controller=professeur&action=creerTest"; //recharge la page pour un eventuel nouvel ajout
		header ("Location:" .$url) ;
	}	
}


function insererDonnees(){
	require('./model/professeurBD.php');

	$Bmultiple = 0;
	
	foreach ($_POST as $key => $value) {
	 		if (isset($value['valid'])) {
	 			$Bmultiple++;
	 		}
	}

	 if ($Bmultiple == 0) {
	 	$url = "index.php?controller=professeur&action=creerQuest";
		 header ("Location:" .$url) ;
	 } else {

		$Bmultiple = $Bmultiple > 1? 1 : 0 ;


		$id_quest = ajouter_Question($_POST['Question']['theme'],$_POST['Question']['titre'],$_POST['Question']['question'], $Bmultiple );

		foreach ($_POST as $key => $value) {

				$reponse = null;			
				if (isset($value['reponse'])) {
				$reponse = $value['reponse'];
				if (isset($value['valid'])) {
						$valide = 1;
				}else{
						$valide = 0;
				}
				
				ajouter_reponse($id_quest, $reponse, $valide);

				}
			}
		 $url = "index.php?controller=professeur&action=creerQuest";
		 header ("Location:" .$url) ; 
		}
}


function insererTheme(){
	require('./model/professeurBD.php');

	if (isset($_POST['theme'])) {

		ajouter_Theme($_POST['theme'][0], $_POST['theme'][1]);
	}
		 $url = "index.php?controller=professeur&action=creerQuest";
		 header ("Location:" .$url) ;

}

function traiterFormLancerTest()
{
	require('./model/professeurBD.php');

	if (isset($_POST['testChoisit']) & isset($_POST['groupeChoisit'])) {
		lancer_test($_POST['testChoisit'][0], $_POST['groupeChoisit'][0]);
	}

	$url = "index.php?controller=professeur&action=lancerTest";
	header ("Location:" .$url);
}


// *** ROUTES ***

function lancerTest() {
	require('./model/professeurBD.php');

	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];
	$id_prof = $_SESSION['profil']['id_prof'];
	$testsDisponibles = getTests($id_prof);

	if ($_SERVER['HTTP_REFERER'] === "http://localhost:8888/index.php?controller=professeur&action=lancerTest") {
		require("view/professeur/alert-success.tpl");
	}

	require ("./view/professeur/lancerTest.tpl");

}

function suivreTest() {
	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];

	require ("./view/professeur/suivreTest.tpl");
}

function analyserResultats() {
	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];

	require ("./view/professeur/analyserResultats.tpl");
}

function editerQcm() {
	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];

	require ("./view/professeur/editerQcm.tpl");
}

//temporaire pour voir le truc de bilel
function ajouterQuestion() {
	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];
	$themes = select_Theme();

	require ("./view/professeur/ajouterQuestion.tpl");
}

?>