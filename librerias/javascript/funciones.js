//Se crea funciones Como Trim, Ltrim y Rtrim

function jDatePicker(id, RutaIcons,dia,mes,year){
	var dt = new Date();
	$(id)
		.datepicker
		({
			dateFormat: 'dd/mm/yy', 
			defaultDate: new Date(year, mes - 1, dia), 
			maxDate: new Date(year, mes - 1, dia), 
			changeMonth: true, changeYear: true, 
			showButtonPanel: true, 
			closeText: 'Cerrar', 
			currentText: 'Hoy', 
			prevText: 'Anterior', 
			nextText: 'Siguiente', 
			showAnim: 'fadeIn', 
			duration: 'slow',
			monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
			monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
			dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','S&aacute;bado'],
			dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','S&aacute;b'],
			dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
			showOn: 'button', 
				buttonImageOnly: true, 
			buttonImage: RutaIcons+'calendar.gif'
		})
		.change ( function() { if ($(id).val() != "") { jQuery.datepicker._hideDatepicker(); } } )
		.focus ( function() { jQuery.datepicker._showDatepicker(this); } )
		.keyup ( function() { $(id).val(formateafecha($(id).val())) } )
}

function jDialog(id,title,v_width,url){
	$(id)
		.dialog
		({
			autoOpen: false,
			buttons: { "Cerrar": function(){ $(id).dialog("close");} },
			closeOnEscape: true,
			dialogClass: "ui-state-hover",
			draggable: false,
			modal: true,
			position: ["center",100],
			resizable: false,
			width: v_width,
			title: title,
			open: function() { $(id).load(url); }
		});
}

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}

String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}

String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}

//Acepta solo n�meros
var nav4 = window.Event ? true : false;
function solonum(evt){	
	var key = nav4 ? evt.which : evt.keyCode;	
	return (key <= 13 || (key >= 48 && key <= 57));
}

//Cuadrar objetos de un formulario
function cuadrarcampos(form){
	var ancho=0;
	for (i=0;form.elements.length-1;i++){
		if(form.elements[i].type="text"){
			if(form.elements[i].width>ancho){
				ancho=form.elements[i].width;
			}
		}else if(form.elements[i].type="select"){
			if(form.elements[i].style.width>ancho){
				ancho=form.elements[i].style.width;
			}
		}
	}
	alert(ancho);
}

//Dar formato a fechas uso this.value=formateafecha(this.value) en el evento keyup
function IsNumeric(valor){ 
	var log=valor.length; var sw="S"; 
	for (x=0; x<log; x++) 
	{ v1=valor.substr(x,1); 
	v2 = parseInt(v1); 
	//Compruebo si es un valor num�rico 
	if (isNaN(v2)) { sw= "N";} 
	} 
	if (sw=="S") {return true;} else {return false; } 
} 

var primerslap=false; 
var segundoslap=false; 

function formateafecha(fecha) 
{ 
	var long = fecha.length; 
	var dia; 
	var mes; 
	var ano; 

	if ((long>=2) && (primerslap==false)) { dia=fecha.substr(0,2); 
	if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true; } 
	else { fecha=""; primerslap=false;} 
	} 
	else 
	{ dia=fecha.substr(0,1); 
	if (IsNumeric(dia)==false) 
	{fecha="";} 
	if ((long<=2) && (primerslap=true)) {fecha=fecha.substr(0,1); primerslap=false; } 
	} 
	if ((long>=5) && (segundoslap==false)) 
	{ mes=fecha.substr(3,2); 
	if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; } 
	else { fecha=fecha.substr(0,3);; segundoslap=false;} 
	} 
	else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } } 
	if (long>=7) 
	{ ano=fecha.substr(6,4); 
	if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); } 
	else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } } 
	} 

	if (long>=10) 
	{ 
	fecha=fecha.substr(0,10); 
	dia=fecha.substr(0,2); 
	mes=fecha.substr(3,2); 
	ano=fecha.substr(6,4); 
	// A�o no viciesto y es febrero y el dia es mayor a 28 
	if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; } 
	} 
	return (fecha); 
} 

