<?php include_once '/../db/db.php';
	session_start();

	$proyecto=$_POST['proyecto'];
	$num=$_POST['num'];
	
	$id=mysqli_query($conexion,"SELECT * FROM Becario WHERE NumControl='$num'");
	$resultado=mysqli_fetch_array($id);
	echo $resultado['idEquipo'];

	$id2=mysqli_query($conexion,"SELECT * FROM Proyecto WHERE NombreProyecto='$proyecto'");
	$resultado2=mysqli_fetch_array($id2);
	echo $resultado2['idEquipo'];


	$id3=mysqli_query($conexion,"SELECT * FROM Proyecto WHERE NombreProyecto='$proyecto'");
	$resultado3=mysqli_fetch_array($id3);
	echo $resultado3['idProyecto'];


	if($proyecto=="" || $num=="" ){
		echo '<script> alert("campos obligatorios");
		window.location.href="../VistaregistroProyecto.php"</script>';
	}else{
		if ($resultado['idEquipo']==$resultado2['idEquipo']) {
			mysqli_query($conexion,"UPDATE Becario SET idProyecto ='$resultado3[idProyecto]' WHERE idBecario=$resultado[idBecario]");

			echo '<script> alert("Cambiado");
			window.location.href="../VistasetProyecto.php"</script>';
		}
		
	}
	mysqli_close($conexion);



 ?>