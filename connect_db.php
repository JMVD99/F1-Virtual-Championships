<?php 
    // Maak een variabele die maar 1x een waarde gegeven kan worden aka een constante

    define("USERNAME", "root");

    define("SERVERNAME", "localhost");

    define("PASSWORD", "");

    define("DBNAME", "f1_opdracht_v2");

    $conn = mysqli_connect(SERVERNAME, USERNAME, PASSWORD, DBNAME);
?>