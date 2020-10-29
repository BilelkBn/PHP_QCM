<?php 

function deconnexionEtu(){
	require('./model/etudiantBD.php');
	
	decoEtu($_SESSION['profil']['id_etu']);
	$_SESSION['profil']=array();
	$url = "index.php?controller=utilisateur&action=ident";
	header ("Location:" .$url) ;
}


function repondreQuestion(){
	$Bmultiple = 0;
   
	foreach ($_POST as $key => $value) {
		if (isset($value['valid'])) {
			$Bmultiple++;
		}
	}

	if ($Bmultiple == 0) {
		$url = "index.php?controller=professeur&action=creerQuest";
		header ("Location:" .$url) ;
	}else{

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

function rejoindreTest(){
	require('./model/etudiantBD.php');

	$nom= $_SESSION['profil']['nom'];
	$prenom= $_SESSION['profil']['prenom'];
	$questions = 

	require('./view/etudiant/lancer_Test.tpl');	
}

?>