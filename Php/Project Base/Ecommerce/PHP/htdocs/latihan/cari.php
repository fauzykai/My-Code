 <html>
 <h2>
 <center>
Cari Data Mahasiswa
 </h2>
 <form method="post" action="cari.php">
 <hr>
<center>
 <table border=1>
 <tr><td>NIM Yang Akan Dicari : <td><input name=nim size=10>
 </table>
 <hr>
 <input type=submit value=Proses name=submit>
 <input type=reset>

<br><br>

 <table border=0>
 <?
if($submit)
{
 include "koneksi.php";
 if($nim=='')
 {
 echo "NIM Harus diisi";
 }

 if($nim!='')
 {
 $sql = "select * from mahasiswa where nim='$nim' ";
 $hasil= mysql_query($sql,$conn);
 $row=mysql_fetch_row($hasil);
if($row)
 {
 do
 {
 list($nim,$nama,$alamat,$kota,$telp)=$row;
 echo "<tr><td colspan=3 bgcolor=silver><center>Hasil Pencarian data";
 echo "<tr><td rowspan=6><center><img src='$nim.jpg' width=100
heght=150>";
 echo "<tr><td>NIM<td>$nim";
 echo "<tr><td>Nama<td>$nama";
 echo "<tr><td>Alamat<td>$alamat";
 echo "<tr><td>Kota<td>$kota";
 echo "<tr><td>Telepon<td>$telp";
 echo "<tr><td colspan=3 bgcolor=silver><hr>";
 }
 while ($row=mysql_fetch_row($hasil));
 }
 else
 {
 echo "Maaf data tidak ada";
 }
 mysql_close($conn);
 }
 }
 ?>
 </table>
