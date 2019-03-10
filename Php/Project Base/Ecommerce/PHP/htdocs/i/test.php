<? 
mysql_connect("localhost","root","");
mysql_select_db("bank");
$sql ="select sum(Saldo) as total from trek";
$hasil=mysql_query($sql);
$row=mysql_fetch_row($hasil);

do
list($Saldo)=$row;

echo " $Saldo";

?>
