<html>
<body>
<?php
$d=date("D");

switch($d)
{
case "Mon";
	echo "sekarang hari senin</br>";
	echo "besok hari selasa";
break;

case "Tue";
	echo "sekarang hari selasa</br>";
	echo "besok hari rabu";
break;

case "Wed";
	echo "sekarang hari rabu</br>";
	echo "besok hari kamis";
break;

case "Thu";
	echo "sekarang hari kamis</br>";
	echo "besok hari jum'at";
break;

case "Fri";
	echo "sekarang hari jum'at</br>";
	echo "besok hari sabtu";
break;

case "Sat";
	echo "sekarang hari sabtu</br>";
	echo "besok hari minggu";
break;

case "Sun";
	echo "sekarang hari minggu</br>";
	echo "besok hari senin";
break;


default:
	echo "asdasd";
}

?>
</body>
</html>