<?php
final class alcSecaTimes
{
	function __construct(){}
	
	function CalculaHorasTrabajo($Person, $FechaI, $FechaF, $cnxAtt, $cnxHorario){
		
		$arrHE = array(
				'id'=>$Person->id,
				'nombre'=>$Person->nombre,
				'cedula'=>$Person->cedula,
				'fechai'=>$FechaI,
				'fechaf'=>$FechaF,
				'ht'=>array()
			);
		if(strtotime($FechaF)< strtotime($FechaI))
			return $arrHE;
		
		$fi=$FechaI;
		$ff=$FechaF;
		$cf=$FechaI;
		while(strtotime($cf) <= strtotime($ff))
		{
			// mes - dia - año
			//date("w",mktime(0, 0, 0, $arrF[1], $arrF[2], $arrF[0]))
			$arrF = explode("-",$cf);
			$dow = date("w",mktime(0, 0, 0, $arrF[1], $arrF[2], $arrF[0]));
			if($dow!=0 && $dow!=6){
				$att = $cnxAtt;
				$attArr = $att->Find("att_persona_id=".$Person->id." AND fecha='".$cf."' order by hora");
				if(!empty($attArr)){
					$arrData = $this->CalculaHT($attArr, $cnxHorario);
					$arrHE['ht'][] = $arrData;
				} else {
					$arrHE['ht'][] = array('tiempo' => array('fecha' => $cf), 'hrj' => 420, 'htj' => 0);
				}
			}
			$newdate = strtotime('+1 day' , strtotime($cf));
			$cf = date ('Y-m-d' , $newdate);
		}
		return $arrHE;
	}
	
	private function CalculaHT($attLog, $Horario)
	{
		/**
		 * [tiempo] Marca de Tiempo
		 * [hrj] Si o NO tiene Horas Extras
		 * [htj] Tiempo de la Jornada Efectiva
		 * [hrt] Tiempo Real Trabajado
		 */
		$txtHXtra = array(
			'tiempo' => array(),
			'hrj' => 0,
			'htj' => 0,
			'hrt' => 0);
		
		$txtHXtra['tiempo'] = $this->MarcaTiempo($attLog, $Horario);
		
		if($Horario[0]->imorning)
		{
			$hMEnt = $Horario[0]->mor_in;
			$hMEntDel = $Horario[0]->mor_maxdelay;
			$hMEntMax = $this->SumMintoHora($hMEnt, $hMEntDel);
			
			$hMSal = $Horario[0]->mor_out;
			$hMSalPre = $Horario[0]->mor_minout;
			$hMSalMin =$this->RestMintoHora($hMSal, $hMSalPre);
			$txtHXtra['hrj'] = $this->diffHoras($hMEntMax, $hMSalMin);
			
		}
		
		if($Horario[0]->itarde)
		{
			$hTEnt = $Horario[0]->tard_in;
			$hTEntDel = $Horario[0]->tard_maxdelay;
			$hTEntMax = $this->SumMintoHora($hTEnt, $hTEntDel);
			
			$hTSal = $Horario[0]->tard_out;
			$hTSalPre = $Horario[0]->tard_minout;
			$hTSalMin =$this->RestMintoHora($hTSal, $hTSalPre);
			$txtHXtra['hrj'] = $txtHXtra['hrj'] + $this->diffHoras($hTEntMax, $hTSalMin);
		}
		
		if($Horario[0]->imorning && $Horario[0]->itarde){
			$hSalida = $hTSalPre;
			
			$val1 = 0;
			$val2 = 0;
//			if (!empty($txtHXtra['tiempo']['m'][0]['hora']) && !empty($txtHXtra['tiempo']['m'][1]['hora'])){
				
//			}
			
			
			$txtHXtra['hrt'] = intval($this->diffHoras($txtHXtra['tiempo']['m'][0]['hora'], $hMSalMin)) + intval($this->diffHoras($hTEntMax, $txtHXtra['tiempo']['t'][1]['hora']));


			$val1 = 0;
			$val2 = 0;
			if (!empty($txtHXtra['tiempo']['m'][0]['hora']) && !empty($txtHXtra['tiempo']['m'][1]['hora'])){
				$val1 = intval($this->diffHoras(
			    	strtotime($txtHXtra['tiempo']['m'][0]['hora']) >= strtotime($hMEnt) ? $txtHXtra['tiempo']['m'][0]['hora'] : $hMEnt
					,$txtHXtra['tiempo']['m'][1]['hora']));
			}
			
			if(!empty($txtHXtra['tiempo']['t'][0]['hora']) && !empty($txtHXtra['tiempo']['t'][1]['hora']))
			{
				$val2 = intval($this->diffHoras($txtHXtra['tiempo']['t'][0]['hora'], 
					strtotime($txtHXtra['tiempo']['t'][0]['hora']) >= strtotime($hTSalMin) ? $txtHXtra['tiempo']['t'][0]['hora'] : $hTSalMin));
			}

			$txtHXtra['htj'] = $val1 + $val2;
			
		} elseif($Horario[0]->imorning){
			$hSalida = $hMSalPre;
			$txtHXtra['hrt'] = $this->diffHoras($txtHXtra['tiempo']['m'][0]['hora'], $txtHXtra['tiempo']['m'][1]['hora']);
		} elseif($Horario[0]->itarde){
			$hSalida = $hTSalPre;
			$txtHXtra['hrt'] = $this->diffHoras($txtHXtra['tiempo']['t'][0]['hora'], $txtHXtra['tiempo']['t'][1]['hora']);
		}
		
		return $txtHXtra;
	}
	
