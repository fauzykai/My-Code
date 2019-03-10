<html>
 <center>
 <h3>
 Menampilkan Data
 <hr>
 <table border=1>
 <tr
bgcolor=silver><td>NIM<td>NAMA<td>ALAMAT<td>KOTA<td>TELP<td>PHOTO
 <?
 include "koneksi.php";
 $sql = "select * from mahasiswa order by nim";
 $hasil= mysql_query($sql,$conn);
 $row=mysql_fetch_row($hasil);
 do
 {
 list($nim,$nama,$alamat,$kota,$telp)=$row;
 echo "<tr><td>$nim<td>$nama<td>$alamat<td>$kota<td>$telp<td><img src='$nim.jpg' width=100 height=100>";
 }
 while ($row=mysql_fetch_row($hasil));
 ?>
 </table>
 <hr>