function moneda(num){
	if (parseFloat(num) > 0)
	{
		num = num.toString().replace(/\$|\,/g,'');
		if(isNaN(num))
		num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
		if(cents<10)
		cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		num = num.substring(0,num.length-(4*i+3))+'.'+
		num.substring(num.length-(4*i+3));
		return (((sign)?'':'-') + 'Bs. ' + num + ',' + cents);
	} else {
		return "";
	}
}

function montos(num){
	if (parseFloat(num) > 0)
	{
		num = num.toString().replace(/\$|\,/g,'');
		if(isNaN(num))
		num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
		if(cents<10)
		cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		num = num.substring(0,num.length-(4*i+3))+'.'+
		num.substring(num.length-(4*i+3));
		return (((sign)?'':'-') + num + ',' + cents);
	} else {
		return "0";
	}
}

//Quita el formato del valor
function sinformato(numero)
{
	numero = numero.replace(/Bs. |\./g,'');
	numero = numero.replace(/\,/g,'.');
	return numero;
}

/**************************************************************
M�scara de entrada para las Horas
****************************************************************/
var patron = new Array(2,2)
function mascara(d,sep,pat,nums){
if(d.valant != d.value){
	val = d.value
	largo = val.length
	val = val.split(sep)
	val2 = ''
	for(r=0;r<val.length;r++){
		val2 += val[r]	
	}
	if(nums){
		for(z=0;z<val2.length;z++){
			if(isNaN(val2.charAt(z))){
				letra = new RegExp(val2.charAt(z),"g")
				val2 = val2.replace(letra,"")
			}
		}
	}
	val = ''
	val3 = new Array()
	for(s=0; s<pat.length; s++){
		val3[s] = val2.substring(0,pat[s])
		val2 = val2.substr(pat[s])
	}
	for(q=0;q<val3.length; q++){
		if(q ==0){
			val = val3[q]
		}
		else{
			if(val3[q] != ""){
				val += sep + val3[q]
				}
		}
	}
	d.value = val
	d.valant = val
	}
}

//Permite validar que la fecha no sea mayor a la actual
/*function validarfechaactual(objeto)
{
	if (objeto.value.length == 10)
	{
		var fecha = new Date(objeto.value.substr(6,4), parseInt(objeto.value.substr(3,2)) - 1, objeto.value.substr(0,2));
		var fechaactual = new Date();
		if (fecha > fechaactual)
		{
			objeto.value = "";
			return "�Indique una fecha valida!";
		} else {
			return "";
		}
	} else {
		return "";
	}
}*/

//Permite validar que una fecha no sea mayor a otra
function comparar_fecha(fecha1,fecha2)
{
	// Si los dias y los meses llegan con un valor menor que 10
	// Se concatena un 0 a cada valor dentro del string
	if (fecha1.substring(1,2)=="/") 
	{
		fecha1="0"+fecha1
	}
	if (fecha1.substring(4,5)=="/")
	{
		fecha1=fecha1.substring(0,3)+"0"+fecha1.substring(3,9)
	}
	
	if (fecha2.substring(1,2)=="/") 
	{
		fecha2="0"+fecha2
	}
	if (fecha2.substring(4,5)=="/")
	{
		fecha2=fecha2.substring(0,3)+"0"+fecha2.substring(3,9)
	}
	
	dia1=fecha1.substring(0,2);
	mes1=fecha1.substring(3,5);
	anyo1=fecha1.substring(6,10);
	dia2=fecha2.substring(0,2);
	mes2=fecha2.substring(3,5);
	anyo2=fecha2.substring(6,10);
	
	if (dia1 == "08") // parseInt("08") == 10 base octogonal
		dia1 = "8";
	if (dia1 == '09') // parseInt("09") == 11 base octogonal
		dia1 = "9";
	if (mes1 == "08") // parseInt("08") == 10 base octogonal
		mes1 = "8";
	if (mes1 == "09") // parseInt("09") == 11 base octogonal
		mes1 = "9";
	if (dia2 == "08") // parseInt("08") == 10 base octogonal
		dia2 = "8";
	if (dia2 == '09') // parseInt("09") == 11 base octogonal
		dia2 = "9";
	if (mes2 == "08") // parseInt("08") == 10 base octogonal
		mes2 = "8";
	if (mes2 == "09") // parseInt("09") == 11 base octogonal
		mes2 = "9";
	
	dia1=parseInt(dia1);
	dia2=parseInt(dia2);
	mes1=parseInt(mes1);
	mes2=parseInt(mes2);
	anyo1=parseInt(anyo1);
	anyo2=parseInt(anyo2);
	
	if (anyo1>anyo2)
	{
		return false;
	}
	if ((anyo1==anyo2) && (mes1>mes2))
	{
		return false;
	}
	if ((anyo1==anyo2) && (mes1==mes2) && (dia1>dia2))
	{
		return false;
	}
	return true;
}

