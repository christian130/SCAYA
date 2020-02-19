<?php
header("Cache-Control: no-cache");
include_once('../../../seguridad/globales/globales.php');
include_once('../../../../clases/dataentidades/entidadesORM.php');
function getIP(){
    if( isset( $_SERVER['HTTP_X_FORWARDED_FOR'] )) $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if( isset( $_SERVER ['HTTP_VIA'] ))  $ip = $_SERVER['HTTP_VIA'];
    else if( isset( $_SERVER ['REMOTE_ADDR'] ))  $ip = $_SERVER['REMOTE_ADDR'];
    else $ip = null ;
    return $ip;
}
//try{
// Define a destination
function Main(){
$targetFolder = '/uploads'; // Relative to the root

//$verifyToken = md5('unique_salt' . $_POST['timestamp']);
$fecha = date("Y-m-d:H:i:s:u").microtime();
//if (!empty($_FILES) && $_POST['token'] == $verifyToken) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
		
	//$fileParts = pathinfo($_FILES['Filedata']['name']);
	$g=md5(date("s-u"));
	
		$targetFile = rtrim($targetPath,'/') . '/'.$g. $_FILES['Filedata']['name'];
		if (move_uploaded_file($tempFile,$targetFile)){
			$filing = new file_uploading222();
			$filing->path=$targetFile;
			$filing->description=$fecha." Direccion IP del usuario".getIP();
			$filing->save();
		}
		$devID = $_POST['dispositivo'];
	try{
		$r=0;
		$e=0;
		$n=0;
		$fp = fopen ("/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/96ee85b9839081ee9fb8a9f6c909ee32jkkjj.csv","r");
		die(var_dump($data));
		while ($data = fgetcsv ($fp, 1000, ",")) {

			$pers = new att_personas();
			$pers->Load("id=".$data[0]." AND att_device_id=$devID");
			if(!is_null($pers->gid)){
				//$time_in_24_hour_format  = DATE("H:i", STRTOTIME("1:30 pm"));
				$nuevafecha=date("Y-m-d",strtotime(substr($data[3],0,10)));
				$nuevahoraampm=date("H:i:s", strtotime(str_ireplace(".","",substr($data[3],11,21))));
				//$fhora = split(":", $data[3]);
				$shareg = sha1($data[0].$fhora[0].$fhora[1]);
				$att = new att_attlogs();
				$att->Load("att_persona_id=".$data[0]." AND hashcode='".$shareg."'");
				if (is_null($att->id)){ 
					$att = new att_attlogs();
				    $att->att_persona_id=$data[0];
					$att->fecha=$nuevafecha;
					$att->hora=$fhora[1];
					$att->hashcode=$shareg;
					$att->att_device_id=$devID;
					$att->att_horario_id=$pers->att_horario_id;
				    $att->save();
					$r++;
					
				} else { 
					$e++; 
				}
			} else { 
				$n++;
			}
		}
		fclose ($fp);
		echo "Operaci&oacute;n completada con &Eacute;xito.<br />$r registro(s) importado(s).";
		if($e>0)
			echo "<br />$e registro(s) ya existente(s).";
		if($n>0)
			echo "<br />$n persona(s) no existente(s) en el sistema.";
	}
	catch(exceptions $ex){
		echo "<b>Error:</b><br />".$ex->getMessage();
	}
		
		//move_uploaded_file($tempFile,$targetFile2);
		//chmod($targetFile2,0755);
	
	 
	// }catch(exception $e){echo "<b>Error:</b><br />".$ex->getMessage();}
	//echo 0;

	// Validate the file type
	//$fileTypes = array('jpg','jpeg','gif','png','zip','csv','deb'); // File extensions
	//$fileParts = pathinfo($_FILES['Filedata']['name']);
	
//	if (in_array($fileParts['extension'],$fileTypes)) {
		
	//	echo '1';
//	} else {
//		echo 'Invalid file type.';
	//}
//}



/*
if (!empty($_FILES)) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	@include_once('../../../../clases/dataentidades/entidadesORM.php');
	$devID = $_POST['dispositivo'];
	try{
		$r=0;
		$e=0;
		$n=0;
		$fp = fopen ($tempFile,"r");
		while ($data = fgetcsv ($fp, 1000, ",")) {

			$pers = new att_personas();
			$pers->Load("id=".$data[0]." AND att_device_id=$devID");
			if(!is_null($pers->gid)){
				
				$fhora = split(":", $data[6]);
				$shareg = sha1($data[0].$fhora[0].$fhora[1]);
				$att = new att_attlogs();
				$att->Load("att_persona_id=".$data[0]." AND hashcode='".$shareg."'");
				if (is_null($att->id)){ 
					$att = new att_attlogs();
				    $att->att_persona_id=$data[0];
					$att->fecha=$fhora[0];
					$att->hora=$fhora[1];
					$att->hashcode=$shareg;
					$att->att_device_id=$devID;
					$att->att_horario_id=$pers->att_horario_id;
				    $att->save();
					$r++;
					
				} else { 
					$e++; 
				}
			} else { 
				$n++;
			}
		}
		fclose ($fp);
		echo "Operaci&oacute;n completada con &Eacute;xito.<br />$r registro(s) importado(s).";
		if($e>0)
			echo "<br />$e registro(s) ya existente(s).";
		if($n>0)
			echo "<br />$n persona(s) no existente(s) en el sistema.";
	}
	catch(exceptions $ex){
		echo "<b>Error:</b><br />".$ex->getMessage();
	}
}*/
}
switch($_GET['acc']){
		default:
			Main();
			break;
	}
function FechaFormat($fecha){
		$ff = split('/', $fecha);
		return $ff[2]."-".$ff[1]."-".$ff[0];
	}
?>