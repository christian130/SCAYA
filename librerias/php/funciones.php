<?php
	//funcion que limpia los campos y los transforma en formato html
	function codificar($texto)
	{
		return htmlentities(stripslashes(str_replace("'","",trim($texto))),ENT_QUOTES,"UTF-8");
	}

	//funcion que permite codificar en UTF-8 bajo el formato HTML
	function decodificar($texto)
	{
		return html_entity_decode(stripslashes($texto),ENT_QUOTES,"UTF-8");
	}
	
	//funcion que devuelve el valor numerico de un string
	function convertirnumeros($texto)
	{
		return intval(stripslashes($texto));
	}
	
	//funcion que permite abrir la sesion en la bd y registra en bitacora
	function abrirsesion($id,$nombreusuario,$ci)
	{
		//declaracion de variable de sesion para el usuario
		$_SESSION["idtemp"];
		//declaracion de variable de sesion para la navegacion del menu
		$_SESSION["seleccionmodulo"];
		$_SESSION["seleccionsubmodulo"];
		$_SESSION["seleccionprograma"];
		$_SESSION["idconfiguracion"];
		//asigna el valor del usuario encriptado en md5
		$_SESSION["idtemp"] = md5($nombreusuario . date('dmYGis'));
		//asigna el valor de las variables de menu 
		$_SESSION["seleccionmodulo"] = "";
		$_SESSION["seleccionsubmodulo"] = "";
		$_SESSION["seleccionprograma"] = "";
		$_SESSION["idconfiguracion"];
		//crea el registro temporal en bd usuarios
		$rcsusuariotemp = new Recordset();
		$consulta = "UPDATE seguridad_usuarios SET idtemp = '" . $_SESSION["idtemp"] . "' WHERE cedula = '" . $ci . "'";
		$rcsusuariotemp->sql = $consulta;
		$rcsusuariotemp->abrir();
		//registro de inicio de sesion en bitacora
		registrobitacora("","","Apertura de Sesión",$id ,"");
	}
	
	//funcion que permite cerrar la sesion en la bd y registra en bitacora
	function cerrarsesion($id)
	{
		//elimina el registro temporal en bd usuarios
		$rcsusuariotemp = new Recordset();
		$consulta = "UPDATE seguridad_usuarios SET idtemp = '' WHERE idtemp = '" . $_SESSION["idtemp"] . "'";
		$rcsusuariotemp->sql = $consulta;
		$rcsusuariotemp->abrir();
		//registro de cierre de sesion en bitacora
		registrobitacora("","","Cierre de Sesión",$id ,"");
		//destruye la sesion anterior
		session_unset();
		session_destroy();
	}

	//funcion que trae valores de la tabla usuarios de la bd
	function registrobitacora($entidad,$nro_registro,$actividad,$usuario,$programa)
	{
		$rcsbitacora = new Recordset();
		$consulta = "INSERT INTO seguridad_bitacora (fecha,hora,entidad,nro_registro,actividad,ip,idusuario,programa) VALUES ('" . date('Y/m/d') . "', '" . date('G:i:s') . "', '" . $entidad . "', '" . $nro_registro . "', '" . codificar($actividad) . "','" . obtenerip() . "', '" . $usuario . "', '" . $programa . "')";
		$rcsbitacora->sql = $consulta;
		$rcsbitacora->abrir();
	}
	
	//funcion que trae valores de la tabla usuarios de la bd
	function traercampos($bd,$entidad,$campo,$filtro,$valor_busqueda)
	{
		$rcsusuariotemp = new Recordset();
		if (!empty($bd)) $rcsusuariotemp->bd = $bd;
		$consulta = "SELECT " . $campo . " FROM " . $entidad . " where " . $filtro . " = '" . $valor_busqueda . "'";
		$rcsusuariotemp->sql = $consulta;
		$rcsusuariotemp->abrir();
		$rcsusuariotemp->siguiente();
		return trim($rcsusuariotemp->fila[$campo]);
		$rcsusuariotemp->cerrar();
	}

	
	//funcion que guarda los privilegios asignados a los usuarios para cada programa
	function guardarprivilegios($tipo,$idusuario_privilegio,$id,$privilegios)
	{
		//se crea la consulta dependiendo del tipo (modulos,submodulo,seccion,programa) con la finalidad de eliminar los privilegios ya otorgados
		switch ($tipo)
		{
			case "modulo":
				$consulta = "SELECT seguridad_usuarios_programas_privilegios.idusuarios_programas_privilegios FROM seguridad_usuarios_programas_privilegios INNER JOIN seguridad_programas ON (seguridad_usuarios_programas_privilegios.idprograma = seguridad_programas.idprograma) INNER JOIN seguridad_secciones ON (seguridad_programas.idseccion = seguridad_secciones.idseccion) INNER JOIN seguridad_submodulos ON (seguridad_secciones.idsubmodulo = seguridad_submodulos.idsubmodulo) INNER JOIN seguridad_modulos ON (seguridad_submodulos.idmodulo = seguridad_modulos.idmodulo) WHERE (seguridad_usuarios_programas_privilegios.idusuario = '" . $idusuario_privilegio . "') AND (seguridad_modulos.idmodulo = '" . $id . "') ORDER BY seguridad_modulos.modulo";
				break;
			case "submodulo":
				$consulta = "SELECT seguridad_usuarios_programas_privilegios.idusuarios_programas_privilegios FROM seguridad_usuarios_programas_privilegios INNER JOIN seguridad_programas ON (seguridad_usuarios_programas_privilegios.idprograma = seguridad_programas.idprograma) INNER JOIN seguridad_secciones ON (seguridad_programas.idseccion = seguridad_secciones.idseccion) INNER JOIN seguridad_submodulos ON (seguridad_secciones.idsubmodulo = seguridad_submodulos.idsubmodulo) WHERE (seguridad_usuarios_programas_privilegios.idusuario = '" . $idusuario_privilegio . "') AND (seguridad_submodulos.idsubmodulo = '" . $id . "') ORDER BY seguridad_submodulos.submodulo";
				break;
			case "seccion":
				$consulta = "SELECT seguridad_usuarios_programas_privilegios.idusuarios_programas_privilegios FROM seguridad_usuarios_programas_privilegios INNER JOIN seguridad_programas ON (seguridad_usuarios_programas_privilegios.idprograma = seguridad_programas.idprograma) INNER JOIN seguridad_secciones ON (seguridad_programas.idseccion = seguridad_secciones.idseccion) WHERE (seguridad_usuarios_programas_privilegios.idusuario = '" . $idusuario_privilegio . "') AND (seguridad_secciones.idseccion = '" . $id . "') ORDER BY seguridad_secciones.seccion";
				break;
			case "programa":
				$consulta = "SELECT seguridad_usuarios_programas_privilegios.idusuarios_programas_privilegios FROM seguridad_usuarios_programas_privilegios INNER JOIN seguridad_programas ON (seguridad_usuarios_programas_privilegios.idprograma = seguridad_programas.idprograma) WHERE (seguridad_usuarios_programas_privilegios.idusuario = '" . $idusuario_privilegio . "') AND (seguridad_programas.idprograma = '" . $id . "') ORDER BY seguridad_programas.programa";			
				break;
		}
		$rcsdatos = new Recordset();
		$rcsdatos->sql = $consulta;
		$rcsdatos->abrir();
		if ($rcsdatos->total_registros > 0) 
		{
			for($i = 1; $i <= $rcsdatos->total_registros; $i++) 
			{
				//se eliminan los privilegios para cada programa de el modulo
				$rcsdatos->siguiente();
				$rcsprograma = new Recordset();
				$consulta = "DELETE FROM seguridad_usuarios_programas_privilegios WHERE idusuarios_programas_privilegios = '" . $rcsdatos->fila["idusuarios_programas_privilegios"] . "'";
				$rcsprograma->sql = $consulta;
				$rcsprograma->abrir();
			}
		}
		$rcsdatos->cerrar();
		//se crea la consulta dependiendo del privilegio que se quiera dar (modulos,submodulo,seccion,programa)
		$privilegios = explode("#", $privilegios);
		switch ($tipo)
		{
			case "modulo":
				$consulta = "SELECT seguridad_programas.idprograma FROM seguridad_modulos INNER JOIN seguridad_submodulos ON (seguridad_modulos.idmodulo = seguridad_submodulos.idmodulo) INNER JOIN seguridad_secciones ON (seguridad_submodulos.idsubmodulo = seguridad_secciones.idsubmodulo) INNER JOIN seguridad_programas ON (seguridad_secciones.idseccion = seguridad_programas.idseccion) WHERE (seguridad_modulos.idmodulo = '" . $id . "') ORDER BY seguridad_modulos.modulo";
				break;
			case "submodulo":
				$consulta = "SELECT seguridad_programas.idprograma FROM seguridad_submodulos INNER JOIN seguridad_secciones ON (seguridad_submodulos.idsubmodulo = seguridad_secciones.idsubmodulo) INNER JOIN seguridad_programas ON (seguridad_secciones.idseccion = seguridad_programas.idseccion) WHERE (seguridad_submodulos.idsubmodulo = '" . $id . "') ORDER BY seguridad_submodulos.submodulo";
				break;
			case "seccion":
				$consulta = "SELECT seguridad_programas.idprograma FROM seguridad_secciones INNER JOIN seguridad_programas ON (seguridad_secciones.idseccion = seguridad_programas.idseccion) WHERE (seguridad_secciones.idseccion = '" . $id . "') ORDER BY seguridad_secciones.seccion";
				break;
			case "programa":
				$consulta = "SELECT seguridad_programas.idprograma FROM seguridad_programas WHERE (seguridad_programas.idprograma = '" . $id . "') ORDER BY seguridad_programas.programa";					
				break;
		}
		$rcsdatos = new Recordset();
		$rcsdatos->sql = $consulta;
		$rcsdatos->abrir();
		if ($rcsdatos->total_registros > 0) 
		{
			for($i = 1; $i <= $rcsdatos->total_registros; $i++)
			{
				$rcsdatos->siguiente();
				for ($j = 0; $j <= count($privilegios) - 2; $j++)
				{
					$rcsprivilegios = new Recordset();
					$consulta = "INSERT INTO seguridad_usuarios_programas_privilegios (idusuario,idprograma,idprivilegio) VALUES ('" . $idusuario_privilegio . "','" . $rcsdatos->fila["idprograma"] . "','" . convertirnumeros($privilegios[$j]) . "')";
					$rcsprivilegios->sql = $consulta;
					$rcsprivilegios->abrir();
					registrobitacora("seguridad_usuarios_programas_privilegios","","Se agrego el privilegio: " . traercampos("","seguridad_privilegios","privilegio","idprivilegio",convertirnumeros($privilegios[$j])) . ", para el usuario: " . traercampos("","seguridad_usuarios","usuario","idusuario",$idusuario_privilegio),traercampos("","seguridad_usuarios","idusuario","idtemp",$_SESSION["idtemp"]),"privilegios_usuarios_form.php");
				}
			}
		}
		$rcsdatos->cerrar();
	}

	//funci�n que obtiene el ip del cliente
	function obtenerip()
	{
		if (getenv("HTTP_X_FORWARDED_FOR")) 
		{
			$ip = getenv("HTTP_X_FORWARDED_FOR");
			$client = gethostbyaddr($_SERVER['HTTP_X_FORWARDED_FOR']);
		} 
		else
		{
			$ip = getenv("REMOTE_ADDR");
			$client = gethostbyaddr($_SERVER['REMOTE_ADDR']);
		}
		$str = preg_split("/\./", $client);
		$i = count($str);
		$x = $i - 1;
		$n = $i - 2;
		$isp = $str[$n] . "." . $str[$x];
		return $ip;
	}
	
	//funcion que permite subir archivos de tipo imagen al servidor
	function subirarchivo($archivo,$directorio,$tamanomaximo,$ancho,$alto)
	{
		//se recorre el objeto imagen de tipo array
		for ($i = 0; $i <= count($archivo["name"]); $i++)
		{
			//verifica que el tipo de archivo sea una imagen de formato "jpg" o "gif"
			if (tipoarchivo($archivo["type"][$i]) == true)
			{
				//verifica que el tamano del archivo a subir no exeda el maximo establecido
				if (floatval($archivo["size"][$i]) <= floatval($tamanomaximo))
				{
					//verifica las dimensiones de la imagen cargada
					$dimensionimagen = getimagesize($archivo["tmp_name"][$i]);
					if ($dimensionimagen[0] <= $ancho && $dimensionimagen[1] <= $alto)
					{
						//verifica que se halla subido el archivo del cliente al servidor
						if (is_uploaded_file($archivo["tmp_name"][$i]))
						{
							move_uploaded_file($archivo["tmp_name"][$i], $directorio . $archivo["name"][$i]);
							return "cargado";
						}
						else
						{
							return "&iexcl;El archivo no pudo ser cargada correctamente!";
						}
					}
					else
					{
						return "&iexcl;Las dimensiones del archivo deben ser de:" . $ancho . "px x " . $alto . "px!";
					}
				}
				else
				{
					return "&iexcl;El tamaño del archivo debe ser de " . tamanoarchivo($tamanomaximo) . "!";
				}
			}
			else
			{
				return "&iexcl;Debe ingresar un archivo de tipo imágen!";
			}
		}
	}
	
	//funcion que permite verificar un archivo y eliminarlo
	function eliminararchivo($archivo)
	{
		if (file_exists($archivo) == true)
		{
			if (unlink($archivo) == true)
			{
				return "&iexcl;El Archivo fue Eliminado Exitosamente!";
			}
			else
			{
				return "&iexcl;No se Puede Eliminar el Archivo, Contacte a su Administrador!";
			}
		}
		elseif (!file_exists($archivo))
		{
			return "&iexcl;No se Puede Eliminar el Archivo por no Existir!";
		}
	}
	
	//funci�n que determina el tama�o de un archivo
	function tamanoarchivo($tamano)
	{
		if(($tamano >= 1024 && $tamano <= 1048575) || ($tamano <= -1024 && $tamano > -1048575))
		{
			$tamano = $tamano / 1024;
			$tamano = round($tamano, 1);
			$tamano = $tamano." ".KB;
		}
		elseif($tamano >= 1048576 || $tamano <= -1048576)
		{
			$tamano = ($tamano / 1024) / 1024;
			$tamano = round($tamano, 2);
			$tamano = $tamano." ".MB;
		}
		else
		{
			$tamano = $tamano." ".BYTES;
		}
		return $tamano;
	}
	
	//funci�n que determina el formato de un archivo
	function tipoarchivo($tipo)
	{	
		$tipo = split("/",$tipo);
		if ((strpos($tipo[count($tipo) - 1], "gif") !== false) || (strpos($tipo[count($tipo) - 1], "jpeg") !== false) || (trim($tipo[count($tipo) - 1], "png") !== false))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//Funcion que formatea una fecha para imprimirla en pantalla
	function imprimirfechahora($fecha,$signo="-")
	{
		$fecha = explode($signo,strval($fecha));
		return $fecha[2] . "/" . $fecha[1] . "/" . $fecha[0];
	}
	
	//Funcion que formatea una fecha para su uso en base de datos
	function bdfechahora($fecha,$signo="/")
	{
		$fecha = explode($signo,strval($fecha));
		return $fecha[2] . "-" . $fecha[1] . "-" . $fecha[0];
	}
	
	//Funcion que genera archivos de texto indexados
	function generararchivo($tipo,$nombre)
	{
		header( "Content-Type: application/octet-stream");
		header( "Content-Disposition: attachment; filename=" . $nombre . "." . $tipo);
	}
?>