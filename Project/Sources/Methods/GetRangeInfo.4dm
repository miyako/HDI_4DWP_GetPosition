//%attributes = {}
If (True:C214)
	
	C_OBJECT:C1216(WParea)
	C_OBJECT:C1216(userRange)
	
	C_BOOLEAN:C305($defined)
	
	C_OBJECT:C1216($state)
	C_OBJECT:C1216($userRange)
	
	C_LONGINT:C283($option)
	C_LONGINT:C283($type)
	C_LONGINT:C283($end)
	
	C_TEXT:C284($code)
	
	userRange:=WP Selection range:C1340(WParea)
	
	//$defined:=OB Is defined(userRange;"start")
	//$type:=OB Get(userRange;"type")
	
	$type:=userRange.type
	
	If ($type=0)
		vIndexStart:=userRange.start
		vIndexEnd:=userRange.end
	Else 
		vIndexStart:=0
		vIndexEnd:=0
	End if 
	
	
	
	$state:=Action info:C1442("htmlWYSIWIGEnabled")
	
	$option:=wk 4D Write Pro layout:K81:176
	$code:="WP Get position(range;wk 4D Write Pro layout)"
	
	
	If ($state.status="checked")
		
		$option:=wk html wysiwyg:K81:175
		$code:="WP Get position(range;wk html wysiwyg)"
		
	End if 
	
	OBJECT SET TITLE:C194(*; "code"; $code)
	
	vRangePosition:=WP Get position:C1577(userRange; $option)
	
	
	
	// IF you need to know where the range ends, just create a range !
	
	//If (userRange[wk end]>userRange[wk start])
	//$end:=userRange[wk end]-1
	//Else 
	//$end:=userRange[wk start]
	//End if 
	
	//$userRange:=WP Create userRange(WPArea;$end;$end)  // here
	//vRangePosition_end:=WP Get range position($userRange;$option)
	
End if 




