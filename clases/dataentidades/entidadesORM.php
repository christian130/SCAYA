<?php
   @include_once('../../../../clases/adodb5/adodb.inc.php');
   @include_once('../../../../clases/adodb5/adodb-active-record.inc.php');
   @include_once('../../../../clases/adodb5/adodb-exceptions.inc.php');
   @include_once('../../../../clases/RecordsetPostgreSQL.php');
   
   @include_once('../../../clases/adodb5/adodb.inc.php');
   @include_once('../../../clases/adodb5/adodb-active-record.inc.php');
   @include_once('../../../clases/adodb5/adodb-exceptions.inc.php');
   @include_once('../../../clases/RecordsetPostgreSQL.php');

   $dbInfo = new clsConnex();

   $gDbCon = NewADOConnection('pgsql://'.$dbInfo->usuario.':'.$dbInfo->clave.'@'.$dbInfo->servidor.'/'.$dbInfo->bd);
   //$gDbCon->Debug=true;
   //$gDbCon->Trace=true;
   ADOdb_Active_Record::SetDatabaseAdapter($gDbCon);
   $gDbCon->SetFetchMode(ADODB_FETCH_ASSOC);
   
   
   class att_attlogs extends ADOdb_Active_Record{ var $_table = 'att_logs'; }
   
   class att_personas extends ADOdb_Active_Record{ var $_table = 'att_personas'; }
   
   class file_matching extends ADOdb_Active_Record{var $_table = 'file_indexing';}
   
   class att_departamentos extends ADOdb_Active_Record{ var $_table = 'att_departamentos'; }
   class att_estados extends ADOdb_Active_Record { var $_table='att_statusemployee';  } 
   class att_horarios extends ADOdb_Active_Record{ var $_table = 'att_horarios'; }
   class file_uploading222 extends ADOdb_Active_Record { var $_table = 'listing_files'; }
   class att_devices extends ADOdb_Active_Record { var $_table = 'att_devices'; }
   class view_nuevos_data extends ADOdb_Active_Record {
   var $_table= 'registros_nuevos_unicos_view'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));    
   }
   }
   class personal_data_extended extends ADOdb_Active_Record {
   var $_table= 'reporte_excel_personal3'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));    
   }
   }
   
   class tblFechas extends ADOdb_Active_Record {
   var $_table='fechas'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));
   } 
   }
   class greenlight extends ADOdb_Active_Record{
   	var $_table='reporte_personal_to_inasistencias';
	function __construct(){
   parent::__construct($this->_table,array('id'));
   }
   }
   class tblAusentiae extends ADOdb_Active_Record {
   var $_table='ausentiae2'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));
   } 
   }
   
   /*class tblretardos_horario_1 extends ADOdb_Active_Record{
   	var $table='retardos_horario_1';
	function __construct(){
		
	}
	
   }*/
   class tblattlogsview extends ADOdb_Active_Record {
   var $_table='selecting'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));
   } 
   }
   
   function getDay($DayOfWeek){
   	$dow = array(0=>"DOMINGO", 1=>"LUNES", 2=>"MARTES", 3=>"MIERCOLES", 4=>"JUEVES", 5=>"VIERNES", 6=>"SABADO");
   	return $dow[$DayOfWeek];
   }
   class llegada_late_part_time extends ADOdb_Active_Record {
   var $_table='retardos_horario_1'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));
   } 
   }
   
   
   
   
   class llegada_late_full_time extends ADOdb_Active_Record {
   var $_table='retardo_horario_2'; 
   function __construct(){
   parent::__construct($this->_table,array('id'));
   } 
   }
   
?>
