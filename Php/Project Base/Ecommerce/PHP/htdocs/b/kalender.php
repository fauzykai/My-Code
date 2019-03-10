<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>K A L E N D E R</title>
</head>

<body>
<? class kalender{
    public static function tampil($bln='', $th=''){
        $bln=is_int($bln) ? $bln : date('m');
        $th=is_int($th) ? $th : date('Y');
       
        $time=mktime(0,0,0, $bln, 1, $th);
        $days=date('t', $time);
       
        ?>

<table  border="1" cellspacing="3" cellpadding="5">
  <tr>
    <td colspan="7" align="center" bgcolor="#999999"><b>
    <? echo strftime('%B %Y', $time);?></b>
    </td>
  </tr>
  <tr>
    <th bgcolor="#CCCCCC">M</th>
    <th bgcolor="#CCCCCC">S</th>
    <th bgcolor="#CCCCCC">S</th>
    <th bgcolor="#CCCCCC">R</th>
    <th bgcolor="#CCCCCC">K</th>
    <th bgcolor="#CCCCCC">J</th>
    <th bgcolor="#CCCCCC">S</th>
    <?
    for ($i=0;$i<6;$i++){
        echo'<tr bgcolor="#999999" align="center">';
        for ($j=1;$j<=7;$j++){
         $d=$j + $i*7 - date('w',$time);
        echo'<td';
    if($d>0 && $d<=$days){
        echo($d==date('d') && $bln==date('m') && $th==date('Y'))? ' style="background: #FFFF33;">' : '>';
    echo $d;
    }else{
        print'>';
        print ' </td>';
    }
    }
 echo'</tr>';
 if ($d>=$days && $i !=6){
     break;
 }
    }
    ?>
</table>
<?
}
}
kalender::tampil();
?>

</body>
</html>