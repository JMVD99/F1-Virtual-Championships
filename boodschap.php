<?php 
switch ($_GET["alert"]) {
    case 'no-email':
        echo '<div class="alert alert-info w-50 mx-auto mt-5" role="alert">
        <h4 class="alert-heading">JE HEB GEEN EMAIL INGEVULD</h4>
        <p>VUL JE EMAIL IN.</p>
        <hr>
        <p class="mb-0">Copyright Disclaimer Under Section 107 of the Copyright Act 1976, allowance is made for "fair use" for purposes such as criticism, comment, news reporting, teaching, scholarship, and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.</p>
        </div>';
    break;
    case 'emailexists':
        echo '<div class="alert alert-danger w-50 mx-auto mt-5" role="alert">
        <h4 class="alert-heading">HET DRIVER ID BESTAAT AL</h4>
        <p>VUL EEN ANDER EMAIL IN.</p>
        <hr>
        <p class="mb-0">Copyright Disclaimer Under Section 107 of the Copyright Act 1976, allowance is made for "fair use" for purposes such as criticism, comment, news reporting, teaching, scholarship, and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.</p>
        </div>';   
    break;
    case 'emailfout':
        echo '<div class="alert alert-danger w-50 mx-auto mt-5" role="alert">
        <h4 class="alert-heading">Er is helaas een fout opgetreden</h4>
        <p>Probeer het nog een keer!</p>
        <hr>
        <p class="mb-0">Copyright Disclaimer Under Section 107 of the Copyright Act 1976, allowance is made for "fair use" for purposes such as criticism, comment, news reporting, teaching, scholarship, and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.</p>
        </div>';   
    break;
    case 'register_success':
        echo '<div class="alert alert-success w-50 mx-auto mt-5" role="alert">
        <h4 class="alert-heading">Gefeliciteerd!</h4>
        <p>Je hebt een account aangemaakt! Kijk in je mailbox om je account te activeren.</p>
        <hr>
        <p class="mb-0">Copyright Disclaimer Under Section 107 of the Copyright Act 1976, allowance is made for "fair use" for purposes such as criticism, comment, news reporting, teaching, scholarship, and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.</p>
        </div>';   
    break;
}
header("Refresh: 5; url=./index.php?c=home");
?>