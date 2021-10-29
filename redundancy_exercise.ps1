#!/usr/bin/env pwsh
# Exercise generator for availability

param(
[Parameter()]
[int] $Variant = (Get-Random -Min 0 -Max 1)
)

$GreenCheck = @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  NoNewLine = $true
  }

$RedX = @{
    Object =  'X'
    ForegroundColor = 'Red'
    NoNewLine = $true
}

switch ( $Variant ) {
0 {
$ExtraUnits = Get-Random -Min 1 -Max 3
$N = Get-Random -Min $ExtraUnits -Max $($ExtraUnits+2)
$TotalUnits = $N + $ExtraUnits
$QuestionText = "A system has $TotalUnits units installed and is said to be N+$ExtraUnits redundant. How many units are required for normal operation?"
$Target = $N
$Units = ""

$Solution = "
System has $Total units to provide N+$ExtraUnits.
Of this, $ExtraUnits units are not required for normal operation.
required units = total units - extra units 
	       = $TotalUnits - $ExtraUnits
	       = $N 
"

}
    1 {
	$
    }
default {
	Write-Error "Variant $Variant not found"
     Return
}
}

Clear-Host
Write-Host "Question variant $Variant"
Write-Host $QuestionText
Write-Host " "

$Answer = Read-Host "Enter answer [$Units]"
Write-Host " "

$Target = [math]::Round($Target,2)
$NormalisedError = [math]::Round(($Answer - $Target)/$Target,2)

if ( [Math]::Abs($NormalisedError) -lt 0.01 ) {
  Write-Host @GreenCheck 
  Write-Host " your answer was correct"
} else {
  Write-Host @RedX
  Write-Host " your answer was wrong"
}
Write-Host " "

Write-Host $Solution -ForegroundColor Yellow

Write-Host " "

Write-Host "Correct answer = $Target $Units" -ForegroundColor Cyan	
Write-Host "Normalised error: $NormalisedError"

Write-Host ""

