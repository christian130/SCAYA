<?php
	require_once("../../../seguridad/globales/globales.php");
	include_once('../../../../clases/dataentidades/entidadesORM.php');

	function Agregar(){
		$devs = new att_devices();
		$devs->nombre=$_POST['nombre'];
		$devs->ip=$_POST['ip'];
		$devs->puerto=$_POST['puerto'];
		$devs->descripcion=$_POST['descripcion'];
		$devs->save();
	}
	
	function Modificar(){
		echo "DATA => <br />";
		print_r($_POST);
		echo "<br /><br /><br />";
		$devs = new att_devices();
		$devs->Load("id=".$_POST['idp']);
		if(is_null($devs->id)){
			Agregar();
		}else{
			$devs->nombre=$_POST['nombre'];
			$devs->ip=$_POST['ip'];
			$devs->puerto=$_POST['puerto'];
			$devs->descripcion=$_POST['descripcion'];
			echo "<br /><br />NEW VAL ==><br />";
			print_r($devs);
			echo "<br /><br />";
			$devs->save();
		}
	}
	
	function Eliminar(){
		$devs = new att_devices();
		$devs->Load("id=".$_POST['id']);
		$devs->Delete();
	}

	switch($_GET['acc'])
	{
		case 'A':
			Agregar();
			break;
		case 'M':
			Modificar();
			break;
		case 'E':
			Eliminar();
			break;
	}
?>