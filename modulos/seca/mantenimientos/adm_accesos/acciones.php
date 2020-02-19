<?php
	require_once("../../../seguridad/globales/globales.php");
	include_once('../../../../clases/dataentidades/entidadesORM.php');

function MainFun(){
	$data = array(
		'uid' => $_POST['uid'],
		'fecha' => $_POST['fch'],
		'id_reg' => $_POST['idd'],
		'hora' => $_POST['vald'],
		'horario'=>'',
		'dev'=>''
	);

	$pers = new att_personas();
	$pers->Load("id=".$data['uid']);
	$data['horario']=$pers->att_horario_id;
	$data['dev']=$pers->att_device_id;
	$pers = null;
	$att = new att_attlogs();
	if(!is_null($data['id_reg'])){
		$att->Load("id=".$data['id_reg']);
		if(is_null($att->att_persona_id))
			$att = new att_attlogs();
	}
	
	$att->att_persona_id=$data['uid'];
	$att->fecha=$data['fecha'];
	$att->hora=$data['hora'];
	$att->hashcode=sha1($data['uid'].$data['fecha'].$sata['hora'].$data['dev']);
	$att->att_device_id=$data['dev'];
	$att->att_horario_id=$data['horario'];
    $att->save();
}

function delFun(){
	$vid = $_POST['vid'];
	$att = new att_attlogs();
	try{
		$att->Load("id=$vid");
		$att->Delete();
	}
	catch(exception $e){
		print_r($e);
	}
}
	
switch($_GET['acc']){
	case 'E':
		delFun();
		break;
	default:
		MainFun();
}
?>