//Funci�n para dar formato tipo Capital al Texto
function formatotexto(texto)
{
	var textos = new Array("de","del","la","el", "en", "y", "demas", "con", "los", "al", "a");
	var textosmayus = new Array("c.c","c.c.","c/c","i", "ii","iii","iv","v","vi","vii","viii","ix","x","c.a","c.a.","s.a","s.a.","s.r.l","s.r.l.");
	var articulo;
	var count;
	var newtext = texto.value.toLowerCase();
	var arraytext = newtext.split(" ");
	var auxtext;
	
	for(i = 0; i <= arraytext.length - 1; i++)
	{
		articulo = false;
		count = 0;
		while(articulo == false && count <= textos.length - 1)
		{
			if(arraytext[i] == textos[count] && i > 0) articulo = true;
			count++;
		} 
		if(articulo == false)
		{
			articulo = false;
			count = 0;
			while(articulo == false && count <= textosmayus.length - 1)
			{
				if(arraytext[i] == textosmayus[count])
				{
					articulo = true;
					arraytext[i] = arraytext[i].toUpperCase();
				}
				count++;
			} 
			if(articulo == false)
			{
				if(arraytext[i].length > 1)
				{
					auxtext = arraytext[i].substring(0,1);
					arraytext[i] = auxtext.toUpperCase() + arraytext[i].substring(1,arraytext[i].length);
				} else {
					auxtext = arraytext[i].toUpperCase();
					arraytext[i] = auxtext;
				}
			}
		}
	}
	texto.value = arraytext.join(" ");
}


//Funcion para validar el ingreso de datos
var letras = ' ABCÇDEFGHIJKLMNÑOPQRSTUVWXYZabcçdefghijklmnñopqrstuvwxyzàáÀÁéèÈÉíìÍÌïÏóòÓÒúùÚÙüÜ' 
var numeros = '1234567890' 
var signos = ',.:;@-_' 
var signosmatematicos = '+-=()*/{}' 
var personal = '<>#$%&?�'
var especiales = '\'\"';

function validar(evnt,tipo) { 
	var temporal; 
	temporal = document.all?parseInt(evnt.keyCode): parseInt(evnt.which);
	if (temporal == 13 || temporal == 8 || temporal == 0 || temporal == 9) return true;
	return (tipo.indexOf(String.fromCharCode(temporal)) != -1);
}

function rechazar(evnt,tipo) { 
	var temporal; 
	temporal = document.all?parseInt(evnt.keyCode): parseInt(evnt.which);
	if (temporal == 13 || temporal == 8 || temporal == 0 || temporal == 9) return true;
	return (tipo.indexOf(String.fromCharCode(temporal)) == -1);
}