	function CalculaHorasExtras($Person, $FechaI, $FechaF, $cnxAtt, $cnxHorario){
		
		$arrHE = array(
				'id'=>$Person->id,
				'nombre'=>$Person->nombre,
				'cedula'=>$Person->cedula,
				'fechai'=>$FechaI,
				'fechaf'=>$FechaF,
				'che'=>0,
				'he'=>array()
			);
		if(strtotime($FechaF)< strtotime($FechaI))
			return $arrHE;
		
		$fi=$FechaI;
		$ff=$FechaF;
		$cf=$FechaI;
		while(strtotime($cf) <= strtotime($ff))
		{

			$dt=explode("-",$cf);
			$gvDay = date("w",mktime(0, 0, 0, $dt[1], $dt[2], $dt[0]));
			$att = $cnxAtt;
			$attArr = $att->Find("att_persona_id=".$Person->id." AND fecha='".$cf."' order by hora");
			$newdate = strtotime('+1 day' , strtotime($cf));
			$cf = date('Y-m-d' , $newdate);
			if($gvDay>0 && $gvDay<6){
				$DataArr = $this->CalculaHE($attArr, $cnxHorario);
			}
			else{
				$DataArr = $this->CalcHE_Otro($attArr, $cnxHorario);
			}

			if($DataArr['ihe'])
			{
				$arrHE['he'][] = $DataArr;
				$arrHE['che']++;
			}
		}
//		print_r($arrHE['he']);die();
		return $arrHE;
	}
	
	private function CalcHE_Otro($attLog, $Horario)
	{
		/**
		 * [tiempo] Marca de Tiempo
		 * [ihe] Si o NO tiene Horas Extras
		 * [he] Horas Extras {[d] Manana, [n] tarde}
		 * [hrj] Tiempo de la Jornada Efectiva
		 * [hrt] Tiempo Real Trabajado
		 */
		$txtHXtra = array(
			'tiempo' => array(),
			'ihe' => false,
			'he' => array('d' => '0', 'n' => '0'),
			'hrj' => 0,
			'htj' => 0,
			'hrt' => 0);
		$txtHXtra['tiempo'] = $this->MarcaTiempo($attLog, $Horario);


		if(!empty($txtHXtra['tiempo']['fecha'])){
			$t1 = $txtHXtra['tiempo']['m'][0]['hora'];
			$t2 = $txtHXtra['tiempo']['m'][1]['hora'];
			$t3 = $txtHXtra['tiempo']['t'][0]['hora'];
			$t4 = $txtHXtra['tiempo']['t'][1]['hora'];
			$hora1="";
			$hora2="";
			if(!empty($t1)){
				$hora1 = $t1;
			}
			if(!empty($t2)){
				if(empty($hora1))
	                                $hora1 = $t2;
				elseif(empty($hora2))
					$hora2=$t2;
                        }
			if(!empty($t3)){
                                if(empty($hora1))
                                        $hora1 = $t3;
                                elseif(empty($hora2))
                                        $hora2=$t3;
                        }
			if(!empty($t4)){
                                if(empty($hora1))
                                        $hora1 = $t4;
                                elseif(empty($hora2))
                                        $hora2=$t4;
                        }
			if(!empty($hora1) && !empty($hora2)){
				$txtHXtra['ihe']=true;

				$hn = $this->diffHoras("19:00", $hora2);
				if($hn>0){
					$txtHXtra['he']['n']=$hn/60;
					$txtHXtra['he']['d']=$this->diffHoras($hora1,"19:00")/60;
				}else{
					$txtHXtra['he']['d']=$this->diffHoras($hora1,$hora2)/60;
				}
			}
		}
		return $txtHXtra;	
	}
	
