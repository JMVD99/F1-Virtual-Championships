<?php 
    if ( empty($_POST["email"])) {
        header("Location: ./index.php?c=boodschap&alert=no-email");
    } else {
        include("./connect_db.php");
        include("./sanitize.php");

        $email = sanitize($_POST["email"]);

        $sql = "SELECT * FROM `user` WHERE `email` = '{$email}'";

        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result)) {
            header("Location: ./index.php?c=boodschap&alert=emailexists");
        } else {
            $password = "geheim";
            $password_hash = password_hash($password, PASSWORD_BCRYPT);

            $sql = "INSERT INTO `user` (`user_id`, `email`, `password`, `hash`) VALUES ( NULL, '$email', '$password', '$password_hash');";

            $result = mysqli_query($conn, $sql); 
            
            $id = mysqli_insert_id($conn);
            
            if ($result){
                $to = $email;
                $subject = "Activeer uw account!";

                $message = '<!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                </head>
                <body>
                   <h1>Beste gebruiker,</h1>
                   <p>U heeft zich zojuist op onze site (www.dyslexiecentraal.net) geregistreerd.</p>
                   <p>Om het activatieproces te voltooien, moet u uw account activeren. Dit doet u door op de link hieronder te klikken.</p>
                   <p>Klik <a href="http://dyslexiecentraal.net/index.php?c=supersecretgame">hier</a> om de game te kunnen spelen!</p>
                   <p>Bedankt voor het aanmelden.</p>
                   <p>Met vriendelijke groet,</p>
                   <p>Dylan van Ginhoven</p>
                   <p>CEO DyslexieCentraal</p>
                </body>
                </html>';

                $headers = "MIME-Version: 1.0\r\n";
                $headers .= "Content-type: text/html; charset=UTF-8\r\n";
                $headers .= "From: Dylan van Ginhoven";
                mail($to , $subject, $message, $headers);
                header("Location: ./index.php?c=boodschap&alert=register_success");
            } else {
                header("Location: ./index.php?c=boodschap&alert=emailfout");
            }
        }
    }
?>
