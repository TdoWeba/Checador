<?php require_once('template/head2.php');

?>
<div style="text-align:center;padding:1em 0;"> <h2><a style="text-decoration:none;" href="#"><span style="color:gray;">Hora actual en</span><br />La Paz, México</a></h2> <iframe src="https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=es&size=large&timezone=America%2FMazatlan" width="100%" height="140" frameborder="0" seamless></iframe> </div>
	
	        <section>
            <div class="divS">
                <form class="formulario" action="models/entrada.php" method="POST">
                <h1>Ingresar Entrada</h1>
            <div class="form-group">
                <label for="cont">Numero de Control</label>
                <input type="text" class="form-control" name="cont" id="num">
            </div>
            <div class="form-group">
                <button id="reg" >Ingresar</button>
            </div>
                
                </form>

            </div>
            </section>
            <section>
            <div class="divS">
                <form class="formulario" action="models/salida.php" method="POST">
                <h1>Ingresar Salida</h1>
            <div class="form-group">
                <label for="cont">Numero de Control</label>
                <input type="text" class="form-control" name="cont" id="num">
            </div>
            <div class="form-group">
                <button id="reg" >Ingresar</button>
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