
$source=("C:\Users\Administrator\Desktop\logfolder1", "C:\Users\Administrator\Desktop\logfolder2","C:\Users\Administrator\Desktop\logfolder3","C:\Users\Administrator\Desktop\logfolder4" ,"")        #keep "" at the end..specify multiple paths before it
$destinationrootfolder="C:\Users\Administrator\Desktop\rootdestfolder"
$findlogsafter=[datetime]"06/06/2019 01:00:00 AM" 
$findloglastdate=[datetime]"06/09/2019 01:59:00 PM" 

#saving the number of source folders

$numberofsourcefolders=($source.Length - 1)                                 #ignore the last null
$count=0 


while ($count -lt $numberofsourcefolders) {


#Creating subfolder in the destination 

$folders=$source[$count].Split('\')                                     #Get the number of folders from source path
$val=$folders.length                                                    # find the length 
$destinationsubfolder=$folders[$val-1]                                  #get the last folder from source path
$dest= $destinationrootfolder + '\' + $destinationsubfolder             #save the new destination location
"Creating New Subfolder in the destination Path"
mkdir $dest                                                             #create subfolder in root destination folder

$filestocopy = Get-ChildItem -Path $source[$count] | where {$_.LastWriteTime -gt $findlogsafter -AND $_.LastWriteTime -lt $findloglastdate} 
 
$len=$filestocopy.Length

"Number of Files to be copied"
$len
$i=0

while ($i -lt $len) {

cd $source[$count]
Copy-Item -Path $filestocopy[$i] -Destination $dest 
$i=$i+1

}


$count++

}


