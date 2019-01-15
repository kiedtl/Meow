$M_INT_COPYRIGHTSYMBOL = [char]169

function meow {
    param (
        [Parameter(
            ValueFromPipeline=$true
        )]
        [Alias('f')]
        [array]$File,
        [Alias('s')]
        [int]$Spread = 5,
        [Alias('d')]
        [switch]$Demo,
        [Alias('h')]
        [switch]$Help
    )
    if (!$File ) { if (!($Demo -or $Help)) { break } }
    if ($Demo  ) { meow_internal_demo     ;    break }
    if ($Help  ) { meow_internal_help     ;    break }
    $File | Out-String | Foreach-Object {
        meow_execute $_ $Spread  
    }
}

function meow_execute {
    param (
        [Alias('f')]
        [string]$File,
        [Alias('s')]
        [int]$Spread
    )
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
    [string[]]$colors = "DarkRed", "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
    $c = (get-random -maximum ($colors.Length))
    $i = 0
    $c_txt | % {
        write-host "$_" -f ($colors[($c % $colors.Length)]) -nonewline
        [bool]$isWhitespace = if ($_ -eq " ") { $true }
                              elseif ($_ -eq "`n") { $true }
                              else { $false } 
        $i++
        if ($i -gt $Spread) { if ($isWhitespace) { $c++ } $c++; $i++; $i = 0 }
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
    "meow(1) v0.1.0 `nCopyright ${M_INT_COPYRIGHTSYMBOL} $([System.DateTime]::Now.ToString("yyyy")) Kied Llaetenn AGPL-3.0`n`nOPTIONS:`n`t-f, -File`tThe file or text to read from.`n`t-s, -Spread`tThe color spread of the rainbow.`n`n`t-h, -Help`tPrint this help message.`n`t-d, -Demo`tDemo the Meow program.`n`nPlease report all bugs or feature requests to `nhttp://github.com/kiedtl/meow as an issue.`n`nThis program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR ANY PARTICULAR PURPOSE.  See the
GNU Affero General Public License v3 for more details.
" | Out-String | meow
}