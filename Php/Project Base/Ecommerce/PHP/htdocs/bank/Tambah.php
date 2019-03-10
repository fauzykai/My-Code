<form action="tambah_nas.php" methode=post>
<html>
<center>
<h1>
Masukan Data-data Nasabah :
<hr>
<table>
<tr><td>Rekening<td><input name=Rekening size=20> 
<tr><td>Nama<td><input name=Nama size=20> 
<tr><td>TTL<td><input name="TTL" size=30 >
<tr><td>Jenis Kelamin<td><input type=radio name=Jeniskelamin value="L">L &nbsp &nbsp
		    		   					 <input type=radio name=Jeniskelamin Value="P"> P </td>
<tr><td>Fakultas<td><select name= "Fakultas">
		<option>Teknik & Ilmu Komputer</option>
		<option>Ekonomi</option>
		<option>Hukum</option>
		<option>Desain</option>
		<option>Sastra</option>
		</select> 
<tr><td>Jurusan<td><select name= "Jurusan">
		<option>T. Informatika</option>
		<option>T. Komputer</option>
		<option>T. Elektro</option>
		<option>T. Sipil</option>
		<option>T.Arsitektur</option>
		<option>Akutansi</option>
		<option>Manajemen</option>
		<option>Ilmu hukum</option>
		<option>DKV</option>
		<option>Desain Interior</option>
		<option>S. Inggris</option>
		<option>S. Jepang</option>
		</select> 
<tr><td>Alamat<td><input name=Alamat size=20>
<tr><td>Telp<td><input name=Telp size=14>
</table>
<hr>
<input type=submit value=proses>
<input type=reset>


		