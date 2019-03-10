<?
     echo "<center>";
     echo "<h3><b><font color=blue>MENGHITUNG TOTAL HARGA BARANG</font></b></h3>";
     echo "<hr size=3 color=black><br>";
     echo "<table>";
     echo "<tr><td>NAMA PEMBELI</td> <td colspan=2>$nama</td></tr>";
     echo "<tr><td>Merk HANDPHONE</td> <td colspan=2>$merk</td></tr>";
     echo "<tr><td>JUMLAH BARANG</td> <td colspan=2>$jumlah</td></tr>";
     
     //perhitungan
     if($merk == "Nokia")
     {
     	$harga = 1200000;
     	$diskon = "10%";
     	$disc = 10 / 100;	
     }
     else if ($merk == "Siemens")
     {
     	$harga = 1000000;
     	$diskon = "15%";
     	$disc = 15 / 100;
     }
     else if ($merk == "Samsung")
     {
     	$harga = 1100000;
     	$diskon = "20%";
     	$disc = 20 / 100;
     }
     else 
     	$harga = 0;
     $total = $harga * $jumlah;
     $potongan = $total * $disc;
     $bayar = $total - $potongan;
          
     echo "<tr><td>HARGA SATUAN</td> <td>Rp.</td> <td align=right>$harga</td></tr>";
     echo "<tr><td>HARGA TOTAL</td> <td>Rp.</td> <td align=right>$total</td></tr>";
     echo "<tr><td>Diskon Pembelian Barang</td> <td>Rp.</td> <td align=right>$potongan</td></tr>";
     echo "<tr><td>TOTAL HARGA YANG HARUS DI BAYAR</td> <td>Rp.</td> <td align=right>$bayar</td></tr>";
     echo "</table>";
     echo "</center>";
?>