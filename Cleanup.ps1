cls

$folders = [IO.Directory]::GetDirectories($PSScriptRoot);

echo $PSScriptRoot
 
foreach($folder in $folders) 
{ 
    $subFolders = [IO.Directory]::GetDirectories($folder); 

    foreach($subFolder in $subFolders) 
    { 
        $subFolderName = Split-Path $subFolder -leaf

        if($subFolderName -eq 'bin' -or $subFolderName -eq 'obj')
        {
            echo $subFolder
            Remove-Item $subFolder -Recurse -Force
        }
    }
} 
