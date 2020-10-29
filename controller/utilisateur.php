<?php 

function ident() {

	// Redirige l'utilisateur vers sa page d'accueil respective si il est deja connecté
	if (isset($_SESSION['profil']['bConnect'])){
		$url = "index.php?controller=utilisateur&action=accueil";
		header ("Location:" .$url) ;
	}


	$nom = isset($_POST['nom-utilisateur'])?($_POST['nom-utilisateur']):'';
	$num = isset($_POST['mdp'])?($_POST['mdp']):'';
	$mode = isset($_POST['mode'])?($_POST['mode']):'';
	$msg = '';

	if  (count($_POST) == 0)
              require ("./view/utilisateur/ident.tpl");
    else {
	    if  (!verif_ident($nom,$num,$mode,$profil)) {
			$_SESSION['profil'] = array();
			$msg ="erreur de saisie";
	        require ("./view/utilisateur/ident.tpl");
		}
	    else {
			$_SESSION['profil'] = $profil;
			$url = "index.php?controller=utilisateur&action=accueil";
			header ("Location:" .$url) ;
		}
    }	
}

function verif_ident($nom,$num,$mode,&$profil) {
	require ('./model/utilisateurBD.php');
	return verif_ident_BD($nom,$num,$mode,$profil);
}


function accueil() {
	$nom = $_SESSION['profil']['nom'];
	$prenom = $_SESSION['profil']['prenom'];
	require ("./view/". $_SESSION['profil']['mode'] . "/accueil_". $_SESSION['profil']['mode'] . ".tpl");
}


function liste_u() {
		require ('./model/utilisateurBD.php');
}
