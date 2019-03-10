<?
     echo "<center>";
     echo "<h3><b><font color=blue>MENGHITUNG TOTAL HARGA BELANJA BARANG</font></b></h3>";
     echo "<hr size=3 color=black><br>";
          
     //perhitungan makanan
     if($makanan == "Mie Goreng")
     {
     	$harga_mkn = 1100;
     }
     if ($makanan == "Roti Tawar")
     {
     	$harga_mkn = 15000;
     }
     if ($makanan == "Silver Quin")
     {
     	$harga_mkn = 9000;
     }
     
     //perhitungan minuman
     if($minuman == "Coca Cola")
     {
     	$harga_mnm = 3000;
     }
     if($minuman == "Fresh Tea")
     {
     	$harga_mnm = 5000;
     }
     if($minuman == "Sprite")
     {
     	$harga_mnm = 7000;
     }
     
     //perhitungan total jumlah
     $harga_total_mkn = $harga_mkn*$jumlah_makanan;
     $harga_total_mnm = $harga_mnm*$jumlah_minuman;
     
//     else 
//     	$harga = 0;
//     $total = $harga * $jumlah;
//     $potongan = $total * $disc;
//     $bayar = $total - $potongan;
     
     echo "<table border=1>";
     echo "<tr><td><b>NAMA BARANG</b></td><td><b>HARGA (Rp.)</b></td><td><b>JUMLAH</b></td><td><b>SUB TOTAL (Rp.)</b></td></tr>";
     echo "<tr><td>$makanan</td><td align=right>$harga_mkn</td><td align=center>$jumlah_makanan</td><td align=right>$harga_total_mkn</td></tr>";
     echo "<tr><td>$minuman</td><td align=right>$harga_mnm</td><td align=center>$jumlah_minuman</td><td align=right>$harga_total_mnm</td></tr>";
     
     //prosess checkbox
     if($ice_cream == "on")
     {
     	$harga_ice=3000;
     	$harga_total_ice=$harga_ice*$jumlah_ice;
     	echo "<tr><td>Ice Cream</td><td align=right>$harga_ice</td><td align=center>$jumlah_ice</td><td align=right>$harga_total_ice</td></tr>";
     }
     if($juice == "on")
     {
     	$harga_juice=6000;
     	$harga_total_juice=$harga_juice*$jumlah_juice;
     	echo "<tr><td>Juice Fruite</td><td align=right>$harga_juice</td><td align=center>$jumlah_juice</td><td align=right>$harga_total_juice</td></tr>";
     }
     if($tanggo == "on")
     {
     	$harga_tanggo=3500;
     	$harga_total_tanggo=$harga_tanggo*$jumlah_tanggo;
     	echo "<tr><td>Tanggo</td><td align=right>$harga_tanggo</td><td align=center>$jumlah_tanggo</td><td align=right>$harga_total_tanggo</td></tr>";
     }
     
     //perhitungan total harga
     $total_harga = $harga_total_mkn+$harga_total_mnm+$harga_total_ice+$harga_total_juice+$harga_total_tanggo;
     
     echo "<tr><td>TOTAL HARGA</td> <td ></td><td></td><td align=right>$total_harga</td></tr>";
     echo "</table>";
     echo "</center>";
?>