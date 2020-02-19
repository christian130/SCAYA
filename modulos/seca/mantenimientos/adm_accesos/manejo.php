<?php
	$ci = $_GET['ci'];
	$fch = $_GET['f'];
	
	$ff = split('/', $_GET['f']);
	$fechaList = $ff[2]."-".$ff[1]."-".$ff[0];

	if(empty($ci) || empty($fch)){
		echo "<spam>Parametros invalidos.</spam>";
		die();
	}

	require_once("../../../seguridad/globales/globales.php");
	include_once('../../../../clases/dataentidades/entidadesORM.php');
	include_once('../../../../clases/class.alcSeca.tiempo.php');

	$Pers = new att_personas();
	$Pers->Load("cedula=$ci");
	
	$att = new att_attlogs();
	$tManager = new alcSecaTimes();
	
	$attArr = $att->Find("att_persona_id=".$Pers->id." AND fecha='".$fechaList."' order by hora");
	$PersHora = new att_horarios();
	$attHorarioArr = $PersHora->Load("id=".$Pers->att_horario_id);
	if($attHorarioArr>0){
		$attHorarioArr = $PersHora->Find("id=".$Pers->att_horario_id);
	}else{
		$attHorarioArr = $PersHora->Find("idefault=true");
	}
	$MasterTimes = $tManager->MarcaTiempo($attArr, $attHorarioArr);
	
	?>
	<label><span class="texto">Persona:&nbsp;</span></label>
	<input type="text" value="<?php echo $Pers->cedula.' - '.$Pers->nombre; ?>" disabled="true" class="caja_de_texto" size="30" onkeypress="" /><br />
	<label><span class="texto">&nbsp;&nbsp;&nbsp;&nbsp;Fecha:&nbsp;</span></label>
	<input type="text" value="<?php echo $fch; ?>" disabled="true" class="caja_de_texto" size="20" onkeypress="" /><br />
	<br />
	
	<form method="post" autocomplete="off">
		<div id="tabs">
			<ul>
				<li><a href="#marcas">Asistencia</a></li>
				<li><a href="#marcas-del">Marcas</a></li>
			</ul>
			<div id="marcas">
				<fieldset>
					<legend>Ma&ntilde;ana</legend>
					<label class="texto">&nbsp;Entrada:&nbsp;</label>
					<input type="text" value="<?php echo $MasterTimes['m'][0]['hora']; ?>" id="txtm0" name="txtm0" value="" maxlength="5" class="caja_de_texto" size="10" onkeypress="" />
					<input type="hidden" id="txtim0" name="txtim0" value="<?php echo $MasterTimes['m'][0]['idReg']; ?>">
					<input type="button" name="cmdUpdate1" id="cmdUpdate1" value=">>" class="botones ui-state-hover ui-corner-all" title="Actualizar entrada Mañana" />
					<br />
					<label class="texto">&nbsp;&nbsp;&nbsp;Salida:&nbsp;</label>
					<input type="text" value="<?php echo $MasterTimes['m'][1]['hora']; ?>" id="txtm1" name="txtm1" value="" maxlength="5" class="caja_de_texto" size="10" onkeypress="" />
					<input type="hidden" id="txtim1" name="txtim1" value="<?php echo $MasterTimes['m'][1]['idReg']; ?>">
					<input type="button" name="cmdUpdate2" id="cmdUpdate2" value=">>" class="botones ui-state-hover ui-corner-all" title="Actualizar salida mañana" />
				</fieldset>
				<fieldset>
					<legend>Tarde</legend>
					<label class="texto">&nbsp;Entrada:&nbsp;</label>
					<input type="text" value="<?php echo $MasterTimes['t'][0]['hora']; ?>" id="txtt0" name="txtt0" value="" maxlength="5" class="caja_de_texto" size="10" onkeypress="" />
					<input type="hidden" id="txtit0" name="txtit0" value="<?php echo $MasterTimes['t'][0]['idReg']; ?>">
					<input type="button" name="cmdUpdate3" id="cmdUpdate3" value=">>" class="botones ui-state-hover ui-corner-all" title="Actualizar entrada tarde" />
					<br />
					<label class="texto">&nbsp;&nbsp;&nbsp;Salida:&nbsp;</label>
					<input type="text" value="<?php echo $MasterTimes['t'][1]['hora']; ?>" id="txtt1" name="txtt1" value="" maxlength="5" class="caja_de_texto" size="10" onkeypress="" />
					<input type="hidden" id="txtit1" name="txtit1" value="<?php echo $MasterTimes['t'][1]['idReg']; ?>">
					<input type="button" name="cmdUpdate4" id="cmdUpdate4" value=">>" class="botones ui-state-hover ui-corner-all" title="Actualizar salida tarde" />
				</fieldset>
			</div>
			<div id="marcas-del">
				<fieldset>
					<legend>Horas</legend>
				<?php
					for($x=0;$x<sizeof($attArr);$x++) {
						?>
						<label class="texto">&gt;&gt;<?php echo $attArr[$x]->hora; ?></label>
						<input type="button" name="cmdDel<?php echo $x; ?>" id="cmdDel<?php echo $x; ?>" value="X" class="botones ui-state-hover ui-corner-all" title="Eliminar Marca de Tiempo" onclick="delReg(<?php echo $attArr[$x]->id; ?>);" />
						<br />

						<?php
//					echo ">> ".$attArr[$x]->id." -- ".$attArr[$x]->fecha." -- ".$attArr[$x]->hora."<br />";
					}
					//print_r($attArr);
				?>
				</fieldset>
			</div>
		</div>
	</form>	
	
<script language="javascript" type="text/javascript">
	$(document).ready(
	function()
	{
		$("#tabs").tabs();
		$("#cmdUpdate1").bind("click", function(){ Procesar($("#txtim0").val(),$("#txtm0").val()); });
		$("#cmdUpdate2").bind("click", function(){ Procesar($("#txtim1").val(),$("#txtm1").val()); });
		$("#cmdUpdate3").bind("click", function(){ Procesar($("#txtit0").val(),$("#txtt0").val()); });
		$("#cmdUpdate4").bind("click", function(){ Procesar($("#txtit1").val(),$("#txtt1").val()); });
	});
	
	function delReg(v_id){
		$.ajax({
	        type:"post",
	        url:"<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_accesos/acciones.php?acc=E",
	        data:'vid='+v_id,
			error: function(objeto, quepaso, otroobj){
	            $.jGrowl(quepaso, { 
			   	 theme: "alerta" ,
				 header: 'ERROR'
				}); },
			success: function(datos){
	            $.jGrowl("Data Actualizada "+datos, { 
			   	 theme: "satisfactorio" ,
				 header: 'Informaci&oacute;n'
				});
				$("#modATT").dialog("close");
				 }
		  });
	}
	
	function Procesar(id_dat, val_dat){
		var v_id = <?php echo $Pers->id; ?>;
		var v_fch = <?php echo "'".$fechaList."'"; ?>;
		var v_data="uid="+v_id+"&fch="+v_fch+"&idd="+id_dat+"&vald="+val_dat;
		$.ajax({
	        type:"post",
	        url:"<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_accesos/acciones.php",
	        data:v_data,
			error: function(objeto, quepaso, otroobj){
	            $.jGrowl(quepaso, { 
			   	 theme: "alerta" ,
				 header: 'ERROR'
				}); },
			success: function(datos){
	            $.jGrowl("Data Actualizada "+datos, { 
			   	 theme: "satisfactorio" ,
				 header: 'Informaci&oacute;n'
				});
				$("#modATT").dialog("close");
				 }
		  });
	}
</script>