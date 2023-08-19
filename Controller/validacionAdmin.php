<?php
$base_url= "http://localhost/proyectointegrador/";


if(!empty($_POST["btn-validarAdmin"])){
   
    if (empty($_POST["correo"]) && empty($_POST["contraseña"])){
        echo '<div class="alert alert-danger">Los campos estan vacios</div>';
    }elseif(empty($_POST["correo"])){
        echo '<div class="alert alert-danger">Los campos estan vacios</div>';
    }elseif(empty($_POST["contraseña"])){
        echo '<div class="alert alert-danger">Los campos estan vacios</div>';
    }
    
    else{
        $correo=$_POST["correo"];
        $contraseña=$_POST["contraseña"];
        
        $db = new Database();
        $con = $db->conectar();

        $datos_usuario= validar_admin($correo, $contraseña, $con);

        if (!is_array($datos_usuario)){
            $id_cargo=0;
        }

        else {
            foreach ($datos_usuario as $row) {
                $email= $row['correo'];
                $nombre= $row['nombre'];
                $apellido= $row['apellido'];
                $telefono= $row['telefono'];
                $direccion= $row['direccion'];
                $id_usuario= $row['id_usuario'];
                $id_cargo= $row['id_cargo'];
            }
        }
        //print("No encontrados $usuario Usuarios.\n");

           // echo '<div class="alert alert-success">si valida</div>';
           if ($id_cargo==1) {

            $_SESSION["nombre"]=$nombre;
            $_SESSION["apellido"]=$apellido;
            $_SESSION["correo"]=$email;
            $_SESSION["id_usuario"]=$id_usuario;
            $_SESSION["id_cargo"]=$id_cargo;
            header("location:../../Views/admin/inventario/panel_control.php");
           }elseif($id_cargo==2){

            $_SESSION["nombre"]=$nombre;
            $_SESSION["apellido"]=$apellido;
            $_SESSION["correo"]=$email;
            $_SESSION["id_usuario"]=$id_usuario;
            $_SESSION["id_cargo"]=$id_cargo;
            header("location:../../Views/admin/inventario/panel_control.php");
           }elseif ($id_cargo==3){
            
            $_SESSION["nombre"]=$nombre;
            $_SESSION["apellido"]=$apellido;
            $_SESSION["correo"]=$email;
            $_SESSION["id_usuario"]=$id_usuario;
            header("location:../../index.php");
           }else{
            echo "<div class='alert alert-danger'>Usuario '$correo' no encontrado</div>";
            }
    }
}
?>