<?php require_once('template/header.php');
?>
	       <section >
            <div class="divS">
                <form action="models/eliminarP.php" class="formulario" action="controllers/
                userController.php?action=register" method="POST">
                <h1>Eliminar Proyecto</h1>
            <div class="form-group">
                <label for="proyecto">Nombre De Proyecto</label>
                <input type="text" class="form-control" name="proyecto">
            </div>
                <button id="reg" >Eliminar</button>

                <button id="can">Cancelar</button>
         </form>
                        
                    </div>
                </form>
            </div>
            
        </section>
	</body>

</html>
