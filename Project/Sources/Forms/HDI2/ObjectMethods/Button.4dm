C_OBJECT:C1216($body)
C_OBJECT:C1216($paragraph)
C_OBJECT:C1216($o)

ARRAY LONGINT:C221(_sections; 0)
ARRAY LONGINT:C221(_pages; 0)
ARRAY LONGINT:C221(_columns; 0)
ARRAY LONGINT:C221(_lines; 0)
ARRAY LONGINT:C221(_positions; 0)

$body:=WP Get body:C1516(WParea)
_paragraphs:=WP Get elements:C1550($body; wk type paragraph:K81:191)

For each ($paragraph; _paragraphs)
	
	$o:=WP Get position:C1577($paragraph)
	
	APPEND TO ARRAY:C911(_sections; $o.section)
	APPEND TO ARRAY:C911(_pages; $o.page)
	APPEND TO ARRAY:C911(_columns; $o.column)
	APPEND TO ARRAY:C911(_lines; $o.line)
	APPEND TO ARRAY:C911(_positions; $o.position)
	
End for each 