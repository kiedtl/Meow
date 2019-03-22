$script:i = get-random -maximum 255
$i_initial = $i

function meow_execute {
    param (
        [Parameter(
            ValueFromPipeline = $true
        )]
        [string]$File,
        [double]$Spread,
        [double]$Freq,
		    [string]$Escape = "38"
    )
    [char]$E = [char]27
    [string]$s_txt = $File
    [char[]]$c_txt = @()
    for ($c = 0; $c -lt $s_txt.Length; $c++) {
        $c_txt += $s_txt[$c]
    }

    [int]$r = ([math]::sin($Freq * ($script:i / $Spread) + 0) * 127 + 128)
    [int]$g = ([math]::sin($Freq * ($script:i / $Spread) + 2 * [math]::pi / 3) * 127 + 128)
    [int]$b = ([math]::sin($Freq * ($script:i / $Spread) + 4 * [math]::pi / 3) * 127 + 128)
    $c_txt | % {
        write-host "$E[${Escape};2;${r};${g};${b}m$_$E[0m" -nonewline
        [bool]$isWhitespace = if ($_ -eq " ") { $true } else { $false }
        if ($_ -eq "`n") {
            $script:i_initial += 1
            $script:i = $script:i_initial
        }
        if (!$isWhitespace) { $script:i++ }
        [int]$r = ([math]::sin($Freq * ($script:i / $Spread) + 0) * 127 + 128)
        [int]$g = ([math]::sin($Freq * ($script:i / $Spread) + 2 * [math]::pi / 3) * 127 + 128)
        [int]$b = ([math]::sin($Freq * ($script:i / $Spread) + 4 * [math]::pi / 3) * 127 + 128)
    }
    $script:i_initial += 1
    $script:i = $script:i_initial
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
	  $s | out-string | & "$psscriptroot/../bin/meow.ps1"
}

function meow_internal_help {
    "`nmeow(1) v0.2019.03.22
Copyright ${M_INT_COPYRIGHTSYMBOL} 2018 - $([System.DateTime]::Now.ToString("yyyy")) Kied Llaetenn AGPL-3.0

OPTIONS:
`t-t, -text`tThe file or text to read from.
`t-s, -spread`tThe color spread of the rainbow.
`t-q, -frequency`tSpecify a color frequency (default: 1.1)
`t-i, -invert`tInvert the background and foreground colors.

`t-h, -help`tPrint this help message.
`t-d, -demo`tDemo the Meow program.
Please report all bugs or feature requests to
http://github.com/kiedtl/meow as an issue.
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR ANY PARTICULAR PURPOSE.  See the
GNU Affero General Public License v3 for more details.
" | Out-String | & "$psscriptroot/../bin/meow.ps1"
}