	private function CalculaHE($attLog, $Horario)
	{
		/**
		 * [tiempo] Marca de Tiempo
		 * [ihe] Si o NO tiene Horas Extras
		 * [he] Horas Extras {[d] Manana, [n] tarde}
		 * [hrj] Tiempo de la Jornada Efectiva
		 * [hrt] Tiempo Real Trabajado
		 */
		$txtHXtra = array(
			'tiempo' => array(),
			'ihe' => false,
			'he' => array('d' => '0', 'n' => '0'),
			'hrj' => 0,
			'htj' => 0,
			'hrt' => 0);
		
		$txtHXtra['tiempo'] = $this->MarcaTiempo($attLog, $Horario);
		
		if($Horario[0]->imorning)
		{
			$hMEnt = $Horario[0]->mor_in;
			$hMEntDel = $Horario[0]->mor_maxdelay;
			$hMEntMax = $this->SumMintoHora($hMEnt, $hMEntDel);
			
			$hMSal = $Horario[0]->mor_out;
			$hMSalPre = $Horario[0]->mor_minout;
			$hMSalMin =$this->RestMintoHora($hMSal, $hMSalPre);
			$txtHXtra['hrj'] = $this->diffHoras($hMEntMax, $hMSalMin);
			
		}
		
		if($Horario[0]->itarde)
		{
			$hTEnt = $Horario[0]->tard_in;
			$hTEntDel = $Horario[0]->tard_maxdelay;
			$hTEntMax = $this->SumMintoHora($hTEnt, $hTEntDel);
			
			$hTSal = $Horario[0]->tard_out;
			$hTSalPre = $Horario[0]->tard_minout;
			$hTSalMin =$this->RestMintoHora($hTSal, $hTSalPre);
			$txtHXtra['hrj'] = $txtHXtra['hrj'] + $this->diffHoras($hTEntMax, $hTSalMin);
		}
		
		if($Horario[0]->imorning && $Horario[0]->itarde){
			$hSalida = $hTSalPre;
			
			$val1 = 0;
			$val2 = 0;
//			if (!empty($txtHXtra['tiempo']['m'][0]['hora']) && !empty($txtHXtra['tiempo']['m'][1]['hora'])){
				
//			}
			
			
			$txtHXtra['hrt'] = intval($this->diffHoras($txtHXtra['tiempo']['m'][0]['hora'], $hMSalMin)) + intval($this->diffHoras($hTEntMax, $txtHXtra['tiempo']['t'][1]['hora']));


			$val1 = 0;
			$val2 = 0;
			if (!empty($txtHXtra['tiempo']['m'][0]['hora']) && !empty($txtHXtra['tiempo']['m'][1]['hora'])){
				$val1 = intval($this->diffHoras(
			    	strtotime($txtHXtra['tiempo']['m'][0]['hora']) >= strtotime($hMEnt) ? $txtHXtra['tiempo']['m'][0]['hora'] : $hMEnt
					,$txtHXtra['tiempo']['m'][1]['hora']));
			}
			
			if(!empty($txtHXtra['tiempo']['t'][0]['hora']) && !empty($txtHXtra['tiempo']['t'][1]['hora']))
			{
				$val2 = intval($this->diffHoras($txtHXtra['tiempo']['t'][0]['hora'], 
					strtotime($txtHXtra['tiempo']['t'][0]['hora']) >= strtotime($hTSalMin) ? $txtHXtra['tiempo']['t'][0]['hora'] : $hTSalMin));
			}

			$txtHXtra['htj'] = $val1 + $val2;
			
		} elseif($Horario[0]->imorning){
			$hSalida = $hMSalPre;
			$txtHXtra['hrt'] = $this->diffHoras($txtHXtra['tiempo']['m'][0]['hora'], $txtHXtra['tiempo']['m'][1]['hora']);
		} elseif($Horario[0]->itarde){
			$hSalida = $hTSalPre;
			$txtHXtra['hrt'] = $this->diffHoras($txtHXtra['tiempo']['t'][0]['hora'], $txtHXtra['tiempo']['t'][1]['hora']);
		}
		
		if($Horario[0]->ihediurna){
			$hHXD = $Horario[0]->hediurna;
			$hHXDt = $this->HoratoMin($hHXD);
		}
		
		if($Horario[0]->ihenocturna){
			$hHXN = $Horario[0]->henocturna;
			$hHXDn = $this->HoratoMin($hHXN);
		}
		
		if($Horario[0]->ihediurna && $Horario[0]->ihenocturna){
			// Total max de Horas Diurnas
			$hHXTDn = intval($hHXDn) - intval($hHXDt);
		}
		
		if(intval($txtHXtra['hrt']) > intval($txtHXtra['hrj']))
			$txtHXtra['ihe'] = true;
			
		if($txtHXtra['ihe'])
		{
			$tXtra = $this->diffHoras($hTSalMin, $txtHXtra['tiempo']['t'][1]['hora']);
			/*if(intval($tXtra)< 30){
				$txtHXtra['ihe'] = false;
				$txtHXtra['he']['d'] = 0;
				$txtHXtra['he']['n'] = 0;
			}
			else{*/
				$txtHXtra['he']['d'] = $tXtra;
				$txtHXtra['he']['n'] = $hHXTDn;
				if(intval($tXtra) >= intval($hHXTDn)){
					$txtHXtra['he']['d'] = intval($hHXTDn)/60;
					$tXtra = intval($tXtra) - intval($hHXTDn);
					$txtHXtra['he']['n'] = intval($tXtra)/60;
				}else{
					$txtHXtra['he']['d'] = intval($tXtra)/60;
					$txtHXtra['he']['n']=0;
				}
			//}
		}
		
		return $txtHXtra;
	}
	
