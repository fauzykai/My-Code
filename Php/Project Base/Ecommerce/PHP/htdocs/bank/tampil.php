<table border=1>
<tr bgcolor=E1A364><td align=center>Rekening<td align=center>Nama<td align=center>Jeniskelamin<td align=center>TTL<td align=center>Fakultas<td align=center>Jurusan
		<td align=center>Alamat<td align=center>Telp
<? 
mysql_connect("localhost","root","");
mysql_select_db("bank");
$sql ="select  tnasabah.Rekening,Nama,Jeniskelamin,TTL,Fakultas,Jurusan,Alamat,Telp  from tnasabah";
$hasil=mysql_query($sql);
$row=mysql_fetch_row($hasil);
do
{
list($Rekening,$Nama,$Jeniskelamin,$TTL,$Fakultas,$Jurusan,$Alamat,$Telp,)=$row;

echo "<tr><td align=center>$Rekening<td align=center>$Nama<td align=center>$Jeniskelamin
		<td align=center>$TTL<td align=center>$Fakultas<td align=center>$Jurusan<td align=center>$Alamat<td align=center>$Telp";


}
while ($row=mysql_fetch_row($hasil));
?>
</table>