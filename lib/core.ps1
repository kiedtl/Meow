function meow_execute {
	param (
		[Parameter(
			ValueFromPipeline=$true
		)]
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
	$s | out-string | meow_execute -Freq 1.1 -Spread 5
}

function meow_internal_help {
	"`nmeow(1) v0.2019.01.31 `nCopyright ${M_INT_COPYRIGHTSYMBOL} 2018 - $([System.DateTime]::Now.ToString("yyyy")) Kied Llaetenn AGPL-3.0`n`nOPTIONS:`n`t-f, -File`tThe file or text to read from.`n`t-s, -Spread`tThe color spread of the rainbow.`n`t-q, -Frequency`tSpecify a color frequency (default: 1.1)`n`t-i, -Invert`tInvert the background and foreground colors. `n`n`t-h, -Help`tPrint this help message.`n`t-d, -Demo`tDemo the Meow program.`n`nPlease report all bugs or feature requests to `nhttp://github.com/kiedtl/meow as an issue.`n`nThis program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR ANY PARTICULAR PURPOSE.  See the
GNU Affero General Public License v3 for more details.
" | Out-String | meow_execute -Freq 1.1 -Spread 5
}