	/**
	 * Devuelve el tiempo de horarios, indicando si hay retraso o no.
	 * 
	 * @param [$attLog] Log de Asistencia de Usuario
	 * @param [Horario] Horario de persona en sistema
	 * 
	 * @return [array] Tiempos de Marcaje ordenados y ajustados Segun Horario.
	 * 
	 * example:
	 * 
	 * array(
	 *  fecha => 'dd/mm/yyyy',
	 *  m => array(
	 * 		0 => array(hora=>'valor', iontime=><1/0>, idReg=>0),
	 *  	1 => array(hora=>'valor', iontime=><1/0>, idReg=>0),
	 *  	...
	 *  	n => array(hora=>'valor', iontime=><1/0>, idReg=>0)
	 *    ),
	 *  t => array(
	 * 		0 => array(hora=>'valor', iontime=><1/0>, idReg=>0),
	 *  	1 => array(hora=>'valor', iontime=><1/0>, idReg=>0),
	 *  	...
	 *  	n => array(hora=>'valor', iontime=><1/0>, idReg=>0)
	 *    )
	 * )
	 */
	function MarcaTiempo($attLog, $Horario){
		$txtHora = array(
			'fecha' => '',
			'm' => array(
				0 => array(hora=>'', iontime=>1, idReg=>0),
				1 => array(hora=>'', iontime=>1, idReg=>0)
				), 
			't' => array(
				0 => array(hora=>'', iontime=>1, idReg=>0),
				1 => array(hora=>'', iontime=>1, idReg=>0)
				) ,
			'horario' => array(
					'm' => array('i'=>false,'he'=>'','hs'=>''),
					't' => array('i'=>false,'he'=>'','hs'=>'')
				)
		);
		$txtRetardo = array( );
		$txtID = array( );
		
		$tMaxVueltas = $Horario[0]->imorning ? 2 : 0;
		$tMaxVueltas = $Horario[0]->itarde ? $tMaxVueltas+2 : $tMaxVueltas+0;
		$tVueltas = sizeof($attLog) > $tMaxVueltas ? $tMaxVueltas : sizeof($attLog);
		
		if($Horario[0]->imorning)
		{
			$hMEnt = $Horario[0]->mor_in;
			$hMEntDel = $Horario[0]->mor_maxdelay;
			$hMEntMax = $this->SumMintoHora($hMEnt, $hMEntDel);
			
			$hMSal = $Horario[0]->mor_out;
			$hMSalPre = $Horario[0]->mor_minout;
			$hMSalMin =$this->RestMintoHora($hMSal, $hMSalPre);
			
			$txtHora['horario']['m']['i']=true;
			$txtHora['horario']['m']['he']=$hMEntMax;
			$txtHora['horario']['m']['hs']=$hMSalMin;
		}
		
		if($Horario[0]->itarde)
		{
			$hTEnt = $Horario[0]->tard_in;
			$hTEntDel = $Horario[0]->tard_maxdelay;
			$hTEntMax = $this->SumMintoHora($hTEnt, $hTEntDel);
			
			$hTSal = $Horario[0]->tard_out;
			$hTSalPre = $Horario[0]->tard_minout;
			$hTSalMin =$this->RestMintoHora($hTSal, $hTSalPre);
			
			$txtHora['horario']['t']['i']=true;
			$txtHora['horario']['t']['he']=$hTEntMax;
			$txtHora['horario']['t']['hs']=$hTSalMin;
		}
		
		if($Horario[0]->imorning && $Horario[0]->itarde)
		{
			$tDescanso = $this->diffHoras($hMSalMin, $hTEntMax);
		}
		
		if($Horario[0]->imorning && !$Horario[0]->itarde)
		{
			$txtHora['fecha']=$attLog[0]->fecha;
			$tmpTime = substr($attLog[0]->hora, 0, 5);
			$tmpID  = $attLog[0]->id;
			$txtHora['m'][0]['hora'] = $tmpTime;
			$txtHora['m'][0]['idReg'] = $tmpID;
			if(strtotime($tmpTime) <= strtotime($hMEntMax)) {
				$txtHora['m'][0]['iontime'] = 1;
			}
			
			
			$txtHora['fecha']=$attLog[1]->fecha;
			$tmpTime = substr($attLog[1]->hora, 0, 5);
			$tmpID  = $attLog[1]->id;
			$txtHora['m'][1]['hora'] = $tmpTime;
			$txtHora['m'][1]['idReg'] = $tmpID;
			if(strtotime($tmpTime) >= strtotime($hMSalMin)) {
				$txtHora['m'][1]['iontime'] = 1;
			}
		}else if(!$Horario[0]->imorning && $Horario[0]->itarde)
		{
			$txtHora['fecha']=$attLog[0]->fecha;
			$tmpTime = substr($attLog[0]->hora, 0, 5);
			$tmpID  = $attLog[0]->id;
			$txtHora['m'][0]['hora'] = $tmpTime;
			$txtHora['m'][0]['idReg'] = $tmpID;
			if(strtotime($tmpTime) <= strtotime($hMEntMax)) {
				$txtHora['m'][0]['iontime'] = 1;
			}
			
			
			$txtHora['fecha']=$attLog[1]->fecha;
			$tmpTime = substr($attLog[1]->hora, 0, 5);
			$tmpID  = $attLog[1]->id;
			$txtHora['m'][1]['hora'] = $tmpTime;
			$txtHora['m'][1]['idReg'] = $tmpID;
			if(strtotime($tmpTime) >= strtotime($hMSalMin)) {
				$txtHora['m'][1]['iontime'] = 1;
			}
		} else  if($Horario[0]->imorning && $Horario[0]->itarde){
			if ($tVueltas == 1){
				$txtHora['fecha']=$attLog[0]->fecha;
				$tmpTime = substr($attLog[0]->hora, 0, 5);
				$tmpID  = $attLog[0]->id;
				if(strtotime($tmpTime) < strtotime($this->RestMintoHora($hTEntMax, 30))){
					if(strtotime($tmpTime) >= strtotime($hMSalMin)){
						$txtHora['m'][1]['hora'] = $tmpTime;
						$txtHora['m'][1]['iontime'] = 1;
						$txtHora['m'][1]['idReg'] = $tmpID;
					}else if(strtotime($tmpTime) < strtotime($hMEntMax)){
						$txtHora['m'][0]['hora'] = $tmpTime;
						$txtHora['m'][0]['iontime'] = 1;
						$txtHora['m'][0]['idReg'] = $tmpID;
					}else if(strtotime($tmpTime) < strtotime($this->SumMintoHora($hMEntMax,120))){
						$txtHora['m'][0]['hora'] = $tmpTime;
						$txtHora['m'][0]['iontime'] = 0;
						$txtHora['m'][0]['idReg'] = $tmpID;
					}else {
						$txtHora['m'][1]['hora'] = $tmpTime;
						$txtHora['m'][1]['iontime'] = 0;
						$txtHora['m'][1]['idReg'] = $tmpID;
					}
				}else{
					if(strtotime($tmpTime) >= strtotime($hTSalMin)){
						$txtHora['t'][1]['hora'] = $tmpTime;
						$txtHora['t'][1]['iontime'] = 1;
						$txtHora['t'][1]['idReg'] = $tmpID;
					} else if(strtotime($tmpTime) < strtotime($hTEntMax)){
						$txtHora['t'][0]['hora'] = $tmpTime;
						$txtHora['t'][0]['iontime'] = 1;
						$txtHora['t'][0]['idReg'] = $tmpID;
					} else if(strtotime($tmpTime) < strtotime($this->SumMintoHora($hTEntMax,90))){
						$txtHora['t'][0]['hora'] = $tmpTime;
						$txtHora['t'][0]['iontime'] = 0;
						$txtHora['t'][0]['idReg'] = $tmpID;
					} else {
						$txtHora['t'][1]['hora'] = $tmpTime;
						$txtHora['t'][1]['iontime'] = 0;
						$txtHora['t'][1]['idReg'] = $tmpID;
					}
				}
			}
			if ($tVueltas > 1){
				for($x=0;$x<$tVueltas;$x++){
					$txtHora['fecha']=$attLog[$x]->fecha;
					$tmpTime = substr($attLog[$x]->hora, 0, 5);
					$tmpID  = $attLog[$x]->id;
					if(strtotime($tmpTime) < strtotime($this->RestMintoHora($hTEntMax, 30))){
						if(strtotime($tmpTime) >= strtotime($hMSalMin)){
							$txtHora['m'][1]['hora'] = $tmpTime;
							$txtHora['m'][1]['iontime'] = 1;
							$txtHora['m'][1]['idReg'] = $tmpID;
						}else if(strtotime($tmpTime) < strtotime($hMEntMax)){
							$txtHora['m'][0]['hora'] = $tmpTime;
							$txtHora['m'][0]['iontime'] = 1;
							$txtHora['m'][0]['idReg'] = $tmpID;
						}else if(strtotime($tmpTime) < strtotime($this->SumMintoHora($hMEntMax,120))){
							$txtHora['m'][0]['hora'] = $tmpTime;
							$txtHora['m'][0]['iontime'] = 0;
							$txtHora['m'][0]['idReg'] = $tmpID;
						}else {
							$txtHora['m'][1]['hora'] = $tmpTime;
							$txtHora['m'][1]['iontime'] = 0;
							$txtHora['m'][1]['idReg'] = $tmpID;
						}
					}else{
						if(strtotime($tmpTime) >= strtotime($hTSalMin)){
							$txtHora['t'][1]['hora'] = $tmpTime;
							$txtHora['t'][1]['iontime'] = 1;
							$txtHora['t'][1]['idReg'] = $tmpID;
						} else if(strtotime($tmpTime) < strtotime($hTEntMax)){
							if(empty($txtHora['t'][0]['idReg'])){
								$txtHora['t'][0]['hora'] = $tmpTime;
								$txtHora['t'][0]['iontime'] = 1;
								$txtHora['t'][0]['idReg'] = $tmpID;
							}else{
								$txtHora['t'][1]['hora'] = $tmpTime;
								$txtHora['t'][1]['iontime'] = 1;
								$txtHora['t'][1]['idReg'] = $tmpID;
							}
						} else if(strtotime($tmpTime) < strtotime($this->SumMintoHora($hTEntMax,90))){
							if(empty($txtHora['t'][0]['idReg'])){
								$txtHora['t'][0]['hora'] = $tmpTime;
								$txtHora['t'][0]['iontime'] = 1;
								$txtHora['t'][0]['idReg'] = $tmpID;
							}else{
								$txtHora['t'][1]['hora'] = $tmpTime;
								$txtHora['t'][1]['iontime'] = 1;
								$txtHora['t'][1]['idReg'] = $tmpID;
							}
						} else {
							$txtHora['t'][1]['hora'] = $tmpTime;
							$txtHora['t'][1]['iontime'] = 0;
							$txtHora['t'][1]['idReg'] = $tmpID;
						}
					}
				}
				if (!empty($txtHora['m'][1]['idReg']) && !empty($txtHora['t'][0]['idReg'])){
					if( ($this->diffHoras($txtHora['m'][1]['hora'],$txtHora['t'][0]['hora'])+5)<=65 ){
						$txtHora['t'][0]['iontime'] = 1;
					}else{
						$txtHora['t'][0]['iontime'] = 0;
					}
				}
			}
			/*if ($tVueltas == 3){
				$txtHora['m'][0]['hora'] = "Const";
				$txtHora['m'][0]['iontime'] = 0;
				$txtHora['m'][0]['idReg'] = 0;
			}
			if ($tVueltas > 3){
				$txtHora['m'][0]['hora'] = "Const";
				$txtHora['m'][0]['iontime'] = 0;
				$txtHora['m'][0]['idReg'] = 0;
			}*/
		}
		
		/*for($i=0; $i<$tVueltas; $i++){
			$txtHora['fecha']=$attLog[0]->fecha;
			$tmpTime = substr($attLog[$i]->hora, 0, 5);
			$tmpID  = $attLog[$i]->id;
			// MAÑANA
			if($Horario[0]->imorning){
				if(strtotime($tmpTime) <= strtotime($hMEntMax))
				{
					if(empty($txtHora['m'][0]['hora']))
					{
						$txtHora['m'][0]['hora'] = $tmpTime;
						$txtHora['m'][0]['iontime'] = 1;
						$txtHora['m'][0]['idReg'] = $tmpID;
					}
				}
				elseif(strtotime($tmpTime) <= strtotime($this->RestMintoHora($hMSalMin,60)))
				{
					if(empty($txtHora['m'][0]['hora']))
					{
						$txtHora['m'][0]['hora'] = $tmpTime;
						$txtHora['m'][0]['iontime'] = 0;
						$txtHora['m'][0]['idReg'] = $tmpID;
					}
				}
				elseif(strtotime($tmpTime) >= strtotime($hMSalMin) && !$Horario[0]->itarde)
				{
					if(empty($txtHora['m'][1]['hora']))
					{
						$txtHora['m'][1]['hora'] = $tmpTime;
						$txtHora['m'][1]['iontime'] = 0;
						$txtHora['m'][1]['idReg'] = $tmpID;
					}
				}
				// SI HAY MAÑANA y TARDE
				elseif ($Horario[0]->itarde)
				{
					if (strtotime($tmpTime) >= strtotime($hMSalMin) && strtotime($tmpTime) <= strtotime($hTEntMax))
					{
						if(empty($txtHora['m'][1]['hora'])) {
							$txtHora['m'][1]['hora'] = $tmpTime;
							$txtHora['m'][1]['idReg'] = $tmpID;
						} else {
							if(strtotime($tmpTime) > strtotime($txtHora['m'][1]['hora']))
							{
								$txtHora['t'][0]['hora'] = $tmpTime;
								$txtHora['t'][0]['iontime'] = 1;
								$txtHora['t'][0]['idReg'] = $tmpID;
								if($this->diffHoras($txtHora['m'][1]['hora'], $txtHora['t'][0]['hora']) > $tDescanso)
									$txtHora['t'][0]['iontime'] = 0;
							} else {
								$txtHora['t'][0]['hora'] = $txtHora['m'][1]['hora'];
								$txtHora['t'][0]['idReg'] = $txtHora['m'][1]['idReg'];
								$txtHora['m'][1]['hora'] = $tmpTime;
								$txtHora['1'][0]['idReg'] = $tmpID;
								$txtHora['t'][0]['iontime'] = 1;
								if($this->diffHoras($txtHora['m'][1]['hora'], $txtHora['t'][0]['hora']) > $tDescanso)
									$txtHora['t'][0]['iontime'] = 0;
							}
						}
					}elseif(strtotime($tmpTime) >= strtotime($hTSalMin)){
						$txtHora['t'][1]['hora'] = $tmpTime;
						$txtHora['t'][1]['idReg'] = $tmpID;
					} else {
						$txtRetardo[] = $tmpTime;
						$txtID[] = $tmpID;
					}
				}
			}
			//TARDE
			//else{time
				// Caso solo turno de la tarde
			//}
		}
		
		for($i=0; $i<sizeof($txtRetardo); $i++)
		{
			if(strtotime($txtRetardo[$i]) >= strtotime($tMEntMax) && strtotime($txtRetardo[$i]) < strtotime($this->RestMintoHora($hMSalMin,60)))
			{
				if(empty($txtHora['m'][0]['hora'])){
					$txtHora['m'][0]['hora'] = $txtRetardo[$i];
					$txtHora['m'][0]['iontime'] = 0;
					$txtHora['m'][0]['idReg'] = $txtID[$i];
				}
			}
			elseif(strtotime($txtRetardo[$i]) >= strtotime($this->RestMintoHora($hMSalMin,60)) && strtotime($txtRetardo[$i]) < strtotime($hMSalMin))
			{
				if(empty($txtHora['m'][1]['hora'])){
					$txtHora['m'][1]['hora'] = $txtRetardo[$i];
					$txtHora['m'][1]['iontime'] = 0;
					$txtHora['m'][1]['idReg'] = $txtID[$i];
				}
			}
			elseif(strtotime($txtRetardo[$i]) > strtotime($hTEntMax) && strtotime($txtRetardo[$i]) < strtotime($this->RestMintoHora($hTSalMin,60)))
			{
				if(empty($txtHora['t'][0]['hora']))
				{
					if($this->diffHoras($txtHora['m'][1]['hora'], $txtRetardo[$i]) > $tDescanso)
					{
						$txtHora['t'][0]['hora'] = $txtRetardo[$i];
						$txtHora['t'][0]['iontime'] = 0;
						$txtHora['t'][0]['idReg'] = $txtID[$i];
					}
					else
					{
						$txtHora['t'][0]['hora'] = $txtRetardo[$i];
						$txtHora['t'][0]['idReg'] = $txtID[$i];
					}
				}
			}
			elseif(strtotime($txtRetardo[$i]) > strtotime($this->RestMintoHora($hTSalMin,60)) && strtotime($txtRetardo[$i]) < strtotime($hTSalMin))
			{
				if(empty($txtHora['t'][1]['hora']))
				{
						$txtHora['t'][1]['hora'] = $txtRetardo[$i];
						$txtHora['t'][1]['iontime'] = 0;
						$txtHora['t'][1]['idReg'] = $txtID[$i];
				}
			}
		}*/
		
		return $txtHora;
	}
	
