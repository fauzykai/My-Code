<center>
<h2>
MENAMPILKAN DATA KARYAWAN
<hr>
===============================
<table border=10>
<tr><td>NIK<td>NAMA<td>BAGIAN<td>PENDIDIKAN<td>ALAMAT
<?
mysql_connect("localhost","root","");
mysql_select_db("pegawai1");
$sql = "select * from pegawai1";
$hasil= mysql_query($sql) ;
$row=mysql_fetch_row ($hasil);
do
{
list ($nik,$nama,$bagian,$pendidikan,$alamat)=$row ;
echo "<tr><td>$nik<td>$nama<td>$bagian<td>$pendidikan<td>$alamat";
}
while ($row=mysql_fetch_row($hasil));
?>