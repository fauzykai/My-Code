<html>
<head>
<title>Form Login User System</title>
<style type="text/css">
<!--
table {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 14px;
}
input,select,textarea {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 14px;
background-color:#CCCCCC;
color:#000000;
border:'border-width' 'border-style' 'color';
padding:2;
}
.style1 {color: #0000FF}
 
-->
</style>
</head>
<body background="gambar/bg_login.png">
<h3 align="center"> LOGIN USER SYSTEM </h3>
<div align="center">
<form id="login" method="post" name="login" action="periksa.php">
<table width="286" border="0" cellpadding="2" cellspacing="2">
<!--DWLayoutTable-->
<tr bgcolor="#FF0000">
<td height="19" colspan="2" align="center" valign="middle">
<strong><font color="#FFFFFF"><blink>LOGIN DI SINI</blink></font></strong></td>
</tr>
<tr>
<td width="106" height="17">&nbsp;</td>
<td width="180">&nbsp;</td>
</tr>
<tr>
<td height="18" align="right" valign="middle"><div align="left">Username</div></td>
<td valign="middle">
<input name="username" type="text" id="username" size="20"></td>
</tr>
<tr>
<td height="18" align="right" valign="middle"><div align="left">Password</div></td>
<td valign="middle"><input name="password" type="password" id="password" size="20" /></td>
</tr>
<tr>
<td height="18" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
<td valign="middle">
<input name="login" type="submit" id="login" value=" Login ">
<input type="reset" name="Reset" value="Batal / Clear" /></td>
</tr>
<tr bgcolor="#FF0000">
<td height="18" colspan="2" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
</tr>
</table>
</form>
</div>
</body>
</html>