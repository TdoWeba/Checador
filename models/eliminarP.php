<?php include_once '/../db/db.php';
	session_start();
	$proyecto=$_POST['proyecto'];

	$id=mysqli_query($conexion,"SELECT * FROM proyecto WHERE NombreProyecto='$proyecto'");
	$resultado=mysqli_fetch_array($id);
	echo $resultado['idProyecto'];

	if($proyecto==""){
		echo '<script> alert("campo obligatorios");
		window.location.href="../VistaeliminarProyecto.php"</script>';
	}else{
		
			mysqli_query($conexion,"DELETE FROM proyecto WHERE idProyecto =('$resultado[idProyecto]')");
			echo '<script> alert("Eliminado");
			window.location.href="../VistaeliminarProyecto.php"</script>';
		
		
	}
	mysqli_close($conexion);