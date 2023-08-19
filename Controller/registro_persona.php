<?php
$db= new Database();
$con = $db->conectar();

$nombre="";
$apellido="";
$correo="";
$telefono="";
$direccion="";
$contraseña="";
$confirmar ="";

if (isset($_GET["comp"])) {
   $comprar=$_GET["comp"];
} else {
    $comprar=0;
}


if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["nombre"]) and !empty($_POST["apellido"])
    and !empty($_POST["correo"]) and !empty($_POST["telefono"]) 
    and !empty($_POST["direccion"]) and !empty($_POST["contraseña"])
    and !empty($_POST["confirmar"])){
        
        $nombre=$_POST["nombre"];
        $apellido=$_POST["apellido"];
        $correo=$_POST["correo"];
        $telefono=$_POST["telefono"];
        $direccion=$_POST["direccion"];
        $contraseña=$_POST["contraseña"];
        $confirmar = $_POST["confirmar"];

        $vali_correo= validar_correo($correo, $con);

        if ($vali_correo== 1){


            if ($contraseña==$confirmar) {

                $sql= $con->prepare("INSERT INTO usuarios(nombre,apellido,correo,telefono,direccion,contraseña) VALUES 
                ('$nombre',
                '$apellido',
                '$correo',
                $telefono,
                '$direccion',
                '$contraseña')");
                $sql->execute();
                $resultado = $sql->rowCount();

                if ($resultado==1 && $comprar==1) {
                    $datos_usuario= validar_admin($correo, $contraseña, $con);

                    foreach ($datos_usuario as $row) {
                        $email= $row['correo'];
                        $nombre= $row['nombre'];
                        $apellido= $row['apellido'];
                        $telefono= $row['telefono'];
                        $direccion= $row['direccion'];
                        $id_usuario= $row['id_usuario'];
                        $id_cargo= $row['id_cargo'];
                    }
                    $_SESSION["nombre"]=$nombre;
                    $_SESSION["apellido"]=$apellido;
                    $_SESSION["correo"]=$email;
                    $_SESSION["id_usuario"]=$id_usuario;
                    $_SESSION["id_cargo"]=$id_cargo;

                    header("Location:../pagina/checkout.php");
                    exit;
                }elseif($resultado==1 && $comprar==0){
                    echo "<div class='alert alert-success'>Tu cuenta se creo correctamente
                    <br> <a href='iniciar.php' class='btn btn-small btn-info'><i class='fa-solid fa-user-pen'></i>Iniciar Sesion</a>
                    </div>
                    ";
                }else{
                    echo '<div class="alert alert-danger">persona no registrada correctamente</div>';
                }
                
            }else {
                echo "<div class='alert alert-danger'>Las contraseñas no coinciden</div>";
            }
        }else{
            echo "<div class='alert alert-primary'>Ya existe una cuenta con el correo: $correo</div>";
        }

    }else{
        echo "<div class='alert alert-danger'>Algunos campos estan vacios</div>";
    }
}

?>