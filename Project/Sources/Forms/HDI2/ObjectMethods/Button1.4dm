var $i; $n : Integer
var $o; $range : Object

ARRAY TEXT:C222(_bookmarks; 0)
ARRAY LONGINT:C221(_sections; 0)
ARRAY LONGINT:C221(_pages; 0)
ARRAY LONGINT:C221(_columns; 0)
ARRAY LONGINT:C221(_lines; 0)
ARRAY LONGINT:C221(_positions; 0)


WP GET BOOKMARKS:C1417(WParea; _bookmarks)
$n:=Size of array:C274(_bookmarks)

For ($i; 1; $n)
	$range:=WP Bookmark range:C1416(WParea; _bookmarks{$i})
	
	$o:=WP Get position:C1577($range)
	
	APPEND TO ARRAY:C911(_sections; $o.section)
	APPEND TO ARRAY:C911(_pages; $o.page)
	APPEND TO ARRAY:C911(_columns; $o.column)
	APPEND TO ARRAY:C911(_lines; $o.line)
	APPEND TO ARRAY:C911(_positions; $o.position)
	
End for 
