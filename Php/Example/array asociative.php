<html>
<body>
<?php
echo "cara yg pertama<br/>";
$ages=array("ani"=>32,"kamil"=>30,"joe"=>34);
echo "ani is ".$ages['ani']." years old.";


echo "<br/><br/>cara yg kedua<br/>";
$ages['ani'] = "32";
$ages['kamil'] = "30";
$ages['joe'] = "34";
echo "ani is " . $ages['ani']." years old.";
?>
</html>