<?php
	include_once("../../../seguridad/globales/globales.php");
	include_once('../../../../clases/dataentidades/entidadesORM.php');
	
	function Main(){
		$tempFile = $_FILES['Filedata']['tmp_name'];
		$targetFile = $_SERVER['DOCUMENT_ROOT'].'/paisajismo/fotos/'.$_FILES['Filedata']['name'];
		if (move_uploaded_file($tempFile, $targetFile)){
			$planPaisajismo=new plan_paisajismo();
			$planPaisajismo->Load("true=true order by id desc");
			$proyectosId=strtoupper($planPaisajismo->id);
			$galeria_tbl=new plan_paisajismo_galeria();
			$galeria_tbl->id_proyecto=(int)$proyectosId;
			$galeria_tbl->ruta="/paisajismo/fotos/".$_FILES['Filedata']['name'];
			$galeria_tbl->save();
			//RegBitacora2("Paisajismo", $proyectosId, "Se AGREGO Fotos al Sistema Paisajismo", "modulos/mantenimientos/paisajismo/subirachivo/main");
			print_r("se agrego  ".$_FILES['Filedata']['name']."      al sistema");
						
		}
		
		
	}
	function cargarPDF(){
	$tempFile = $_FILES['Filedata']['tmp_name'];
		$targetFile = $_SERVER['DOCUMENT_ROOT'].'/paisajismo/pdf/'.$_FILES['Filedata']['name'];
		if (move_uploaded_file($tempFile, $targetFile)){
			$planPaisajismo=new plan_paisajismo();
			$planPaisajismo->Load("true=true order by id desc");
			$planPaisajismo->pdf=$targetFile;
			$planPaisajismo->save();
			/*$proyectosId=strtoupper($planPaisajismo->id);
			$galeria_tbl=new plan_paisajismo_galeria();
			$galeria_tbl->id_proyecto=(int)$proyectosId;
			$galeria_tbl->ruta=$targetFile;
			$galeria_tbl->save();*/
			//RegBitacora2("Paisajismo", $proyectosId, "Se AGREGO Fotos al Sistema Paisajismo", "modulos/mantenimientos/paisajismo/subirachivo/main");
			print_r("se agrego  ".$_FILES['Filedata']['name']."      al sistema");
						
		}
		
	}
	switch($_GET['acc']){
		case 'pdf':
			CargarPDF();
			break;
		default:
			Main();
			break;
	}
	
?>
