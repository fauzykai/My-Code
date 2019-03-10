<?php
$file=fopen("welcome.txt","r") or exit("Unable to open file!");
//output a line of the file until the end is reached
while(!feof($file))
{
echo fgets($file)."<br/>";
}
fclose($file);
?>