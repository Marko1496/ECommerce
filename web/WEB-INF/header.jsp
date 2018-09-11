
<nav class="navbar navbar-expand-lg fixed-top navbar-transparent" color-on-scroll="">
    <div class="container">
        <div class="navbar-translate">
            <a class="navbar-brand" href="Inicio"><img src="assets/img/pizzas/pizzeria.png" style="width:25px; height:25px" alt="...">Pizzeria</a>
            <button class="navbar-toggler navbar-toggler-right navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbarToggler">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="Pizzas" class="nav-link"><i class="nc-icon nc-chart-pie-36"></i>Pizzas</a>
                </li>
                <li class="nav-item">
                    <a href="Bebidas" class="nav-link"><i class="fa fa-beer"></i>Bebidas</a>
                </li>
                <li class="nav-item">
                    <a href="Carrito" class="nav-link"><i class="nc-icon nc-cart-simple"></i></a>
                </li>

                <li class="nav-item">
                    <a data-toggle="modal" data-target="#myModal" class="nav-link"><i class="nc-icon nc-single-02"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="exampleModalLabel">Ingresar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Correo</label>
                            <input name="correo" type="text" class="form-control" placeholder="alice.smith@email.com">
                        </div>
                        <div class="col-md-12">
                            <label>Contraseña</label>
                            <input name="contrasena" type="text" class="form-control" placeholder="******">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="Cliente" class="nav-link"><i class="nc-icon nc-cart-simple"></i>Registrarse</a>
            </div>
        </div>
    </div>
</div>
