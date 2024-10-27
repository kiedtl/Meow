#!/usr/bin/env pwsh

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
