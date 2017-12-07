<?php  include_once '/../db/db.php';
//
	date_default_timezone_set("America/Mazatlan");
	$datos=date("G:i:s");
	$num=$_POST['cont'];
	echo $datos;

	if($num==""){
		echo '<script> alert("campos obligatorios");
		window.location.href="../index.php"</script>';
	}else{

		$id=mysqli_query($conexion,"SELECT * FROM Becario WHERE NumControl='$num'");
		$resultado=mysqli_fetch_array($id);
		
		mysqli_query($conexion,"UPDATE JornadaTrabajo SET HoraSalida ='$datos' WHERE idBecario=$resultado[idBecario]");
		
		echo '<script> alert("Hora registrada");
		window.location.href="../index.php"</script>';
	}
	mysqli_close($conexion);


?>