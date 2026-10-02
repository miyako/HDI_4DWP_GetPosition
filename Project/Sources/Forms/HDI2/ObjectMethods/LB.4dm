var $range : Object
var $p : Integer

$p:=Find in array:C230(Self:C308->; True:C214)
If ($p>0)
	$range:=WP Bookmark range:C1416(WParea; _bookmarks{$p})
	WP SELECT:C1348(WParea; $range)
End if 

