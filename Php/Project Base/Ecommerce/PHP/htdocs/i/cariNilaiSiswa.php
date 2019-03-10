<?
echo "<center>";
echo "<h1>NILAI ONLINE MTS IF_TIDAK_OKE</h1>";
echo "<table border=1>";
mysql_connect("localhost","root","");
mysql_select_db("nilai");
$sql = "select pelajaran.kodemtp, pelajaran.sks, nilai.indek, siswa.nama  from pelajaran, nilai, siswa 
where (siswa.nim = nilai.nim) and (pelajaran.kodemtp = nilai.kodemtp) and siswa.nim = $nim";
$hasil = mysql_query($sql);
//echo "<tr><td>$hasil</td></tr>";
$row = mysql_fetch_row($hasil);
$nomor = 1;

//list ($nama)=$colomn;
list($kodemtp,$sks,$indek,$nama)=$row;
   echo "<tr><td colspan = 4 align=left>NAMA SISWA : $nama</td></tr>";
   echo "<tr><td>NO</td><td>MATA PELAJARAN</td><td>SKS</td><td>NILAI</td></tr>";
do
{
   list($kodemtp,$sks,$indek,)=$row;
   echo "<tr><td>$nomor</td><td>$kodemtp</td><td>$sks</td><td>$indek</td></tr>";
   $nomor++;
}while ($row=mysql_fetch_row($hasil));
echo "</table>";
?>