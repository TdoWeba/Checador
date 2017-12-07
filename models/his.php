<?php  include_once '/../db/db.php';
	   session_start();
	   $num=$_POST['nom'];
	   $opciones=$_POST['opciones'];


	  switch ($opciones) {
	  	case 1:
	  			echo "Becario:";
	  		break;
	  	case 2:
	  			echo "Proyecto";
	  		break;
	  	default:
	  			echo "falla";
	  		break;
	  }