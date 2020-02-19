<?php
	/******************************************************************************************
	 *archivo que maneja e incluye todos los programas necesarios para la configuracon del menu
	******************************************************************************************/
	require_once("../../seguridad/globales/globales.php");
	require_once(_ruta_modulos_seguridad_inatranet . _archivo_valida_sesion);
	require_once(_ruta_clases . _archivo_conexion_bd);
	require_once(_ruta_librerias_php . _archivo_libreria_php);
?>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_librerias_javascript . _archivo_libreria_javascript;?>"></script>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>jquery/jquery.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>jquery/uploadify/jquery.uploadify.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>jquery_jgrowl/jgrowl.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>jquery_ui/js/jquery_ui.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>tooltips/bubble_tooltip/js/bubble-tooltip.js"></script>

<link href="<?php echo _ruta_css . _archivo_clase_estilos;?>" rel="stylesheet" type="text/css" />
<link href="<?php echo _ruta_clases;?>jquery_ui/css/blitzer/jquery_ui.css" rel="stylesheet" type="text/css" />
<link href="<?php echo _ruta_clases;?>tooltips/bubble_tooltip/css/bubble-tooltip.css" rel="stylesheet" type="text/css" />
<table width="900px" border="0" cellpadding="0" cellspacing="0" align="center" class="ui-state-focus ui-corner-all">
	<div id="bubble_tooltip">
	    <div class="bubble_top"><span></span></div>
	    <div class="bubble_middle"><span id="bubble_tooltip_content"></span></div>
	    <div class="bubble_bottom"></div>
	</div>
	<tr><td>&nbsp;</td></tr>
	<tr><td><table width="855px" border="0" cellpadding="0" cellspacing="0" align="center" class="ui-state-default ui-corner-all">
	    <tr height="7"><td colspan="6"></td></tr>
		<tr>
	    	<td>&nbsp;&nbsp;</td>
	  		<td width="821px" nowrap="nowrap"><div class="titulo_modulos">Administraci&oacute;n de Accesos</div></td>
	    	<td width="24px"><img onmousemove="showToolTip(event,'Haga Click aqui para Desplegar la Ayuda en L&iacute;nea');return false" onmouseout="hideToolTip()" class="link" src="<?php echo _ruta_imagenes_iconos;?>help.gif" onclick="" /></td>
	  		<td>&nbsp;</td>
		</tr>
		<tr height="7"><td colspan="6"></td></tr>
	</table></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan="4" align="center"><form name="frmasistenciaatt" id="frmasistenciaatt" method="post" autocomplete="off"><table width="855px" border="0" cellpadding="0" cellspacing="0" align="center" class="fieldset ui-corner-all">
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td width="40">&nbsp;</td>
			<td width="380">
				<label for="txtCedula"><span class="texto">C&eacute;dula:&nbsp;</span></label>
				<input type="text" name="txtCedula" id="txtCedula" maxlength="9" size="40"  class="caja_de_texto" value="" onclick="" />&nbsp;<span>*</span>
			</td>
			<td>
				<label for="txtfecha"><span class="texto">Fecha de Asistencia:&nbsp;</span></label>
				<input type="text" name="txtfecha" id="txtfecha" value="" maxlength="10" class="caja_de_texto" size="20" onkeypress="">
				<span>*</span>
			</td>
			<td width="40">&nbsp;</td>
		</tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2" align="right"><span>&nbsp;*&nbsp;Campos Requeridos&nbsp;</span></td>
			<td>&nbsp;</td>
			
		</tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr><td colspan="4" align="center">
			<input type="button" name="cmdBuscar" id="cmdBuscar" value="Buscar" class="botones ui-state-hover ui-corner-all" title="Haga click aqu&iacute; para Buscar Asistencia" />
		</td></tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<div id="modal_personal"></div>
	</table><div id="modATT"></div></form></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<script language="javascript" type="text/javascript">
	$(document).ready(
	function()
	{
		$(":input").addClass("ui-corner-all");
		$("span:contains('*')").addClass("mensaje");
		$("span:contains('*')").addClass("ui-state-error");
		$("span:contains('*')").addClass("ui-corner-all");
		$("#cmdBuscar").bind("click", function(){ BuscarATT(); });
		$("#txtfecha").bind("click", function(){ DP_jQuery.datepicker._showDatepicker(this); });
		
		jDatePicker("#txtfecha",'<?php echo _ruta_imagenes_iconos;?>',<?php echo date("d");?>,<?php echo date("m");?>,<?php echo date("Y");?>);
	});
	
	$("#modATT")
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $("#modATT").dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: '300px',
			title: "Administraci&oacute;n de Acceso",
			open: function()
			{
				$("#modATT").load("<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_accesos/manejo.php?ci="+$("#txtCedula").val()+"&f="+$("#txtfecha").val());
			}
		});

	function BuscarATT()
	{
		if ($("#txtCedula").val() == "") {
			$.jGrowl('Debe ingresar el n&uacute;mero de C&eacute;deula a consultar.', { theme: "alerta", header: 'Informaci&oacute;n' });
		}else if ($("#txtfecha").val() == "") {
			$.jGrowl('Debe especificar la fecha de consulta.', { theme: "alerta", header: 'Informaci&oacute;n' });
		} else {
			$("#modATT").dialog("open");
		}
	}
</script>