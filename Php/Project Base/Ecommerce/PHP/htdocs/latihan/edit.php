<html>
 <h2>
 <center>
Form Edit Data </h2>
 <form methodE="post" action="edit.php">
<hr>
 <center>
 <table border=1>
 <tr><td>NIM Yang Akan Dicari : <td><input name=nim size=10>
</table>
 <hr>
 <input type=submit value=Proses name=editaja>
<input type=reset>
 <br><br>


 <table border=1>
 <?
 include "koneksi.php";

 if($editaja)
 {
 if($nim=='')
 {
 echo "NIM Harus diisi";
 exit;
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
 echo "<tr><td colspan=2 bgcolor=silver><center>Data Yang Akan di Edit";
 echo "<tr><td>NIM<td>$nim";
 echo "<tr><td>Nama <td><input name='nama1' value='$nama'>";
 echo "<tr><td>Alamat <td><input name='alamat1' value='$alamat'>";
 echo "<tr><td>Kota <td><input name='kota1' value='$kota'>";
 echo "<tr><td>Telepon <td><input name='telp1' value='$telp'>";
 echo "<input type=hidden name='nim' value='$nim'>";
 }
 while ($row=mysql_fetch_row($hasil));
 }
 else
 {
 echo "Maaf data tidak ada";
 exit;
 }
 mysql_close($conn);
 }
echo "</table><hr>
 <input type=submit value=Save name=prosesedit>
 <input type=submit value=Hapus name=proseshapus>";
 }
 
 
 //Edit Data
 if($prosesedit)
 {
 if($nim=='')
 {
 echo "NIM Harus diisi";
 }
 else
 {
 mysql_query("update mahasiswa set
nama='$nama1',alamat='$alamat1',kota='$kota1',telp='$telp1' where
nim='$nim' ");
 mysql_close($conn);
 echo "<br><br>Data berhasil diupdate";
 }
 }

 //Hapus Data
 if($proseshapus)
 {
 if($nim=='')
{
 echo "NIM Harus diisi";
 }

 else
 {
 mysql_query("delete from mahasiswa where nim='$nim' ");
 mysql_close($conn);
 echo "<h3><center>
 **********************************<br>
 Hapus Berhasil di hapus<br>
 **********************************";
 }
 }
 ?>
