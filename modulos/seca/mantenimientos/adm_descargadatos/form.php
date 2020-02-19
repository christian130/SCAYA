<?php
	/******************************************************************************************
	 *archivo que maneja e incluye todos los programas necesarios para la configuracon del menu
	******************************************************************************************/
	require_once("../../seguridad/globales/globales.php");
	require_once(_ruta_modulos_seguridad_inatranet . _archivo_valida_sesion);
	require_once(_ruta_clases . _archivo_conexion_bd);
	require_once(_ruta_librerias_php . _archivo_libreria_php);
?>
<link rel="stylesheet" type="text/css" href="<?php echo _ruta_clases;?>jquery/uploadify/uploadify.css" />
<script language="javascript" type="text/javascript" src="<?php echo _ruta_clases;?>jquery/uploadify/jquery.uploadify.js"></script>

<table width="900px" border="0" cellpadding="0" cellspacing="0" align="center" class="ui-state-focus ui-corner-all">
	<div id="bubble_tooltip">
	    <div class="bubble_top"><span></span></div>
	    <div class="bubble_middle"><span id="bubble_tooltip_content"></span></div>
	    <div class="bubble_bottom"></div>
	</div>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<table width="855px" border="0" cellpadding="0" cellspacing="0" align="center" >
			    <tr height="7"><td colspan="6"></td></tr>
				<tr>
			    	<td>&nbsp;&nbsp;</td>
			  		<td width="821px" nowrap="nowrap"><div class="titulo_modulos"> Descarga de Datos</div></td>
			    	<td width="24px"><img onmousemove="showToolTip(event,'Haga Click aqui para Desplegar la Ayuda en L&iacute;nea');return false" onmouseout="hideToolTip()" class="link" src="<?php echo _ruta_imagenes_iconos;?>help.gif" onclick="" /></td>
			  		<td>&nbsp;</td>
				</tr>
				<tr height="7"><td colspan="6"></td></tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" align="center">
			<form name="frmasistenciaatt" id="frmasistenciaatt" method="post" autocomplete="off">
				<div id="tabs">
					<ul style="width:855px;">

						<li><a href="#reg-masivo">Descarga de Datos</a></li>
					</ul>
					
					<div id="reg-masivo">
						<table width="855px" border="0" cellpadding="2" cellspacing="0" align="center" class="fieldset ui-corner-all">
							<tr><td colspan="4">&nbsp;</td></tr>
							<tr>
								<td align="right">
									<label for="txtarchivoatt"><span class="texto">Archivo:&nbsp;</span></label>
								</td>
								<td>
									<div id="txtarchivoatt">Debe habilitar JavaScript</div>
								</td>
								<td colspan="2">
									<label class="texto"><b>Archivo *.cvs</b>, con la <i>c&eacute;dula, Nombre y C&oacute;digo en el dispositivo.</i></label><br />
									<span>* Separado por comas (,)</span>
								</td>
							</tr>
							<tr>
								<td align="right"><label for="txtHorario"><span class="texto">Horario:&nbsp;</span></label></td>
								<td>
									<input type="text" name="txtHorarioMS" id="txtHorarioMS" maxlength="100" disabled="true" size="35"  class="caja_de_texto" value="[Normal]" onclick="" />
									<input type="button" name="cmdBHoraMs" id="cmdBHoraMs" value="..." class="botones ui-state-hover ui-corner-all" title="Haga click aqu&iacute; para Buscar Horario" />
									<input type="hidden" name="idHorarioMS" id="idHorarioMS" value="1" />&nbsp;<span>*</span>
								</td>
								<td align="right"><label for="txtDepartamento"><span class="texto">Departamento:&nbsp;</span></label></td>
								<td>
									<input type="text" name="txtDepartamentoMS" id="txtDepartamentoMS" disabled="true" maxlength="100" size="35"  class="caja_de_texto" value="" onclick="" />
									<input type="button" name="cmdBDptoMs" id="cmdBDptoMs" value="..." class="botones ui-state-hover ui-corner-all" title="Haga click aqu&iacute; para Buscar Departamento" />
									<input type="hidden" name="idDepartamentoMS" id="idDepartamentoMS" value="" />&nbsp;<span>*</span>
								</td>
							</tr>
							<tr>
								<td align="right"><label for="txtDepartamento"><span class="texto">Dispositivo Registrado:&nbsp;</span></label></td>
								<td>
									<input type="text" name="txtDispositivoMS" id="txtDispositivoMS" disabled="true" maxlength="100" size="35"  class="caja_de_texto" value="" onclick="" />
									<input type="button" name="cmdBDevMs" id="cmdBDevMs" value="..." class="botones ui-state-hover ui-corner-all" title="Haga click aqu&iacute; para Buscar Departamento" />
									<input type="hidden" name="idDeviceMS" id="idDeviceMS" value="" />&nbsp;<span>*</span>
								</td>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td colspan="2" align="center"><span>&nbsp;*&nbsp;Campos Requeridos&nbsp;</span></td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
							<tr>
								<td colspan="4" align="center">
									<input type="button" name="cmdImportar" id="cmdImportar" value="Importar" class="botones ui-state-hover ui-corner-all" title="Importar Masivo de Personas" />
									<input type="button" name="cmdCancelarMas" id="cmdCancelarMas" value="Reestablecer" class="botones ui-state-hover ui-corner-all" title="Reestablecer" />
								</td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
						</table>
					</div>
				</div>
			<div id="modal_personal" /><div id="modAll" /><div id="modDpto" /><div id="modHr" /><div id="modDev" />
			</form>
			</td>
		</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<script language="javascript" type="text/javascript">
