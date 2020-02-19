<?php
        @include_once("../modulos/seguridad/globales/globales.php");
        @include_once('dataentidades/entidadesORM.php');
        @include_once(_ruta_clases  . _archivo_conexion_bd);
        @include_once("netping.php");
final class fetchingdata{
function __construct(){
    //echo "asdsad";
    
}    
function timingcounter(){
    $tosee = new att_devices();
    $usrarrobj = $tosee->Find("nombre ilike '%zk%'");
    return sizeof($usrarrobj);
    
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
$pathbw="\"".$_SERVER['DOCUMENT_ROOT']."/importingbw/AttLogs.exe\" ";
   // $path0=$_SERVER['DOCUMENT_ROOT'].'/PSTools/PsExec.exe -l -d "whoami" ';
    
    for ($cxq=0;$cxq<sizeof($usrarrobj);$cxq++){
        $ping=new Net_Ping();
$ping->Ping($usrarrobj[$cxq]->ip);
    if ($ping->time){
        if (stristr($usrarrobj[$cxq]->descripcion,"bw")===FALSE){
        $arrae1[]= array("new"=>$path.$usrarrobj[$cxq]->ip); // recoge los marcajes del biometrico marca ZK (series del 2011) con la direccion 192.168.1.201/24 (los marcajes los inserta en att_logs_temporal)    
            
        }else{
            $arrae1[]= array("new"=>$pathbw.$usrarrobj[$cxq]->ip); // recoge los marcajes del biometrico marca ZK (series del 2011) con la direccion 192.168.1.201/24 (los marcajes los inserta en att_logs_temporal) para la linea blanco y negro
            
        }
        //$usrarrobj[$cxq]->ip;
        
    }
    //echo "asdsasadsad";
        
        
        
    }
    //die(var_dump($arrae1));
    //sleep(5000);
    if (!empty($arrae1)){
    foreach($arrae1 as $executing001){
      exec($executing001['new']);
        //sleep(2);
    }
    }
    
    $usrarrobj2 = $tosee->Find("nombre ilike '%anviz%'"); 
    $path2="\"".$_SERVER['DOCUMENT_ROOT']."/gettinglogs/Project1.exe\" ";    
     for ($cxg=0;$cxg<sizeof($usrarrobj2);$cxg++){
        //$usrarrobj[$cxq]->ip;
        $arrae12[]= array("new"=>$path2.$usrarrobj2[$cxg]->ip); // recoge los marcajes del biometrico marca ZK (series del 2011) con la direccion 192.168.1.201/24 (los marcajes los inserta en att_logs_temporal)
        
    }
    //die(var_dump($arrae12));
    
    
         
    // die("hello");
    if (!empty($arrae12)){
     foreach($arrae12 as $executing002){
       exec($executing002['new']);
        //sleep(2);
    }   
    }
        
    
    
   // $rt = system($path);
   // sleep(5);
   //     die(var_dump($rt));
    
    
    
    //$dbconn3 = pg_connect("host=".$dbInfo->servidor." port=5432 dbname=".$dbInfo->bd." user=".$dbInfo->usuario." password=".$dbInfo->clave.""); //colocar el user y password correspondiente
    /*************************Compara los marcajes con un registro unico y los nuevos los inserta****************************************/
    
   $dbconn3 = pg_connect("host=".$dbInfo->servidor." port=5432 dbname=".$dbInfo->bd." user=".$dbInfo->usuario." password=".$dbInfo->clave."");
   
   
    //colocar el user y password correspondiente
    /*************************Compara los marcajes con un registro unico y los nuevos los inserta****************************************/
    $result=pg_query($dbconn3,"select * from no_repetidos where (registro_unico not in (select (fecha,hora,att_persona_id)::text AS registro_unico from att_logs))");
    
    $rows = pg_num_rows($result);
    if($rows==0 || ($result==FALSE)){
            
        die();
    
    
    } //detiene el script en caso de error o de cero registros
    
    $arreglo = array();
    // guarda los resultados de los nuevos marcajes en un Array
    while ($row = pg_fetch_assoc($result)) {
        $fixingschedule= new att_personas();
        $fixingschedule->Load("id=".(int)$row['att_persona_id']);
        $horario=(int)$fixingschedule->att_horario_id;
        $fhora = split(":", $row['hora']);
        $shareg = sha1($row['att_persona_id'].$fhora[0].$fhora[1]);
        
  $arreglo[]= array(
  'att_persona_id'=>$row['att_persona_id'],
  'fecha'=>$row['fecha'],
  'hora'=>$row['hora'],
  'horario'=>$horario,
  'hashcode'=>$shareg  
  );
}
    /************************************************************************/
    /************************************************************************/
    /************************************************************************/
    
    
    /******************** Recorre el Array bidimensional y los inserta en la tabla att_logs*/
    foreach($arreglo as $arreglorecorrido){
        $stringsql.="INSERT INTO att_logs VALUES (nextval('att_logs_id_seq'::regclass),";
        $stringsql.="'".$arreglorecorrido['att_persona_id']."','".$arreglorecorrido['fecha']."','".$arreglorecorrido['hora']."','".$arreglorecorrido['hashcode']."','5','".$arreglorecorrido['horario']."');";
    }
    pg_query($dbconn3,$stringsql);
    
    pg_close($dbconn3);
    
    
}
    
}
?>