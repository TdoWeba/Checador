<?php require_once('template/header.php');
?>
	       <section>
            <div class="divS">
                <form action="models/set.php" class="formulario" action="controllers/
                userController.php?action=register" method="POST">
                <h1>Asignar Proyecto</h1>
            <div class="form-group">
                <label for="proyecto">Nombre De Proyecto</label>
                <input type="text" class="form-control" name="proyecto">
            </div>
            <div class="form-group">
                <label for="num">Numero de Becario</label>
                <input type="text" class="form-control" name="num" id="num">
            </div>
                <button id="reg" >Registrar</button>

                <button id="can">Cancelar</button>
         </form>
                        
                    </div>
                </form>
            </div>
            
        </section>
	</body>

</html>
