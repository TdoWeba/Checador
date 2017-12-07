<?php require_once('template/header.php');
?>
 	<section >
            <div class="divS">
                <form action="models/eliminarB.php" class="formulario" action="controllers/
                userController.php?action=register" method="POST">
                <h1>Eliminar Becario</h1>
            <div class="form-group">
                <label for="num">Numero de Becario</label>
                <input type="text" class="form-control" name="num" id="num">
            </div>
                <button id="reg" >Eliminar</button>

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
