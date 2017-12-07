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
	echo $resultado['idBecario'];
		mysqli_query($conexion,"INSERT INTO JornadaTrabajo(HoraEntrada,HoraSalida,idBecario) 
				VALUES ('$datos','000000','$resultado[idBecario]')");
		
		echo '<script> alert("Hora registrada");
		window.location.href="../index.php"</script>';
	}
	mysqli_close($conexion);


?>