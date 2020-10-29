<?php

function decoProf($id){
	require ("model/connect.php");
	$sql_decoProf="UPDATE `professeur` SET bConnect='0' where  id_prof=:id";
		$cde_decoProf = $pdo->prepare($sql_decoProf);
		$cde_decoProf->bindParam(':id', $id);
		$b_decoProf = $cde_decoProf->execute();
}

function select_Question(){
	require ("model/connect.php");
	$sql_quest="SELECT texte, id_quest FROM question";
	$res_quest= array(); 
	
	try {
		$cde_quest = $pdo->prepare($sql_quest);
		$b_quest = $cde_quest->execute();
			
		if (($b_quest)) {
			$res_quest = $cde_quest->fetchAll(PDO::FETCH_ASSOC);
            }
        return($res_quest);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function select_Theme(){
	require ("model/connect.php");
	$sql_quest="SELECT id_theme, titre_theme FROM theme";
	$res_quest= array(); 
	
	try {
		$cde_quest = $pdo->prepare($sql_quest);
		$b_quest = $cde_quest->execute();
			
		if ($b_quest) {
			$res_quest = $cde_quest->fetchAll(PDO::FETCH_ASSOC);
        }
        return($res_quest);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function creer_test($id_prof, $num_group, $titre){
	require ("model/connect.php");
    $date = date("Y-m-d");
    
	try {
		$req = "INSERT INTO `test` (`id_test`, `id_prof`, `num_grpe`, `titre_test`, `date_test`, `bActif`) VALUES (NULL,'" . $id_prof . "','" .$num_group . "','" .$titre. "','".$date."',0)";
        
        $pdo->exec($req);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function lancer_test($id_test, $num_groupe){
	require ("model/connect.php");
	try {
		$sql_lanTest="UPDATE test SET bActif = '1', num_grpe=:numG  WHERE  id_test=:id";
		$cde_lanTest = $pdo->prepare($sql_lanTest);
		$cde_lanTest->bindParam(':id', $id_test);
		$cde_lanTest->bindParam(':numG', $num_groupe);
		$cde_lanTest->execute();
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function getTests($id_prof){
	require ("model/connect.php");
	$sql_quest="SELECT id_test, titre_test FROM test WHERE id_prof=:idp";
	$res_quest= array(); 
	
	try {
		$cde_quest = $pdo->prepare($sql_quest);
		$cde_quest->bindParam(':idp', $id_prof);
		$b_quest = $cde_quest->execute();
			
		if (($b_quest)) {
			$res_quest = $cde_quest->fetchAll(PDO::FETCH_ASSOC);
		}
        return($res_quest);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function stop_test($id_test){
	require ("model/connect.php");
	try {
		$sql_stopTest="UPDATE test SET bActif = '0'  where  id_test=:id";
		$cde_stopTest = $pdo->prepare($sql_stopTest);
		$cde_stopTest->bindParam(':id', $id_test);
		$b_stopTest = $cde_stopTest->execute();
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}


function suivi_test(){
	require ("model/connect.php");
	$sql_quest="SELECT texte, id_quest FROM question";
	$res_quest= array(); 
	
	try {
		$cde_quest = $pdo->prepare($sql_quest);
		$b_quest = $cde_quest->execute();
			
		if (($b_quest)) {
			$res_quest = $cde_quest->fetchAll(PDO::FETCH_ASSOC);
            }
        return($res_quest);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}


	function ajouter_Theme($titre_theme, $desc_titre){
		require ("model/connect.php");
	try {
		$req = "INSERT INTO `theme` (`id_theme`, `titre_theme`, `desc_theme`) VALUES (NULL, '".$titre_theme."', '".$desc_titre."')";
        
        $pdo->exec($req);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function ajouter_Question($id_theme, $titre, $texte, $BMultiple){
	require ("model/connect.php");
	try {
		$req = "INSERT INTO `question` (`id_quest`, `id_theme`, `titre`, `texte`, `bmultiple`) VALUES (NULL, '".$id_theme."', '".$titre."', '".$texte."', '".$BMultiple."')";
		$pdo->exec($req);
		return $pdo->lastInsertId();
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}


function ajouter_reponse($id_quest, $texte_rep, $bvalide){
	require ("model/connect.php");
	try {
		$req = "INSERT INTO `reponse` (`id_rep`, `id_quest`, `texte_rep`, `bvalide`) VALUES (NULL, '".$id_quest."', '".$texte_rep."', '".$bvalide."')";
        
        $pdo->exec($req);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

?>