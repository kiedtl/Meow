#!/usr/bin/env pwsh

<#
.SYNOPSIS
meow(1) - A minimalistic `lolcat` clone for Windows that actually works.
.DESCRIPTION
meow(1) is a `lolcat` clone written in Pure PowerShell. It is a simple utility that rainbowizes text in the terminal.
.PARAMETER text
The file or text to read from.
.PARAMETER spread
The color spread of the rainbow.
.PARAMETER frequency
Specify a color frequency
.PARAMETER invert
Invert the background and foreground colors.
.PARAMETER demo
Run a demo of meow(1).
.PARAMETER help
Display the help message in rainbow colors.
.EXAMPLE
"Hello, World!" | meow
.NOTES
Copyright 2018 - 2024 Kied Llaetenn AGPL-3.0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR ANY PARTICULAR PURPOSE.  See the
GNU Affero General Public License v3 for more details.
.LINK
https://github.com/kiedtl/meow
.LINK
https://github.com/js0ny/TyanCat/tree/bmeow
#>
param (
    [Parameter(
        ValueFromPipeline = $true
    )]
    [string]$text,
    [alias('s')]
    [double]$spread = 3.0,
    [alias('q')]
    [double]$frequency = 0.1,
    [alias('i')]
    [switch]$invert,
    [alias('d')]
    [switch]$demo,
    [alias('h')]
    [switch]$help
)

begin {
    . "$psscriptroot/../lib/core.ps1"
}

process {
    if ($text -eq $null) {
        $text = $input
    }
    $M_INT_COPYRIGHTSYMBOL = [char]169
    $E = [char]27
  	$escapeseq = "38"
    if (!$text ) { if (!($demo -or $help)) { break } }
    if ($demo  ) { meow_internal_demo	 ;	break }
    if ($help  ) { meow_internal_help	 ;	break }
    if ($invert) { $escapeseq = "48" }
    write-host "$E[?25l" -nonewline
    $ANSI_REGEX = "`e\[[0-9;?]*[A-Za-z]"
    $text = $text -Replace $ANSI_REGEX,""
    $text | out-string | meow_execute -Spread $spread -Freq $frequency -Escape $escapeseq

    $E = [char]27
    write-host "$E[?25h" -nonewline
}