	/**
	 * Verifica los espacios de tiempo, verificando faltas.
	 * 
	 * @param [MarcaTiempo] Marcas de Tiempo
	 * @return [Array] Tiempos corregidos con marca de faltas.
	 */
	function CheckTiempo($MarcaTiempo)
	{
		if(empty($MarcaTiempo['m'][0]['hora'])){
			$MarcaTiempo['m'][0]['hora'] = "------";
			$MarcaTiempo['m'][0]['iontime'] = 0;
		}
		if(empty($MarcaTiempo['m'][1]['hora'])){
			$MarcaTiempo['m'][1]['hora'] = "------";
			$MarcaTiempo['m'][1]['iontime'] = 0;
		}
		if(empty($MarcaTiempo['t'][0]['hora'])){
			$MarcaTiempo['t'][0]['hora'] = "------";
			$MarcaTiempo['t'][0]['iontime'] = 0;
		}
		if(empty($MarcaTiempo['t'][1]['hora'])){
			$MarcaTiempo['t'][1]['hora'] = "------";
			$MarcaTiempo['t'][1]['iontime'] = 0;
		}
		
		if(!$MarcaTiempo['m'][0]['iontime'])
			$MarcaTiempo['m'][0]['hora'] = $MarcaTiempo['m'][0]['hora'];
		if(!$MarcaTiempo['m'][1]['iontime'])
			$MarcaTiempo['m'][1]['hora'] = $MarcaTiempo['m'][1]['hora'];
		if(!$MarcaTiempo['t'][0]['iontime'])
			$MarcaTiempo['t'][0]['hora'] = $MarcaTiempo['t'][0]['hora'];
		if(!$MarcaTiempo['t'][1]['iontime'])
			$MarcaTiempo['t'][1]['hora'] = $MarcaTiempo['t'][1]['hora'];
		
		return $MarcaTiempo;
	}
	
