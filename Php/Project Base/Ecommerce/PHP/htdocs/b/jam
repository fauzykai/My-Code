<html>
<head><title>Tugas 3  </title>
<style>
table
{
border-collapse:collapse;
}
table,th, td
{
border: 1px solid black;
}
</style>
</head>
<body>
<center>

<div style="font-size:18px">
<b>Khairul Umam</b><br><br>
</div>


<?php
$tanggal= mktime(date("m"),date("d"),date("Y"));
echo "Sekarang Tanggal : ".date("d-M-Y", $tanggal)."<br><br>";

date_default_timezone_set('Asia/Jakarta');

$jam=date("H:i:s");
echo "JAM : <b>". $jam."<br>"."</b>"; 

$a = date ("H");
if (($a>=6) && ($a<=11)){
echo "* <b>Good Morning !!</b>*<br>";
} 
else if(($a>11) && ($a<=15))
{
echo "Good Day !!<br><br>";}
else if (($a>15) && ($a<=18)){
echo "Good Afternoon !!<br>";}

else { echo "*<b> Good Night </b>!!*";}
?>
<br><br>
<?php
$isi = array 
(
"Nomor" => array ("1","2","3","4","5","6","7","8") ,
"NIM" => array ("10951007958","10951008800","10951006688","10951009998","10951008988","10951006657","10951008701","10951001985"),
"Nama" => array ("Mardeni","Muhammad Adha","Muhammad Adri","Kasmono","Khairul Umam","Zul Rizki Fahmi","Dayub","Nanda Febriani") ,
"Kelas" => array ("VIA","VIA","VIA","VIA","VIA","VIA","VIA","VIA") , 
"Nilai" => array ("A","A","A","A","A","A","A","A") 

);
echo "<div style=\"padding-left:180px\">";
echo "<table border=\"1\" style=\"float:left;\" > " ;
echo "<tr bgcolor=\"white\"><th> No</th>";
echo "<th> NIM </th>";
echo "<th> Nama</th>";
echo "<th> Kelas</th>";
echo "<th> Nilai </th></tr>";

for ($i = 0; $i<=7; $i+=1 ){
if ($i%2 == 1){ 
echo "<tr bgcolor=\"20fa03\"><td width=\"30\">";
echo $isi['Nomor'][$i];
echo "</td><td width=\"150\"><center>";
echo $isi['NIM'][$i];
echo "</center></td><td width=\"130\">";
echo $isi['Nama'][$i];
echo "</td><td width=\"40\">";
echo $isi['Kelas'][$i];
echo "</td><td width=\"30\">";
echo $isi['Nilai'][$i];
echo "</td></tr>";

}
else {
echo "<tr bgcolor=\"#a6fd9b\"><td width=\"30\">";
echo $isi['Nomor'][$i];
echo "</td><td width=\"150\"><center>";
echo $isi['NIM'][$i];
echo "</center></td><td width=\"130\">";
echo $isi['Nama'][$i];
echo "</td><td width=\"50\">";
echo $isi['Kelas'][$i];
echo "</td><td width=\"40\">";
echo $isi['Nilai'][$i];
echo "</td></tr>";
}
}
echo "</table>";
?>
</div>
<div style="padding-right:180px">
<div style="border: 1px solid #000000; width:400px; background-color:#bfe3ba; float:right;">
<p >Kasus Anak Ayam Turun 10</p>
<?php
$i = "10";
do {
echo " Anak Ayam Turun $i ";
if ($i==1) {
echo "Mati 1 tinggal Induknya<br><br>";
}
else
{
echo " Mati 1 Tinggal ".($i-1)."<br>";
}
$i--;}
while ($i>=1);
?>
</div></div>
</body>
</html>
