<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TUGAS PHP</title>
<meta name="keywords" content="Chrome Web Design, CSS, HTML, free template, piecemaker" />
<meta name="description" content="Chrome Web Design is a free website template integrated with PieceMaker 3D Flash Slider." />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>
    <script type="text/javascript">
      var flashvars = {};
      flashvars.cssSource = "css/piecemaker.css";
      flashvars.xmlSource = "piecemaker.xml";
		
      var params = {};
      params.play = "true";
      params.menu = "false";
      params.scale = "showall";
      params.wmode = "transparent";
      params.allowfullscreen = "true";
      params.allowscriptaccess = "always";
      params.allownetworking = "all";
	  
      swfobject.embedSWF('piecemaker.swf', 'piecemaker', '960', '500', '10', null, flashvars,    
      params, null);
    
    </script>

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title"><h1><a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a></h1></div>
        
        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
              	<li><a href="index.php" class="selected">Home</a></li>
          		<li><a href="about.php">Menu</a>
                    <ul>
                        <li><a href="login.php">Login</a></li>
                        <li><a href="reg.php">Register</a></li>
                        <li><a href="about1.php">About Us</a></li>
                  	</ul>
              	</li>
          		<li><a href="contact.php">Contact</a></li>
            </ul>
            <br style="clear: left" />
        </div> <!-- end of templatemo_menu -->
        
    </div> <!-- end of header -->

    <div id="templatemo_main">
      <form id="form1" name="form1" method="post" action="cek_login.php">
        <table width="248" border="0">
          <tr>
            <td height="68" colspan="3"><font face="bookantiqua"  size=6 color=#333333><b><center>Login</center></b></font></td>
          </tr>
          <tr>
            <td width="88">Username  :</td>
            <td colspan="2"><label for="id"></label>
            <input type="text" name="username" id="username" /></td>
          </tr>
          <tr>
            <td>Password &nbsp;:</td>
            <td colspan="2"><label for="pas"></label>
            <input type="password" name="password" id="password" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            <td width="122">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><input type="submit" name="submit" id="submit" value=" Masuk " /></td>
            <td><input type="reset" name="cancel" id="cancel" value=" Batal " /></td>
          </tr>
          <tr>
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3"><a href="reg.php">Belum punya akun? Klik Disini untuk daftar</a></td>
          </tr>
        </table>
      </form>
    </div>
    </div>
    
    <div class="cleaner"></div>

<div id="templatemo_footer_wrapper">
    <div id="templatemo_footer">
        Copyright © 2013| 
        Designed by <a href="http://www.templatemo.com" target="_parent">Fz</a>
      <div class="cleaner"></div>
    </div>
</div> 
  
</body>
</html>