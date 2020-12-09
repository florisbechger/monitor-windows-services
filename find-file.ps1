Clear-Host


$Source ="C:\"
$Directory = "Users\[Username]\Google Drive\"
$Name = "*"
$Block = Get-ChildItem -path $Source\$Directory\$Name -Recurse
$Block | Where-Object {$_.length -gt 1MB} | Select Name,Directory,@{n="Length(MB)";e={$_.Length/1MB}},CreationTime,LastAccessTime,LastWriteTime # -lt (less than)


