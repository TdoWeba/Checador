<?php require_once('template/header.php');
?>
        <section >
            <div class="divS">
                <form action="models/Regis.php" class="formulario" method="POST">
                <h1>Registro Becario</h1>
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre">
            </div>
            <div class="form-group">
                <label for="ap">Apellido Paterno</label>
                <input type="text" class="form-control" name="ap">
            </div>
            <div class="form-group">
                <label for="am">Apellido Materno</label>
                <input type="text" class="form-control" name="am">
            </div>
            <div class="form-group">
                <label for="cont">Numero de Control</label>
                <input type="text" class="form-control" name="cont" id="num">
            </div>
             <div class="form-group">
                <label for="cont">Equipo</label>
                <select class="form-control" name="opciones" id="opciones">
                    <option value="1">Android</option>
                    <option value="2">Web</option>
                    <option value="3">iOS</option>
                </select>
            </div>
                <button id="reg" >Registrar</button>

                <button id="can">Cancelar</button>
         </form>
                        
                    </div>
                </form>
            </div>
            
        </section>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script>
            $('#num').on('input',function(e){
                $('#num').val( $('#num').val().replace(/[^0-9]/gi, "") )
            })
    </script>
	</body>

</html>
