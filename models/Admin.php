<?php  include_once '/../db/db.php';
	   session_start();
	$admin=$_POST['admin'];
	$pass=$_POST['pass'];

	$consulta="SELECT * FROM Administrador WHERE nombre='$admin' and pass='$pass'";
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

	$result=mysqli_query($conexion,$consulta);

	$filas=mysqli_num_rows($result);

	if($filas>0){
		$_SESSION['user']=$admin;
		echo '<script> alert("administrador '.$_SESSION["user"]. ' '.'conectado");
		window.location.href="../VistaloginAdmin.php"</script>';
	}else{
		echo '<script> alert("campos obligatorios");
		window.location.href="../VistaloginAdmin.php"</script>';
	}
	mysqli_free_result($result);
	mysqli_close($conexion);