var msg;
	$(document).ready(
	function()
	{
		$(":input").addClass("ui-corner-all");
		$("span:contains('*')").addClass("mensaje");
		$("span:contains('*')").addClass("ui-state-error");
		$("span:contains('*')").addClass("ui-corner-all");
		$("#cmdAccion").bind("click", {acc: "A"}, Accion);
		$("#cmdBuscar").bind("click", function(){ $("#modAll").dialog("open"); });
		$("#cmdEliminar").bind("click", function(){ Eliminar(); });
		$("#cmdCancelar").bind("click", function(){ Reestablecer(); });
		$("#cmdCancelarMas").bind("click", function(){ clear_masivo(); });
		$("#cmdImportar").bind("click", function() { enviar_datos(); });
		$("#cmdBDpto").bind("click", function(){ $("#modDpto").dialog("open"); });
		$("#cmdBHora").bind("click", function(){ $("#modHr").dialog("open"); });
		$("#cmdBDev").bind("click", function(){ $("#modDev").dialog("open"); });
		$("#cmdBDptoMs").bind("click", function(){ $("#modDpto").dialog("open"); });
		$("#cmdBHoraMs").bind("click", function(){ $("#modHr").dialog("open"); });
		$("#cmdBDevMs").bind("click", function(){ $("#modDev").dialog("open"); });
		$("#tabs").tabs();
	 $('#txtarchivoatt').uploadify({
	 	'auto': false,
	 	'swf'      : '../../../clases/jquery/uploadify/uploadify.swf',
		'uploader' : '../../../modulos/seca/mantenimientos/adm_descargadatos/upload_form.php',
		'fileTypeExts' : '*.csv',
		'fileTypeDesc' : 'CSV (Separados con comas)',
	 	'onUploadError' : function(file, errorCode, errorMsg, errorString){
         	alert('The file ' + file.name + ' could not be uploaded: ' + errorString + errorMsg);         	
         }
        // Put your options here
    }); 
		
	});
	
	$("#modAll")
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $("#modAll").dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: '700px',
			title: "Busqueda de Personal",
			open: function()
			{
				$("#modAll").load("<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/modal_busq.php?src=0");
			}
		});

	$("#modDpto")
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $("#modDpto").dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: '350px',
			title: "Seleccione Departamento",
			open: function()
			{
				$("#modDpto").load("<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/modal_dpto.php");
			}
		});

	$("#modDev")
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $("#modDev").dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: '350px',
			title: "Seleccione Dispositivo",
			open: function() { $("#modDev").load("<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/modal_device.php"); }
		});
		
	$("#modHr")
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $("#modHr").dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: '350px',
			title: "Seleccione Horario",
			open: function() { $("#modHr").load("<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/modal_hora.php"); }
		});

	/*function procesar_masivo(){
		$("#cmdImportar").attr("disabled","true");
		if ($("#idDepartamentoMS").val() == "") {
			$.jGrowl('Debe Especificar el departamento de procedencia de la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		} else if ($("#idDeviceMS").val() == "") {
			$.jGrowl('Debe Especificar el Dispositivo donde esta registrada la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		} else {
			$('#txtarchivoatt').uploadifySettings('scriptData', {'horario' : $("#idHorarioMS").val(), 'dispositivo' : $("#idDeviceMS").val(), 'departamento' : $("#idDepartamentoMS").val()});
			$('#txtarchivoatt').uploadifyUpload();
		}
		$("#cmdImportar").attr("disabled","");
	}*/
	
	function clear_masivo(){
		$("#txtHorarioMS").val("[Normal]");
		$("#idHorarioMS").val("1");
		$("#txtDepartamentoMS").val("");
		$("#idDepartamentoMS").val("");
		$("#txtDispositivoMS").val("");
		$("#idDeviceMS").val("");
		$("#cmdImportar").attr("disabled","");
	}

	function SearchResult(id,ced,nombre,codhr,hr,coddepto,depto,devCod,contrato,activo,idDev,devName,admin)
	{
		$("#idPersona").val(id);	
		$("#txtCedula").val(ced);
		$("#txtNombre").val(nombre);
		$("#txtHorario").val(hr);
		$("#idHorario").val(codhr);
		$("#txtDepartamento").val(depto);
		$("#idDepartamento").val(coddepto);
		$("#txtDispositivo").val(devName);
		$("#idDevice").val(idDev);
		$("#txtCDev").val(devCod);
		$("#txtContrato").attr("checked", contrato=='t' ? true : false);
		$("#txtActivo").attr("checked", activo=='t' ? true : false);
		$("#txtAdm").attr("checked", admin=='t' ? true : false);
		$("#cmdAccion").val("Modificar");
		$("#cmdAccion").unbind("click", {acc: 'A'}, Accion);
		$("#cmdAccion").bind("click", {acc: 'M'}, Accion);
		$("#cmdEliminar").attr("style","visibility:visible");
		$("#modAll").dialog("close");
	}
	
	function Eliminar()
	{
		if ($("#idPersona").val() != "") {
			jConfirm('&#191;Seguro desea Eliminar a la Persona: '+$("#txtNombre").val()+'?', 'Eliminar Personal', function(r) {
			    if(r){
					var frmData = 'id='+$("#idPersona").val();
					//"id=" + $("#idPersona").val()
					$.ajax({
						type: "post",
						url: "<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/acciones.php?acc=E",
						data: frmData,
						beforeSend: function(objeto){
							$("#cmdEliminar").val("Procesando...");
							$("#cmdEliminar").attr("disabled", true);
							$("#cmdAccion").attr("disabled", true);
						},
						error: function(objeto, quepaso, otroobj){
							$.jGrowl(quepaso, {
								theme: "alerta",
								header: 'ERROR'
							});
							$("#cmdEliminar").val("Eliminar");
							$("#cmdEliminar").attr("disabled", false);
							$("#cmdAccion").attr("disabled", false);
						},
						success: function(datos){
							$.jGrowl("Persona Eliminada. " + datos, {
								theme: "satisfactorio",
								header: 'Informaci&oacute;n'
							});
							Reestablecer();
						}
					});
				}
			});	
		}
	}
	
	function retDepartamento(id, val){
		$("#txtDepartamento").val(val);
		$("#idDepartamento").val(id);
		$("#txtDepartamentoMS").val(val);
		$("#idDepartamentoMS").val(id);
		$("#modDpto").dialog("close");		
	}
	
	function retDispositivo(id, val){
		$("#txtDispositivo").val(val);
		$("#idDevice").val(id);txtarchivoatt
		$("#txtDispositivoMS").val(val);
		$("#idDeviceMS").val(id);
		$("#modDev").dialog("close");		
	}
	
	function retHorario(id, val){
		$("#txtHorarioMS").val(val);
		$("#idHorarioMS").val(id);
		$("#txtHorario").val(val);
		$("#idHorario").val(id);
		$("#modHr").dialog("close");		
	}
	
	function Accion(e){
		$("#cmdAccion").attr("disabled","true");
		$("#cmdAccion").val("Procesando...");
		if ($("#txtCedula").val() == "") {
			$.jGrowl('Debe ingresar el n&uacute;mero de C&eacute;deula a consultar.', { theme: "alerta", header: 'Informaci&oacute;n' });
		}else if ($("#txtNombre").val() == "") {
			$.jGrowl('Debe colocar el nombre de la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		}else if ($("#idDepartamento").val() == "") {
			$.jGrowl('Debe Especificar el departamento de procedencia de la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		}else if ($("#idDevice").val() == "") {
			$.jGrowl('Debe Especificar el Dispositivo donde esta registrada la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		}else if ($("#txtCDev").val() == "") {
			$.jGrowl('Debe Especificar el c&oacute;digo de la persona en Dispositivo.', { theme: "alerta", header: 'Informaci&oacute;n' });
		} else {
			//opc = $("#idPersona").val()=="0" ? 'A' : 'M';
			SendData(e.data.acc);
		}
		$("#cmdAccion").val("Grabar");
		$("#cmdAccion").attr("disabled","false");
	}
	
	function SendData(acc){
		var v_data="idp="+$("#idPersona").val()+"&cedula="+$("#txtCedula").val()+"&nombre="+$("#txtNombre").val()+"&codhr="+$("#idHorario").val()+"&coddepto="+$("#idDepartamento").val();
		v_data=v_data+"&devid="+$("#txtCDev").val()+"&coddev="+$("#idDevice").val()+"&contrato="+$("#txtContrato").is(":checked");
		v_data=v_data+"&activo="+$("#txtActivo").is(":checked")+"&admin="+$("#txtAdm").is(":checked");
		$.ajax({
	        type:"post",
	        url:"<?php echo _ruta_modulos_seca; ?>mantenimientos/adm_personal/acciones.php?acc="+acc,
	        data:v_data,
			beforeSend: function(objeto){ 
				$("#cmdEliminar").attr("disabled", true);
				$("#cmdAccion").val("Procesando...");
				$("#cmdAccion").attr("disabled", true);
			    },
			error: function(objeto, quepaso, otroobj){
	            $.jGrowl(quepaso, { 
			   	 theme: "alerta" ,
				 header: 'ERROR'
				});
				$("#cmdEliminar").attr("disabled", false);
				$("#cmdAccion").val("Modificar");
				$("#cmdAccion").attr("disabled", false);
				},
			success: function(datos){
	            $.jGrowl("Data Actualizada "+datos, { 
			   	 theme: "satisfactorio" ,
				 header: 'Informaci&oacute;n'
				});
				Reestablecer();
				}
		});
	}
	
	function Reestablecer()
	{
		//if ($("#txtContrato").is(":checked"))	
		$("#idPersona").val("0");	
		$("#txtCedula").val("");
		$("#txtNombre").val("");
		$("#txtHorario").val("[Normal]");
		$("#idHorario").val("1");
		$("#txtDepartamento").val("");
		$("#idDepartamento").val("");
		$("#txtCDev").val("");
		$("#txtDispositivo").val("");
		$("#idDevice").val("");
		$("#txtContrato").attr("checked", false);
		$("#txtActivo").attr("checked", false);
		$("#txtAdm").attr("checked", false);
		$("#cmdAccion").val("Grabar");
		$("#cmdAccion").bind("click", {acc: 'A'}, Accion);
		$("#cmdEliminar").attr("style","visibility:hidden");
		$("#cmdEliminar").val("Eliminar");
		$("#cmdEliminar").attr("disabled", false);
		$("#cmdAccion").attr("disabled", false);
	}
	
	function enviar_datos()
	{
		//$("#cmdImportar").attr("disabled","true");
		//if ($("#txtDispositivoMS").val() == "") {
		//	$.jGrowl('Debe Especificar el Dispositivo donde esta registrada la persona.', { theme: "alerta", header: 'Informaci&oacute;n' });
		//} else {
			$('#txtarchivoatt').uploadify('upload','*');
		//}
		//$("#cmdImportar").attr("disabled","");	
	}
</script>
