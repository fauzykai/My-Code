<table border=1>
<tr><td>NIK<td>NAMA<td>BAGIAN<td>PENDIDIKAN<td>ALAMAT
<? 
mysql_connect("localhost","root","");
mysql_select_db("te2");
$sql ="select  pegawai.nik,nama,pedidikan from pegawai,pedidikan where pegawai.nik=pedidikan.nik";
$hasil=mysql_query($sql);
$row=mysql_fetch_row($hasil);
do
{
list($nip,$nama,$gajipokok,$jenjang,$tunjangan)=$row;
$total=$gajipokok+$tunjangan;
echo "<tr><td>$nip<td>$nama<td>$gajipokok<td>$jenjang<td>$tunjangan<td>$total";


}
while ($row=mysql_fetch_row($hasil));
?>
</table>