<center>
<h2>
 MENAMPILKAN DATA YANG DI CARI
<hr>
===============================
<table border=10>
<?
mysql_connect("localhost","root","");
mysql_select_db("pegawai");
$sql= "select * from pegawai where nama='$nama'";
$hasil= mysql_query($sql) ;
$row=mysql_fetch_row ($hasil);
do
{
list ($nik,$nama,$bagian,$pendidikan,$alamat)=$row ;
echo "<tr><td>NIK <td>$nik";
echo "<tr><td>NAMA <td>$nama";
echo "<tr><td>BAGIAN <td>$bagian";
echo "<tr><td>PENDIDIKAN <td>$pendidikan";
echo "<tr><td>ALAMAT <td>$alamat";
echo "</table>";

}
while ($row=mysql_fetch_row($hasil));
?>