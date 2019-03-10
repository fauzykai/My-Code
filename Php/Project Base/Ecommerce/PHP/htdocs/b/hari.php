<?php 
date_default_timezone_set('Asia/Jakarta');
//Menampilkan tanggal hari ini dalam bahasa Indonesia dan English
$namaHari = array("Ahad", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu","Minggu");
$namaBulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
$today = date('l, F j, Y');
$sekarang = $namaHari[date('N')] . ", " . date('j') . " " . $namaBulan[(date('n')-1)] . " " . date('Y');
echo $sekarang;
?>