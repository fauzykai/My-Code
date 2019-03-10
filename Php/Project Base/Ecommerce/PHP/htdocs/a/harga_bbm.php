<table>
<tr>
  <td colspan=4><b><center>MENAMPILKAN HARGA BBM</center></b></td>
</tr>
<tr>
  <td colspan=4>===========================================================</td>
</tr>
<tr>
  <td><center>LITER</center></td>
  <td><center>SOLAR</center></td>
  <td><center>PREMIUM</center></td>
  <td><center>PERTAMAX</center></td>
</tr>
<tr>
  <td colspan=4>===========================================================</td>
</tr>
<?
   //$solar = 4000;
   //$premium = 4500;
   //$pertamax = 9000;
   
   for($a=1;$a<=$loop;$a++)
   {
   	$hasil_solar = $a*$solar;
	$hasil_premium = $a*$premium;
	$hasil_pertamax = $a*$pertamax;
	   	
   	echo "<tr>";
   	echo "<td align=right>$a</td>";
   	echo "<td align=right>$hasil_solar</td>";
   	echo "<td align=right>$hasil_premium</td>";
   	echo "<td align=right>$hasil_pertamax</td>";
   	echo "</tr>";
   }
?>
</table>
