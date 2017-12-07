<?php require_once('template/header.php');
?>
        <section >
            <div class="divS">
                <form action="models/Proyecto.php" class="formulario" method="POST">
                <h1>Registro Proyecto</h1>
            <div class="form-group">
                <label for="proyecto">Nombre De Proyecto</label>
                <input type="text" class="form-control" name="proyecto">
            </div>
            <div class="form-group">
                <label for="cont">Equipo</label>
                <select class="form-control" name="opciones" id="opciones">
                    <option value="1">Android</option>
                    <option value="2">Web</option>
                    <option value="3">iOS</option>
                    <option value="4">Web-Android</option>
                    <option value="5">Android-iOS</option>
                    <option value="6">Web-iOS</option>
                    <option value="7">Android-Web-iOS</option>

                </select>
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
