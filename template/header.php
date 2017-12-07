<?php 
  session_start(); 
    include_once '/../db/db.php';
    if (isset($_SESSION['user'])){?>

<!-- @ByDaoProgramer -->
<!doctype html>
<html lang="en">
  <head>
    <title>Registro para Becarios</title>
    <!-- metas -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Estilos -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/main.css">
  </head>
  <body>
    <header>
          
        <div>
          <img src="img/logouabcs1.png" alt="logo">
          <h4 style="color: white; display: inline-block;
          width: 10%;"> <?php echo 'Admin: '.$_SESSION["user"]; ?></h4>
          <ul style="width:100%;" class="list-unstyled list-inline ">
            <li><a href="VistasetProyecto.php">Asignar Becario</a></li>
            <li><a href="VistaeliminarProyecto.php">Eliminar Proyecto</a></li>
            <li><a href="VistaleliminarBecario.php">Eliminar Becario</a></li>
            <li><a href="VistaregistroBecario.php">Registrar Becario</a></li>
            <li><a href="VistaregistroProyecto.php">Registrar Proyecto</a></li>
            <li><a href="historial.php">Historial</a></li>
            <li><a href="VistaloginAdmin.php">Conectarse</a></li>
          </ul>
        </div>
              
    </header>
<?php
  }else{
    header("Location:../VistaloginAdmin.php");
  } 
?>