	/**
	 * Calcula el tiempo en minutos entre 2 horas
	 * 
	 * @param [horaini] Hora de Inicio
	 * @param [horafin] Hora de Finalizacion
	 * 
	 * @return [int] Diferencia de Tiempo
	 */
	function diffHoras($horaini,$horafin)
	{
		$horai=substr($horaini,0,2);
		$mini=substr($horaini,3,2);
	
		$horaf=substr($horafin,0,2);
		$minf=substr($horafin,3,2);

	
		$ini=($horai*60)+$mini;
		$fin=($horaf*60)+$minf;
	
		return $fin-$ini;
	}
	
	/**
	 * Agrega Minutos a una hora especifica
	 * 
	 * @param [Hora] Hora base de calculos
	 * @param [Minutos] Minutos a agregar a la hora
	 * 
	 * @return [time] Hora nueva
	 */
	private function SumMintoHora($Hora,$Minutos)
	{
		$minCalc=(substr($Hora,0,2)*60)+substr($Hora,3,2)+$Minutos;
		$horas = round($minCalc/60);
		if($horas>($minCalc/60))
			$horas--;
			
		$retMin = strlen($minCalc-($horas*60))<2 ? "0".($minCalc-($horas*60)) : $minCalc-($horas*60);
			
		return $horas.":".$retMin;
	}
	
