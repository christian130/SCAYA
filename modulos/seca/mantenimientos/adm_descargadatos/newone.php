<?php
header("Cache-Control: no-cache");
include_once('../../../seguridad/globales/globales.php');
include_once('../../../../clases/dataentidades/entidadesORM.php');
//$first=true;
try{
	
$devID = 5;
		$r=0;
		$e=0;
		$n=0;
		
		$fp = fopen ("/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/96ee85b9839081ee9fb8a9f6c909ee32jkkjj.csv","r");



		while ($data = fgetcsv ($fp, 1000, ",")) {
//print_r("aqui2");			
			//var_dump(substr($data[2],11,21).$data[1]);
				
 //if ($first) { $first=false; continue;}
 //$first++;
//die(substr($data[2],11,21).$data[1]);
if ($data[0]=="Ac-No"){$data[0]="0";}
			$pers = new att_personas();
			$pers->Load("id=".$data[0]." AND att_device_id=$devID");
			//if (!is_numeric($data[0])){continue;}
			
			if(!is_null($pers->gid)){
				//$time_in_24_hour_format  = DATE("H:i", STRTOTIME("1:30 pm"));
				$nuevafecha=date("Y-m-d",strtotime(str_ireplace("/","-",substr($data[2],0,10))));
				$nuevahoraampm=date("H:i:s", strtotime(str_ireplace(".","",substr($data[2],11,21))));
				
				$fhora = split(":", substr($data[2],11,21));
				$shareg = sha1($data[0].$fhora[0].$fhora[1]);
				$att = new att_attlogs();
				$att->Load("att_persona_id=".$data[0]." AND hashcode='".$shareg."'");
				if (is_null($att->id)){ 
					$att = new att_attlogs();
				    $att->att_persona_id=$data[0];
					$att->fecha=$nuevafecha;
					$att->hora=$nuevahoraampm;
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
?>
