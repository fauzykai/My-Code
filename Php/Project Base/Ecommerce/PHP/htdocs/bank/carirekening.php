<?
echo "<center>";
echo "<h1>Hasil Pencarian No.Rekening</h1>";
echo "<table border=1>";
mysql_connect("localhost","root","");
mysql_select_db("bank");
$sql = "select  tnasabah.Rekening, trek.simpan, trek.Ambil, trek.Saldo,tnasabah.nama from tnasabah, trek
where tnasabah.rekening = trek.rekening and trek.rekening = $Rek";
$hasil = mysql_query($sql);
//echo "<tr><td>$hasil</td></tr>";
$row = mysql_fetch_row($hasil);
$nomor = 1;

list($Rekening,$Simpan,$Ambil,$Saldo,$Nama,)=$row;
   $Total = "select sum(Saldo)";
   echo "<tr><td colspan = 5 align=left>Nama Nasabah : $Nama</td></tr>";
     echo "<tr><td colspan = 5 align=left>Total Saldo : $Total</td></tr>";
   echo "<tr><td>No</td><td>Rekening</td><td>Simpan</td><td>Ambil</td><td>Saldo</td></tr>";
   
do
{
   list($Rekening,$Simpan,$Ambil,$Saldo,$T)=$row;
   echo "<tr><td>$nomor</td><td>$Rekening</td><td>$Simpan</td><td>$Ambil</td><td>$Saldo</td><td>$T</td></tr>";
 $nomor++;
}while ($row=mysql_fetch_row($hasil));
echo "</table>";
?>