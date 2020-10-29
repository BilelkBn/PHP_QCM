<?php

	$hostname = "localhost";
    $base = "pweb";     // "bogosss" pour Houassini; "pweb" pour Oscar
	$loginBD = "root";
	$passBD ="root";	// "" sur Wamp; "root" sur Mamp


try {

	$pdo = new PDO ("mysql:server=$hostname; dbname=$base", "$loginBD", "$passBD");

} catch (PDOException $e) {

	die  ("Echec de connexion : " . utf8_encode($e->getMessage()) . "\n");
}
