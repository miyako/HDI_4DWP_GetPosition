var $page : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:1])
		ALL RECORDS:C47([INFO:1])
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		rHeader:=0
		rBody:=1
		rFooter:=0
		rUserSelection:=0
		
		rBefore:=0
		rReplace:=0
		rAfter:=1
		
		rExpAsValue:=1
		rExpAsSource:=0
		rExpAsSpace:=0
		
		$page:=1
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4=$page)
		WParea:=[INFO:1]Sample:5
		
		If (Is macOS:C1572)
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)  // macOS
		Else 
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)  // windows
		End if 
		
		
		vIndexStart:=1113
		vIndexEnd:=1221
		
		WP SELECT:C1348(WParea; vIndexStart; vIndexEnd)
		SET TIMER:C645(30)  // half second
		
		GOTO OBJECT:C206(*; "WParea")
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (Is macOS:C1572)
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)  // macOS
		Else 
			ST SET ATTRIBUTES:C1093(*; "information@"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)  // windows
		End if 
		
		
		ARRAY TEXT:C222(_bookmarks; 0)
		ARRAY LONGINT:C221(_sections; 0)
		ARRAY LONGINT:C221(_pages; 0)
		ARRAY LONGINT:C221(_columns; 0)
		ARRAY LONGINT:C221(_lines; 0)
		ARRAY LONGINT:C221(_positions; 0)
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		GetRangeInfo
		
End case 

