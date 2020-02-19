<?php
        @include_once("../modulos/seguridad/globales/globales.php");
        @include_once('dataentidades/entidadesORM.php');
        @include_once(_ruta_clases  . _archivo_conexion_bd);
final class fetchingdata{
function __construct(){
    //echo "asdsad";
    
}    
    function fixing_logs(){ //retrieve data and therefore fix it via php script
        
    $dbInfo = new clsConnex();
    //$dbInfo->usuario.':'.$dbInfo->clave.'@'.$dbInfo->servidor.'/'.$dbInfo->bd
    $tosee = new att_devices();
    $usrarrobj = $tosee->Find("nombre ilike '%zk%'");
    
    /*
Para ejecutar Internet Explorer con privilegios de usuario limitados, use este comando:

     * 
psexec -l -d "c:\archivos de programa\internet explorer\iexplore.exe"*/
$path="\"".$_SERVER['DOCUMENT_ROOT']."/importing/AttLogs.exe\" ";
   // $path0=$_SERVER['DOCUMENT_ROOT'].'/PSTools/PsExec.exe -l -d "whoami" ';
    
    for ($cxq=0;$cxq<sizeof($usrarrobj);$cxq++){
        //$usrarrobj[$cxq]->ip;
        $arrae1[]= array("new"=>$path.$usrarrobj[$cxq]->ip); // recoge los marcajes del biometrico marca ZK (series del 2011) con la direccion 192.168.1.201/24 (los marcajes los inserta en att_logs_temporal)
        
    }
    foreach($arrae1 as $executing001){
       exec($executing001['new']);
        sleep(2);
    }
   // $rt = system($path);
   // sleep(5);
   //     die(var_dump($rt));
    
    
    
    //$dbconn3 = pg_connect("host=".$dbInfo->servidor." port=5432 dbname=".$dbInfo->bd." user=".$dbInfo->usuario." password=".$dbInfo->clave.""); //colocar el user y password correspondiente
    /*************************Compara los marcajes con un registro unico y los nuevos los inserta****************************************/
   $dbconn3 = pg_connect("host=".$dbInfo->servidor." port=5432 dbname=".$dbInfo->bd." user=".$dbInfo->usuario." password=".$dbInfo->clave.""); //colocar el user y password correspondiente
    /*************************Compara los marcajes con un registro unico y los nuevos los inserta****************************************/
    $result=pg_query($dbconn3,"select * from no_repetidos where (registro_unico not in (select (fecha,hora,att_persona_id)::text AS registro_unico from att_logs))");
    
    $rows = pg_num_rows($result);
    if($rows==0 || ($result==FALSE)){
            
        return false;
    
    
    } //detiene el script en caso de error o de cero registros
    
    $arreglo = array();
    // guarda los resultados de los nuevos marcajes en un Array
    while ($row = pg_fetch_assoc($result)) {
        $fhora = split(":", $row['hora']);
        $shareg = sha1($row['att_persona_id'].$fhora[0].$fhora[1]);
        
  $arreglo[]= array(
  'att_persona_id'=>$row['att_persona_id'],
  'fecha'=>$row['fecha'],
  'hora'=>$row['hora'],
  'hashcode'=>$shareg  
  );
}
    /************************************************************************/
    /************************************************************************/
    /************************************************************************/
    
    
    /******************** Recorre el Array bidimensional y los inserta en la tabla att_logs*/
    foreach($arreglo as $arreglorecorrido){
        $stringsql.="INSERT INTO att_logs VALUES (nextval('att_logs_id_seq'::regclass),";
        $stringsql.="'".$arreglorecorrido['att_persona_id']."','".$arreglorecorrido['fecha']."','".$arreglorecorrido['hora']."','".$arreglorecorrido['hashcode']."','5','5');";
    }
    pg_query($dbconn3,$stringsql);
    pg_close($dbconn3);
    
}
    
}
?>