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


function meow_execute {
	param (
		[string]$File,
		[int]$Spread,
		[double]$Freq
	)
	[char]$E = [char]27
	[bool]$ispath = if ($File -match "`n" -or "`r" -or "`v" -or "`t") 
					{ $false }
					elseif (test-path $File -PathType leaf) { $true } 
					else { $false }
	if ($ispath) { $s_txt = gc -path $file }
	elseif ($File -eq "-") { $s_txt = read-host "Enter some text" }
	else { $s_txt = $File }
	[char[]]$c_txt = @()
	for ($i = 0; $i -lt $s_txt.Length; $i++) { 
		$c_txt += $s_txt[$i] 
	}

$i = 0
[int]$r = ([math]::sin($Spread * ($i / $Spread) + 0) * 127 + 128)
[int]$g = ([math]::sin($Spread * ($i / $Spread) + 2 * [math]::pi / 3) * 127 + 128)
[int]$b = ([math]::sin($Spread * ($i / $Spread) + 4 * [math]::pi / 3) * 127 + 128)	
$c_txt | % {
		write-host "$E[38;2;${r};${g};${b}m$_$E[38;2;150;150;150m" -nonewline
		[bool]$isWhitespace = if ($_ -eq " ") { $true }
							  elseif ($_ -eq "`n") { $true }
							  else { $false } 
		$i++
		[int]$r = ([math]::sin($Freq * ($i / $Spread) + 0) * 127 + 128)
		[int]$g = ([math]::sin($Freq * ($i / $Spread) + 2 * [math]::pi / 3) * 127 + 128)
		[int]$b = ([math]::sin($Freq * ($i / $Spread) + 4 * [math]::pi / 3) * 127 + 128) 
		if ($isWhitespace) {
			$i++
	 		[int]$r = ([math]::sin($Freq * ($i / $Spread) + 0) * 127 + 128)
	 		[int]$g = ([math]::sin($Freq * ($i / $Spread) + 2 * [math]::pi / 3) * 127 + 128)
	 		[int]$b = ([math]::sin($Freq * ($i / $Spread) + 4 * [math]::pi / 3) * 127 + 128) 
		}  
	}
}	

function meow_internal_demo {
	$i = 0
	$s = ""
	1..102 | % {
		$s += "Hello, World!"
		$i++
		if ($i -gt 5) {
			$i = 0
			$s += "`n"
		}
	}
	$s | out-string | meow
}

function meow_internal_help {
	"meow(1) v0.2019.01.31 `nCopyright ${M_INT_COPYRIGHTSYMBOL} 2018 - $([System.DateTime]::Now.ToString("yyyy")) Kied Llaetenn AGPL-3.0`n`nOPTIONS:`n`t-f, -File`tThe file or text to read from.`n`t-s, -Spread`tThe color spread of the rainbow.`n`n`t-h, -Help`tPrint this help message.`n`t-d, -Demo`tDemo the Meow program.`n`nPlease report all bugs or feature requests to `nhttp://github.com/kiedtl/meow as an issue.`n`nThis program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR ANY PARTICULAR PURPOSE.  See the
GNU Affero General Public License v3 for more details.
" | Out-String | meow
}
