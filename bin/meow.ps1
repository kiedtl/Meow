#!/usr/bin/env pwsh

param (
    [Parameter(
        ValueFromPipeline = $true
    )]
    [Alias('f')]
    [string]$file,

    [Alias('s')]
    [double]$spread = 3,

    [Alias('q')]
    [double]$frequency = 0.1,

    [Alias('i')]
    [switch]$invert,

    [Alias('d')]
    [switch]$demo,

    [Alias('h')]
    [switch]$help
)

process {
	. "$psscriptroot/../lib/core.ps1"
    $M_INT_COPYRIGHTSYMBOL = [char]169
    $E = [char]27
	$escapeseq = "38"
    if (!$file ) { if (!($demo -or $help)) { break } }
    if ($demo  ) { meow_internal_demo	 ;	break }
    if ($help  ) { meow_internal_help	 ;	break }
    if ($invert) { $escapeseq = "48" }
    write-host "$E[?25l" -nonewline

    $input | out-string | meow_execute -Spread $spread -Freq $frequency -Escape $escapeseq

    $E = [char]27
    write-host "$E[?25h" -nonewline
}
