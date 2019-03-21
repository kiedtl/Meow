param (
	[Parameter(
		ValueFromPipeline=$true
	)]
	[Alias('f')]
	[array]$File,

	[Alias('s')]
	[int]$Spread = 5,

	[Alias('q')]
	[double]$Frequency = 1.1,

	[Alias('i')]
	[switch]$Invert,

	[Alias('d')]
	[switch]$Demo,

	[Alias('h')]
	[switch]$Help
)

. "$psscriptroot\..\lib\core.ps1"

$M_INT_COPYRIGHTSYMBOL = [char]169
$E = [char]27

if (!$File ) { if (!($Demo -or $Help)) { break } }
if ($Demo  ) { meow_internal_demo	 ;	break }
if ($Help  ) { meow_internal_help	 ;	break }
if ($Invert) { "$E[7m" }
"$E[?25l"
$File | Out-String | Foreach-Object {
	meow_execute $_ $Spread $Frequency
}
"$E[?25h"
if ($Invert) { "$E[27m" }
