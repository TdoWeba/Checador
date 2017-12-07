<?php include_once '/../db/db.php';
	session_start();

	$proyecto=$_POST['proyecto'];
	$opciones=$_POST['opciones'];
	
	if($proyecto=="" || $opciones=="" ){
		echo '<script> alert("campos obligatorios");
		window.location.href="../VistaregistroProyecto.php"</script>';
	}else{
		mysqli_query($conexion,"INSERT INTO Proyecto(NombreProyecto,idEquipo) VALUES ('$proyecto','$opciones')");
		echo '<script> alert("registrado");
		window.location.href="../VistaregistroProyecto.php"</script>';
	}
	mysqli_close($conexion);




?>