function correo(objeto)
{
	if(objeto.value.indexOf("@") == -1 || objeto.value.indexOf(".") == -1)
	{
		objeto.value = "";
		alert(acentos("&iexcl;Debe ingresar un correo valido!"));
		objeto.focus();
		return false;
	}
}

function montoletras(valor)
{
	var numeros = valor.toString();
	//Se elimina el simbolo de la moneda
	numeros = numeros.replace("Bs.","");
	numeros = numeros.replace("Bs.F.","");
	numeros = numeros.trim();
	if(numeros.length == 0) return "";
	var enteros;
	var decimales;
	var vector = new Array();
	var letras = "";
	//Se carga los valores en letras de los n�meros
	vector[1] = "un";
	vector[2] = "dos";
	vector[3] = "tres";
	vector[4] = "cuatro";
	vector[5] = "cinco";
	vector[6] = "seis";
	vector[7] = "siete";
	vector[8] = "ocho";
	vector[9] = "nueve";
	vector[10] = "diez";
	vector[11] = "once";
	vector[12] = "doce";
	vector[13] = "trece";
	vector[14] = "catorce";
	vector[15] = "quince";
	vector[16] = "dieciseis";
	vector[17] = "diecisiete";
	vector[18] = "dieciocho";
	vector[19] = "diecinueve";
	vector[20] = "veinte";
	vector[21] = "venti";
	vector[30] = "treinta";
	vector[31] = "trenti";
	vector[40] = "cuarenta";
	vector[41] = "cuarenti";
	vector[50] = "cincuenta";
	vector[51] = "cincuenti";
	vector[60] = "sesenta";
	vector[61] = "sesenti";
	vector[70] = "setenta";
	vector[71] = "setenti";
	vector[80] = "ochenta";
	vector[81] = "ochenti";
	vector[90] = "noventa";
	vector[91] = "noventi";
	vector[100] = "cien";
	vector[200] = "doscientos";
	vector[300] = "trescientos";
	vector[400] = "cuatrocientos";
	vector[500] = "quinientos";
	vector[600] = "seiscientos";
	vector[700] = "setecientos";
	vector[800] = "ochocientos";
	vector[900] = "novecientos";
	
	
	//se eliminan los puntos que existan en el monto
	
	if(numeros.indexOf(".") > numeros.indexOf(","))
	{
		while(numeros.indexOf(",") > -1)
		{
			numeros = numeros.replace(",","");
		}
		numeros = numeros.replace(".",",");
	} else if(numeros.indexOf(",") > numeros.indexOf("."))
	{
		while(numeros.indexOf(".") > -1)
		{
			numeros = numeros.replace(".","");
		}
	} else if(numeros.indexOf(",") == numeros.indexOf(".")) 
	{
		numeros += ",00";
	}
	
	//Se divide los enteros de los decimales
	if(numeros.indexOf(",") > -1)
	{
		enteros = numeros.substr(0,numeros.indexOf(","));
		//Se divide en grupos de tres
		var ngrupos = Math.ceil(enteros.length / 3);
		var grupos = new Array();
		for(i = ngrupos; i >= 1; i--)
		{
			if(enteros.length >= 3)
			{
				n = 3;
				p = 3;
			} else {
				n = enteros.length;
				p = enteros.length;
			}
			grupos[i] = enteros.substr(enteros.length - p, n);
			enteros = enteros.substr(0,enteros.length - p);
		}
		//Se optiene el monto en letras
		var count = 0;
		var aux;
		var unidad;
		for(i = ngrupos; i > 0; i--)
		{
			count++;
			aux = grupos[count];
			
			switch(i)
			{
				case 1:
					unidad = "";
					break;
				case 2:
					unidad = "mil";
					break;
				case 3:
					if(grupos[count] != "1") { unidad = "millones"; } else { unidad = "mill&oacute;n"; }
					break;
				case 4:
					if(grupos[count] != "1") { unidad = "mil millones"; } else { unidad = "mil mill&oacute;n"; }
					break;
			}
			
			var ncount;
			for(j = aux.length; j >= 1; j--)
			{
				ncount++;
				if(aux.substr(j-1,1) != "0") 
				{
					pos = j-1;
					cant = ncount;
				}
			}
			
			n = parseInt(aux.substr(pos),cant);
			if(n <= 20 && n > 0)
			{
				letras = letras + vector[n]+ " " + unidad ;
			} else if(n > 20 && n < 100) {
				if(n % 10 == 0)
				{
					letras = letras + vector[n] + " " + unidad;
				} else {
					letras = letras + vector[n - (n % 10) + 1] + vector[n % 10] + " " + unidad;
				}
			} else if(n >= 100) {
				if(n % 100 == 0)
				{
					letras = letras + vector[n] + " " + unidad;
				} else {
					if(n > 100 && n < 200)
					{
						letras = letras + "ciento" + " ";
					} else {
						letras = letras + vector[parseInt(aux.substr(0,1)+"00")] + " ";
					}
					nn = parseInt(aux.substr(1,2));
					if(nn <= 20)
					{
						letras = letras + vector[nn]+ " " + unidad
					} else {
						if(nn % 10 == 0)
						{
							letras = letras + vector[nn] + " " + unidad;
						} else {
							letras = letras + vector[nn - (nn % 10) + 1] + vector[nn % 10] + " " + unidad;
						}
					}
				}
			}
			letras = letras + " ";
		}
		//Se agregan los decimales
		decimales = numeros.substr(numeros.indexOf(",")+1,2);
		letras = acentos(letras) + "con "+ acentos(decimales) + "/100";
		return letras;
	}
}

