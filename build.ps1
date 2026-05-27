param(
  [string]$Out = "E:\upskills\frontier-lab-course\index.html",
  [string[]]$Fragments
)
$base = "E:\upskills\frontier-lab-course\build"
$shell = Get-Content -Raw -Encoding UTF8 -Path (Join-Path $base "_shell.html")
$modules = ""
foreach($f in $Fragments){
  $p = Join-Path $base $f
  if(Test-Path $p){
    $modules += (Get-Content -Raw -Encoding UTF8 -Path $p) + "`n`n"
    Write-Host ("  + {0}" -f $f)
  } else {
    Write-Host ("  ! MISSING: {0}" -f $p) -ForegroundColor Red
  }
}
$final = $shell.Replace("<!--MODULES-->", $modules)
Set-Content -Path $Out -Value $final -Encoding UTF8 -NoNewline
$kb = [math]::Round((Get-Item $Out).Length/1kb,1)
Write-Host ("Wrote {0}  ({1} KB, {2} modules)" -f $Out, $kb, $Fragments.Count) -ForegroundColor Green
