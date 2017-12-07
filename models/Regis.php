<?php include_once '/../db/db.php';
	session_start();

	$nombre=$_POST['nombre'];
	$ap=$_POST['ap'];
	$am=$_POST['am'];
	$num=$_POST['cont'];
	$opciones=$_POST['opciones'];
	

	if($nombre=="" || $ap=="" || $am=="" || $num=="" || $opciones=="" || $pro=""){
		echo '<script> alert("campos obligatorios");
		window.location.href="../VistaregistroBecario.php"</script>';
	}else{
		mysqli_query($conexion,"INSERT INTO Becario(NombreBecario,ApPaterno,ApMaterno,NumControl,idProyecto,idEquipo) 
				VALUES ('$nombre','$ap','$am','$num','1','$opciones')");
		
		echo '<script> alert("registrado");
		window.location.href="../VistaregistroBecario.php"</script>';
	}
	mysqli_close($conexion);
	