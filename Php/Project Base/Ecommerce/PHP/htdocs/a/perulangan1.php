<?
   echo "<table border=1>";
   echo "<tr><td>";
   for ($a=1; $a<=10; $a++)
      echo "$a X 1 = $a<br>";
   echo "</td>";
   echo "<td>";
   for ($a=1; $a<=10; $a++)
   {
      $b = $a*2;
      echo "$a X 2 = $b<br>";
   }
   echo "</td>";
   echo "<td>";
   for ($a=1; $a<=10; $a++)
   {
      $b = $a*3;
      echo "$a X 3 = $b<br>";
   }
   echo "</td></tr>";
   echo "</table>";
?>