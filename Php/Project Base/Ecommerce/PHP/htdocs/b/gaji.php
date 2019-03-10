
<?
$harga=0;
echo "<center><h1>PT .JEMBATAN LIMA <br>";
echo "<HR>";
echo "<table>";


if(($bagain=="manager")&& ($golongan=="A"))$gaji=5000000;
if(($bagian=="manager")&& ($golongan=="B"))$gaji=6000000;
if(($bagain=="manager")&& ($golongan=="C"))$gaji=7000000;
if(($bagain=="HRD")&& ($golongan=="A"))$gaji=2000000;
if(($bagain=="HRD")&& ($golongan=="B"))$gaji=2500000;
if(($bagain=="HRD")&& ($golongan=="C"))$gaji=3000000;
if(($bagain=="karyawan")&& ($golongan=="A"))$gaji=15000000;
if(($bagain=="karyawan")&& ($golongan=="B"))$gaji=20000000;
if(($bagain=="karyawan")&& ($golongan=="C"))$gaji=25000000;
if ($jmlh >=2)
($ta=0.15*$gaji*2);
if ($jmlh < 2)
($ta=0.15*$gaji*$jmlh);
$lk=2012-$thn;
$tk=(0.1*$gaji)*$lk;
$total=$gaji+$tk+$ta;


echo "<tr><td>GAJI POKOK         <td>Rp</td><td align=right> $gaji<br>";
echo "<tr><td>LAMA KERJA       <td>Rp</td><td align=right> $lk<br>";
echo "<tr><td>Tunjangan kerja            <td>Rp</td><td align=right> $tk <br>";
echo "<tr><td>Tunjangan anak           <td>Rp</td><td align=right> $ta <br>";
echo "<tr><td>Total          <td>Rp</td><td align=right> $total <br>";
?>