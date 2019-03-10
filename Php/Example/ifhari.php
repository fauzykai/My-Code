<html>
<body>
<?php
$d=date("D");

if ($d=="Mon")
	{
	echo "kemarin hari minggu</br>";
	echo "sekarang hari senin</br>";
	echo "besok hari selasa</br>";
	}
elseif ($d=="Tue")
	{
	echo "kemarin hari senin</br>";
	echo "sekarang hari selasa</br>";
	echo "besok hari rabu</br>";
	}
elseif ($d=="Wed")
	{
	echo "kemarin hari selasa</br>";
	echo "sekarang hari rabu</br>";
	echo "besok hari kamis</br>";
	}
elseif ($d=="Thu")
	{
	echo "kemarin hari rabu</br>";
	echo "sekarang hari kamis</br>";
	echo "besok hari jum'at</br>";
	}
elseif ($d=="Fri")
	{
	echo "kemarin hari kamis</br>";
	echo "sekarang hari jum'at</br>";
	echo "besok hari sabtu</br>";
	}
elseif ($d=="Sat")
	{
	echo "kemarin hari jum'at</br>";
	echo "sekarang hari sabtu</br>";
	echo "besok hari minggu</br>";
	}
elseif ($d=="Sun")
	{
	echo "kemarin hari sabtu</br>";
	echo "sekarang hari minggu</br>";
	echo "besok hari senin</br>";
	}
	
?>
</body>
</html>