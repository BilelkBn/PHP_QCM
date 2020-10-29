<?php 

function verif_ident_BD($nom_utilisateur,$mdp,$mode,&$profil){ 
	require ("model/connect.php") ; 

	$sql_etu = "SELECT * FROM `etudiant`      where  login_etu=:nom_utilisateur and pass_etu=:mdp";
	$sql_prof = "SELECT * FROM `professeur` 	where login_prof=:nom_utilisateur and pass_prof=:mdp";
	$res_etu = array(); 
	$res_prof = array(); 
	
	try {
		$cde_etu = $pdo->prepare($sql_etu);
		$cde_etu->bindParam(':nom_utilisateur', $nom_utilisateur);
		$cde_etu->bindParam(':mdp', $mdp);
		$b_etu = $cde_etu->execute();
		
		$cde_prof = $pdo->prepare($sql_prof);
		$cde_prof->bindParam(':nom_utilisateur', $nom_utilisateur);
		$cde_prof->bindParam(':mdp', $mdp);
		$b_prof = $cde_prof->execute();
		
		if (($b_etu) && ($b_prof)) {
			$res_etu = $cde_etu->fetchAll(PDO::FETCH_ASSOC);
			$res_prof = $cde_prof->fetchAll(PDO::FETCH_ASSOC);
		}
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}

	//cas etudiant
	if ((count($res_etu)> 0) && (count($res_prof) == 0)) {
		$profil = $res_etu[0];
		$profil['mode']="etudiant";
		$profil['bConnect']=true;
		return connexionEtu($profil['id_etu'],$pdo);
	}
	
	//cas prof
	if ((count($res_prof)> 0) && (count($res_etu)== 0)){
		$profil = $res_prof[0];
		$profil['mode']=$mode;		
		$profil['bConnect']=true;		
		return connexionProf($profil['id_prof'],$pdo);
	}
	
	$profil = array();
	return false;
}

function connexionProf($id,$pdo){
		$sql_coProf="UPDATE `professeur` SET bConnect='1' where  id_prof=:id ";
		$cde_coProf = $pdo->prepare($sql_coProf);
		$cde_coProf->bindParam(':id', $id);
		$b_coProf = $cde_coProf->execute();
		return $b_coProf;
}

function connexionEtu($id,$pdo){
		$sql_coEtu="UPDATE `etudiant` SET bConnect='1' where  id_etu=:id ";
		$cde_coEtu = $pdo->prepare($sql_coEtu);
		$cde_coEtu->bindParam(':id', $id);
		$b_coEtu = $cde_coEtu->execute();
		return $b_coEtu;
}

function liste_u_BD() {
		require ("model/connect.php") ; 
}
