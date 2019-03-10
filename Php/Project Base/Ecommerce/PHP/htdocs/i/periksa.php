<?php
session_start();
#**************** koneksi ke mysql *****************#
$host = "hostname";
$user = "db_user";
$pass = "db_password";
$dbname ="db_name";
$conn = mysql_connect($host,$user,$pass);
if($conn) {
//select database
$sele = mysql_select_db($dbname);
if(!$sele) {
echo mysql_error();
}
}
#***************** akhir koneksi ******************#
#jika ditekan tombol login
if(isset($_POST['login'])) {
$username = $_POST['username'];
$password = $_POST['password'];
$sql = mysql_query("SELECT * FROM tb_user WHERE username='$username' &&
password='$password'");
$num = mysql_num_rows($sql);
if($num==1) {
// login benar //
$_SESSION['user'] = $username;
$_SESSION['passwd'] = $password;
?><script language="JavaScript">alert('Selamat, Login Anda Sukses!!');
document.location='file/admin.php'</script><?
} else {
// jika login salah //
echo "<script>
eval(\"parent.location='index.php '\");
alert (' Maaf Login Gagal, Silahkan Isi Username dan Password Anda Dengan Benar');
</script>";
//include("login.php");
}
}
?>