function acentos(x) {
	/*version 040623
	 Spanish - Español
	 Portuguese - Portugues - Portugues
	 Italian - Italiano
	 French - Frances - Francais
	 Also accepts and converts single and double quotation marks, square and angle brackets
	 and miscelaneous symbols.
	 Also accepts and converts html entities for all the above.
	 if (navigator.appVersion.toLowerCase().indexOf("windows") != -1) {return x}*/
	x = x.replace(/�/g,"\xA1");	x = x.replace(/&iexcl;/g,"\xA1")
	x = x.replace(/�/g,"\xBF");	x = x.replace(/&iquest;/g,"\xBF")
	x = x.replace(/�/g,"\xC0");	x = x.replace(/&Agrave;/g,"\xC0")
	x = x.replace(/�/g,"\xE0");	x = x.replace(/&agrave;/g,"\xE0")
	x = x.replace(/�/g,"\xC1");	x = x.replace(/&Aacute;/g,"\xC1")
	x = x.replace(/�/g,"\xE1");	x = x.replace(/&aacute;/g,"\xE1")
	x = x.replace(/�/g,"\xC2");	x = x.replace(/&Acirc;/g,"\xC2")
	x = x.replace(/�/g,"\xE2");	x = x.replace(/&acirc;/g,"\xE2")
	x = x.replace(/�/g,"\xC3");	x = x.replace(/&Atilde;/g,"\xC3")
	x = x.replace(/�/g,"\xE3");	x = x.replace(/&atilde;/g,"\xE3")
	x = x.replace(/�/g,"\xC4");	x = x.replace(/&Auml;/g,"\xC4")
	x = x.replace(/�/g,"\xE4");	x = x.replace(/&auml;/g,"\xE4")
	x = x.replace(/�/g,"\xC5");	x = x.replace(/&Aring;/g,"\xC5")
	x = x.replace(/�/g,"\xE5");	x = x.replace(/&aring;/g,"\xE5")
	x = x.replace(/�/g,"\xC6");	x = x.replace(/&AElig;/g,"\xC6")
	x = x.replace(/�/g,"\xE6");	x = x.replace(/&aelig;/g,"\xE6")
	x = x.replace(/�/g,"\xC7");	x = x.replace(/&Ccedil;/g,"\xC7")
	x = x.replace(/�/g,"\xE7");	x = x.replace(/&ccedil;/g,"\xE7")
	x = x.replace(/�/g,"\xC8");	x = x.replace(/&Egrave;/g,"\xC8")
	x = x.replace(/�/g,"\xE8");	x = x.replace(/&egrave;/g,"\xE8")
	x = x.replace(/�/g,"\xC9");	x = x.replace(/&Eacute;/g,"\xC9")
	x = x.replace(/�/g,"\xE9");	x = x.replace(/&eacute;/g,"\xE9")
	x = x.replace(/�/g,"\xCA");	x = x.replace(/&Ecirc;/g,"\xCA")
	x = x.replace(/�/g,"\xEA");	x = x.replace(/&ecirc;/g,"\xEA")
	x = x.replace(/�/g,"\xCB");	x = x.replace(/&Euml;/g,"\xCB")
	x = x.replace(/�/g,"\xEB");	x = x.replace(/&euml;/g,"\xEB")
	x = x.replace(/�/g,"\xCC");	x = x.replace(/&Igrave;/g,"\xCC")
	x = x.replace(/�/g,"\xEC");	x = x.replace(/&igrave;/g,"\xEC")
	x = x.replace(/�/g,"\xCD");	x = x.replace(/&Iacute;/g,"\xCD")
	x = x.replace(/�/g,"\xED");	x = x.replace(/&iacute;/g,"\xED")
	x = x.replace(/�/g,"\xCE");	x = x.replace(/&Icirc;/g,"\xCE")
	x = x.replace(/�/g,"\xEE");	x = x.replace(/&icirc;/g,"\xEE")
	x = x.replace(/�/g,"\xCF");	x = x.replace(/&Iuml;/g,"\xCF")
	x = x.replace(/�/g,"\xEF");	x = x.replace(/&iuml;/g,"\xEF")
	x = x.replace(/�/g,"\xD1");	x = x.replace(/&Ntilde;/g,"\xD1")
	x = x.replace(/�/g,"\xF1");	x = x.replace(/&ntilde;/g,"\xF1")
	x = x.replace(/�/g,"\xD2");	x = x.replace(/&Ograve;/g,"\xD2")
	x = x.replace(/�/g,"\xF2");	x = x.replace(/&ograve;/g,"\xF2")
	x = x.replace(/�/g,"\xD3");	x = x.replace(/&Oacute;/g,"\xD3")
	x = x.replace(/�/,"\xF3");	x = x.replace(/&oacute;/g,"\xF3")
	x = x.replace(/�/g,"\xD4");	x = x.replace(/&Ocirc;/g,"\xD4")
	x = x.replace(/�/g,"\xF4");	x = x.replace(/&ocirc;/g,"\xF4")
	x = x.replace(/�/g,"\xD5");	x = x.replace(/&Otilde;/g,"\xD5")
	x = x.replace(/�/g,"\xF5");	x = x.replace(/&otilde;/g,"\xF5")
	x = x.replace(/�/g,"\xD6");	x = x.replace(/&Ouml;/g,"\xD6")
	x = x.replace(/�/g,"\xF6");	x = x.replace(/&ouml;/g,"\xF6")
	x = x.replace(/�/g,"\xD8");	x = x.replace(/&Oslash;/g,"\xD8")
	x = x.replace(/�/g,"\xF8");	x = x.replace(/&oslash;/g,"\xF8")
	x = x.replace(/�/g,"\xD9");	x = x.replace(/&Ugrave;/g,"\xD9")
	x = x.replace(/�/g,"\xF9");	x = x.replace(/&ugrave;/g,"\xF9")
	x = x.replace(/�/g,"\xDA");	x = x.replace(/&Uacute;/g,"\xDA")
	x = x.replace(/�/g,"\xFA");	x = x.replace(/&uacute;/g,"\xFA")
	x = x.replace(/�/g,"\xDB");	x = x.replace(/&Ucirc;/g,"\xDB")
	x = x.replace(/�/g,"\xFB");	x = x.replace(/&ucirc;/g,"\xFB")
	x = x.replace(/�/g,"\xDC");	x = x.replace(/&Uuml;/g,"\xDC")
	x = x.replace(/�/g,"\xFC");	x = x.replace(/&uuml;/g,"\xFC")
	
	x = x.replace(/\"/g,"\x22")
	x = x.replace(/\'/g,"\x27")
	x = x.replace(/\</g,"\x3C")
	x = x.replace(/\>/g,"\x3E")
	x = x.replace(/\[/g,"\x5B")
	x = x.replace(/\]/g,"\x5D")

	x = x.replace(/�/g,"\xA2");	x = x.replace(/&cent;/g,"\xA2") 
	x = x.replace(/�/g,"\xA3");	x = x.replace(/&pound;/g,"\xA3")
	x = x.replace(/�/g,"\u20AC");	x = x.replace(/&euro;/g,"\u20AC") 
	x = x.replace(/�/g,"\xA9");	x = x.replace(/&copy;/g,"\xA9") 
	x = x.replace(/�/g,"\xAE");	x = x.replace(/&reg;/g,"\xAE") 
	x = x.replace(/�/g,"\xAA");	x = x.replace(/&ordf;/g,"\xAA") 
	x = x.replace(/�/g,"\xBA");	x = x.replace(/&ordm;/g,"\xBA") 
	x = x.replace(/�/g,"\xB0");	x = x.replace(/&deg;/g,"\xB0") 
	x = x.replace(/�/g,"\xB1");	x = x.replace(/&plusmn;/g,"\xB1")
	x = x.replace(/�/g,"\xD7");	x = x.replace(/&times;/g,"\xD7") 
	
		
	return x
}

function verificararchivo(imagen)
{
	cadenaimagen = imagen.split("\\");
	tipoimagen = cadenaimagen[cadenaimagen.length - 1].split(".");
	if (tipoimagen[tipoimagen.length - 1] == "jpg" || tipoimagen[tipoimagen.length - 1] == "gif" || tipoimagen[tipoimagen.length - 1] == "png")
	{
		return true;
	}
	else 
	{
		return false;
	}
}

function tiene_numeros(texto)
{
   	for(i=0; i<texto.length; i++)
   	{
      	if (numeros.indexOf(texto.charAt(i),0)!=-1)
	  	{
         	return 1;
      	}
   	}
   	return 0;
} 

function tiene_letras(texto)
{
	texto = texto.toLowerCase();
   	for(i=0; i<texto.length; i++)
   	{
      	if (letras.indexOf(texto.charAt(i),0)!=-1)
	  	{
         	return 1;
      	}
   	}
   	return 0;
} 

function tiene_caracteres(texto)
{
   	for(i=0; i < texto.length; i++)
   	{
      	if (signos.indexOf(texto.charAt(i),0) != -1 || signosmatematicos.indexOf(texto.charAt(i),0) != -1 || personal.indexOf(texto.charAt(i),0) != -1)
	  	{
        	return 1;
      	}
   	}
   	return 0;
}

function seguridad_clave(clave)
{
	var seguridad = 0;
	if (clave.length != 0)
	{
		if (tiene_numeros(clave) || tiene_letras(clave) || tiene_caracteres(clave))
		{
			seguridad += 30;
		}
		if (tiene_numeros(clave) && tiene_letras(clave) && clave.length >= 6)
		{
			seguridad += 30;
		}
		if (tiene_numeros(clave) && tiene_letras(clave) && tiene_caracteres(clave) && clave.length >= 11)
		{
			seguridad += 40;
		}
		return seguridad;
	}
}	

function muestra_seguridad_clave(clave)
{
	seguridad = seguridad_clave(clave);
	document.getElementById('nBajo').style.backgroundColor='#eaebeb';
	document.getElementById('nMedio').style.backgroundColor='#eaebeb';
	document.getElementById('nAlto').style.backgroundColor='#eaebeb';
	if (parseInt(seguridad) > 0 && parseInt(seguridad) <= 30)
	{
		document.getElementById('nBajo').style.backgroundColor='#f6a6a6';
		document.getElementById('nMedio').style.backgroundColor='#eaebeb';
		document.getElementById('nAlto').style.backgroundColor='#eaebeb';
	}
	else if (parseInt(seguridad) > 30 && parseInt(seguridad) <= 60)
	{
		document.getElementById('nBajo').style.backgroundColor='#f82121';
		document.getElementById('nMedio').style.backgroundColor='#f82121';
		document.getElementById('nAlto').style.backgroundColor='#eaebeb';
	}
	else if (parseInt(seguridad) > 60 && parseInt(seguridad) <= 100)
	{
		document.getElementById('nBajo').style.backgroundColor='#cc0505';
		document.getElementById('nMedio').style.backgroundColor='#cc0505';
		document.getElementById('nAlto').style.backgroundColor='#cc0505';
	}
}
/*function quitaborde(){
	jQuery(".tabla_secciones").css({""});
	
	
}*/
jQuery(document).ready(function(){
	// este bloque de codigo es considerado hardcodeo... por favor si implementa una mejor solucion enviarlo a christian130@gmail.com
	if (jQuery(".tabla_secciones").length==3){
		jQuery(".tabla_secciones:eq('0')").css({'border-right-style':'none'});
		jQuery(".tabla_secciones:eq('1')").css({'border-right-style':'none'});
		
	}
	if (jQuery(".tabla_secciones").length==2){
		jQuery(".tabla_secciones:eq('0')").css({'border-right-style':'none'});
		
	}
	
	var nuevo111=jQuery(".boton_menu_submodulos").find("a:contains('Auditoria')").length
	var nuevo3331=jQuery(".borde_menu_secciones:contains('Asistencia')").length;
	if (!eval(jQuery(".boton_menu_submodulos").find("a:contains('Auditoria')").length==0)){
		jQuery("a.texto_programas:eq('3')").after("<br />");
		//alert("asdad");
		jQuery(".borde_superior_programas222:eq('0')").css({'padding-top':'20px'});
		//$("[name='p1']:last-child").append("<br />");
		
	jQuery(".hardcodeo > .tabla_secciones:eq(0)").css({'border-bottom-style':'none'});
	jQuery("td.hardcodeo:eq(0)").css({'border-bottom-style':'solid','border-bottom-width':'thin','border-bottom-color':'#4b84b3'})
	jQuery("td.hardcodeo:eq(0)").find(".tabla_secciones").css({"border-left-style":"none"});
	jQuery(".hardcodeo:eq(0)").find(".borde_superior_programas").css({"padding-top":"40px"});

	}else{
		if (!(nuevo3331==0)){jQuery(".hardcodeo").siblings("td").css({'display':'none'});

jQuery(".tablehardcoding002").attr("width","100%");

}
		

	}
	jQuery(".texto_modulos:contains('ACERCA DE')").prop("onclick","null");
jQuery(".texto_modulos:contains('ACERCA DE')").bind("click",function(){
jAlert("<p style='text-align:center;margin:auto;'><b>SISTEMA DE CONTROL DE ACCESO Y ASISTENCIA</b></p><br/><b>Version:&nbsp;</b>(RC) Release Candidate  beta 1.1 Mayo 2013<br/> <b>Para soporte:&nbsp;</b><a href='mailto:soporte@fbgvenezuela.com?Subject=SCAYA%20Soporte%20General'>soporte@fbgvenezuela.com</a><br/> <br/> <p style='text-align:center;margin:auto;'>.::FBG Tecnolog&iacute;a Integral::.</p>","ACERCA DE NOSOTROS");
jQuery("#popup_content.alert").css({'background-image':'url("../../../imagenes/seguridad/iconos/acercadenosotros.png")'});
});
})

