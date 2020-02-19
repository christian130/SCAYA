<?php
header("Cache-Control: no-cache");
include_once('../../../seguridad/globales/globales.php');
include_once('../../../../clases/dataentidades/entidadesORM.php');
//try{
// Define a destination
function Main(){
$targetFolder = '/uploads'; // Relative to the root

//$verifyToken = md5('unique_salt' . $_POST['timestamp']);
$fecha = date("Y-m-d");
//if (!empty($_FILES) && $_POST['token'] == $verifyToken) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
	
	$r=0;
	//move_uploaded_file($tempFile,$targetFile);
	//$fileParts = pathinfo($_FILES['Filedata']['name']);
	
	$filing = new file_uploading222();
	$filing->Load("path=$targetFile");
		if (!empty($filing->id)){
	//if (move_uploaded_file($tempFile,$targetFile)){
	
		$matching= new file_matching();
		$matching->Load("id_listing_files='".$filing->id."'");
		
		$g=$matching->contador+1;
		
		
		$matching->id_listing_files=$filing->id;
		$matching->contador=$g;
		$matching->save();
		$targetFile = rtrim($targetPath,'/') . '/'.$g. $_FILES['Filedata']['name'];
		$filing->path=$targetFile;
		$filing->description=$fecha;
		$filing->save();				
			}
		else{
			
			
		}
	
		
	
		
	
		
		//die("asdsad");
		
		$filing2 = new file_uploading222();
		
		$targetFile2=rtrim($targetPath,'/') . '/' .$t. $_FILES['Filedata']['name'];
		if (move_uploaded_file($tempFile,$targetFile2)){
		$filing2->path=$targetFile2;
		$filing2->description=$fecha.$t;
		$filing2->id_other=$t;
		$filing2->save();
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