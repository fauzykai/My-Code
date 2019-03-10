<html>
<body>
<?php
echo "numerik array <br/><br/>";
echo "cara yg pertama<br/>";
$names = array("ani","kamil","Joe");

echo $names[2]." and ".$names[0]." are ".$names[1]. " s neighbors ";

echo "<br/><br/>cara yg kedua<br/>";
$names[0] = "ani";
$names[1] = "kamil";
$names[2] = "joe";
echo $names[2]. "and".$names[0]."are".$names[1]. "neighbors";
?>
</html>