$src_log="C:\Users\admin\Desktop\LOG-Extractor\logssrc"
$src_dest="C:\Users\admin\Desktop\LOG-Extractor\logsdst"
$findlogsafter=[datetime]"05/07/2019 01:00:00 PM"
$findloglastdate=[datetime]"05/08/2019 23:00:00 PM"

$filestocopy = Get-ChildItem -Path $src_log | where {$_.LastWriteTime -gt $findlogsafter -AND $_.LastWriteTime -lt $findloglastdate}

cd $source

Copy-Item -Path $filestocopy[0] -Destination $src_dest


