<?php
if ( eregi("www.shenuhkwan.com",$_SERVER['HTTP_REFERER']))
{ 
$enviaPara = 'rubentoca@gmail.com'; 
$subject = 'Libro de visitas shen Uh Kwan';
$nombre = urldecode($_POST['nombrePhp']);
$email = urldecode($_POST['emailPhp']);
$mensage = urldecode($_POST['mensajePhp']);  
$mensagem = "Nombre: " . $nombre . '\r\n';	
$mensagem .= "E-mail: " . $email . '\r\n'; 
$mensagem .= "FECHA:    " . date("d/m/Y",time()) . '\r\n';
$mensagem .= "Mensaje: ". $mensage;  
$mail_headers = 'From: ' . $email . '\r\n';
$mail_headers .= 'To: rubentoca@gmail.com \r\n';
$mail_headers .= "X-Mailer: PHP/" . phpversion() . "\r\n";
$mail_headers .= "Mime-version: 1.0 \r\n";
$mail_headers .= "Reply-To: " . $email . "\r\n"; 
$mail_headers .= "Content-Type: text/plain";
if (@mail($enviaPara, $subject, $mensagem, $mail_headers)){
    print "codigo=ok";
}
else { 
    print "codigo=error";
}
}
else {
    print "codigo=No tienes permisos"
} 
?>
