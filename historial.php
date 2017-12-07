<?php require_once('template/header.php');
?>
        <section >
            <div class="divS">
                <form action="models/his.php" class="formulario" method="POST">
                <h1>Historial</h1>
            <div class="form-group">
                <label for="nom">Nombre Del Becario o Proyecto</label>
                <input type="text" class="form-control" name="nom">
            </div>
            <div class="form-group">
                <label for="cont">Historial Por:</label>
                <select class="form-control" name="opciones" id="opciones">
                    <option value="1">Becario</option>
                    <option value="2">Proyecto</option>
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