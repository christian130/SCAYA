<?php
	require_once("../../../seguridad/globales/globales.php");
	include_once('../../../../clases/dataentidades/entidadesORM.php');

	function Agregar(){
		$pers = new att_personas();
		$pers->cedula=$_POST['cedula'];
		$pers->nombre=htmlspecialchars(strtoupper($_POST['nombre']));
		$pers->icontrato=$_POST['contrato'];
		$pers->att_horario_id=$_POST['codhr'];
		$pers->iactivo=$_POST['activo'];
		$pers->att_departamento_id=$_POST['coddepto'];
		$pers->att_device_id=$_POST['coddev'];
		$pers->id=$_POST['devid'];
		$pers->device_manager=$_POST['admin'];
		$pers->save();
	}
	
	function Modificar(){
		$pers = new att_personas();
		$pers->Load("gid=".$_POST['idp']);
		if(is_null($pers->id)){
			Agregar();
		}else{
			$pers->cedula=$_POST['cedula'];
			$pers->nombre=htmlspecialchars($_POST['nombre']);
			$pers->icontrato=$_POST['contrato'];
			$pers->att_horario_id=$_POST['codhr'];
			$pers->iactivo=$_POST['activo'];
			$pers->att_departamento_id=$_POST['coddepto'];
			$pers->att_device_id=$_POST['coddev'];
			$pers->id=$_POST['devid'];
			$pers->device_manager=$_POST['admin'];
			$pers->save();
		}
	}
	
	function Eliminar(){
		$pers = new att_personas();
		$pers->Load("gid=".$_POST['id']);
		$pers->Delete();
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