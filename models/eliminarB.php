<?php include_once '/../db/db.php';
	session_start();

	$num=$_POST['num'];


	$id=mysqli_query($conexion,"SELECT * FROM Becario WHERE NumControl='$num'");
	$resultado=mysqli_fetch_array($id);
	echo $resultado['idBecario'];

	if($num==""){
		echo '<script> alert("campo obligatorios");
		window.location.href="../VistaleliminarBecario.php"</script>';
	}else{
		
			mysqli_query($conexion,"DELETE FROM Becario WHERE idBecario =('$resultado[idBecario]')");
			echo '<script> alert("Eliminado");
			window.location.href="../VistaleliminarBecario.php"</script>';
		
		
	}
	mysqli_close($conexion);