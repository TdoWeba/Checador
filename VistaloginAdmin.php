<?php require_once('template/header.php');
        
?>
        <section >
            <div class="divS">
                <form  action="models/Admin.php" class="formulario" action="controllers/
                userController.php?action=register" method="POST">
                <h1>Ingresar</h1>
            <div class="form-group">
                <label for="proyecto">Administrador</label>
                <input type="text" class="form-control"  placeholder="&#128589" name="admin">
            </div>
            <div class="form-group">
                <label for="pass">Contraseña</label>
                <input type="password" class="form-control" placeholder="&#128272" name="pass">
            </div>
            <div class="form-group">
                <button id="reg" >Ingresar</button>

                <button id="can">Cancelar</button>
            </div>
                
         </form>
                        
                    </div>
                </form>
            </div>
            
        </section>
	</body>

</html>