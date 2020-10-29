<?php

function decoEtu($id){
	require ("model/connect.php") ;
	
	$sql_decoEtu="UPDATE `etudiant` SET bConnect='0' where  id_etu=:id";
		$cde_decoEtu = $pdo->prepare($sql_decoEtu);
		$cde_decoEtu->bindParam(':id', $id);
		$b_decoEtu = $cde_decoEtu->execute();
}


function getTestsActifs($num_grpe){
    require ("model/connect.php") ; 

	$sql_quest="SELECT t.id_test FROM test t WHERE t.bActif = 1 AND t.num_grpe = $num_grpe" ;
	$res_quest= array(); 
	
	try {
		$cde_quest = $pdo->prepare($sql_quest);
		$b_quest = $cde_quest->execute();
			
		if (($b_quest)) {
			$res_quest = $cde_quest->fetch(PDO::FETCH_ASSOC);
        }
        $res_quest['id_test'] = intval($res_quest['id_test'], 10);
        return($res_quest['id_test']);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function lancer_Test($id_test){
    // recuperation de la base de donnee
    require ("model/connect.php") ; 
		//global $pdo;
	$sql_quest = "SELECT Qu.id_quest as quest, Qu.texte FROM test T, qcm Q, question Qu 
                Where T.id_test = $id_test and T.id_test = Q.id_test and Q.id_quest = Qu.id_quest;";

	$res_quest = array();
    $res_rep = array();
    $Quest_Rep = array();

    
	try {
        //Préparation de la requete 
		$cde_quest = $pdo->prepare($sql_quest);
        //Exécution de la requête 
        $b_quest = $cde_quest->execute(); 
        // On vérifie s'il existe des questions
		if (($b_quest)) {
            // On stocke tous les résultats dans la variable res_quest
            $res_quest = $cde_quest->fetchAll(PDO::FETCH_ASSOC);
            //var_dump($res_quest);
            // On parcourt la liste des questions, pour chaque questions on affiche,
            // la ou les propositions des questions
            foreach ($res_quest as $key => $value) { // pour chaque element dans la liste,
                // la valeur de l'element courant est stocke dans value et la cle de l'element à la variable dans key

                $id = $value['quest'];
                //echo($id);

                $sql_rep = "SELECT R.id_rep, R.texte_rep FROM reponse R Where R.id_quest = '" .$id. "';";
                $cde_rep = $pdo->prepare($sql_rep);
                $b_rep = $cde_rep->execute();
                
                var_dump($res_quest);

                if (($b_rep)) {
                    //$res_quest[$key] = $cde_rep->fetchAll(PDO::FETCH_ASSOC);
                    $res_quest = $cde_rep->fetchAll(PDO::FETCH_ASSOC);
                    echo("TEST");
                }
                // $Quest_Rep = $Quest_Rep + $res_quest;
            }
            }
        return($res_quest);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}
?>