	private function RestMintoHora($Hora, $Minutos)
	{
		$minCalc=(substr($Hora,0,2)*60)+substr($Hora,3,2)-$Minutos;
		$horas = round($minCalc/60);
		if($horas>($minCalc/60))
			$horas--;
			
		$retMin = strlen($minCalc-($horas*60))<2 ? "0".($minCalc-($horas*60)) : $minCalc-($horas*60);
			
		return $horas.":".$retMin;
	}
	
	private function HoratoMin($Hora)
	{
		return ((substr($Hora,0,2)*60)+substr($Hora,3,2));
	}
	
	function DatetoStr($Date)
	{
		$dd = split("-", $Date);
		return $dd[2]."/".$dd[1]."/".$dd[0];
	}
	
	function intToTime($time){
		if ($time < 60){
			return strlen($time)<2 ? "0".$time : $time;
		}
		else{
			$hr = intval($time/60);
			$time -= $hr*60;
			return strlen($hr)<2?"0".$hr:$hr.":".strlen($time)<2?"0".$time:$time;
		}
	}
	
	function intHrToTime($time){
		$retVal = 0;
		if ($time>0){
			$val1 = intval($time);
			$val2 = $time - $val1;
			$val1 = strlen($val1)<2 ? "0".$val1 : $val1;
			
			$val2 = $val2*60;
			$val2 = strlen($val2)<2 ? "0".$val2 : $val2;
			
			$retVal = $val1.":".$val2;;
		}
		return $retVal;
	}
}
?>
