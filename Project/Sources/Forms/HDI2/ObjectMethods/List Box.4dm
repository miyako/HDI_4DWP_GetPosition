var $paragraph : Object

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		$paragraph:=_paragraphs[_sections-1]
		WP SELECT:C1348(WParea; $paragraph)
		
End case 