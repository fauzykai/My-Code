<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TUGAS PHP</title>
<meta name="keywords" content="Chrome, Contact, Web Design, CSS, HTML, free template" />
<meta name="description" content="Contact Chrome Web - free HTML CSS template from templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

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
              	<li><a href="index.php">Home</a></li>
          		<li><a href="about.php">Menu</a>
                    <ul>
                        <li><a href="login.php">Login</a></li>
                        <li><a href="reg.php">Register</a></li>
                        <li><a href="about1.php">About Us</a></li>
                  	</ul>
              	</li>
          		<li>
          		  <ul>
                    <li><a href="http://www.templatemo.com/page/1">Web Design</a></li>
                        <li><a href="http://www.templatemo.com/page/2">Multimedia</a></li>
                        <li><a href="http://www.templatemo.com/page/3">3D Animations</a></li>
                        <li><a href="http://www.templatemo.com/page/4">Templates</a></li>
                  	</ul>
              	</li>
          		<li><a href="contact.php" class="selected">Contact</a></li>
            </ul>
            <br style="clear: left" />
        </div> <!-- end of templatemo_menu -->
        
    </div> <!-- end of header -->
    
    <div id="templatemo_main">
    	<h2>Hubungi Kami</h2>
        <div class="col_w630 float_l">
        	
             <div id="contact_form">
        
                <h4>Sampaikan Pesan anda disini.</h4>
                
                <form method="post" name="contact" action="#">
                    <input type="hidden" name="post" value="Send" />
                    <label for="author">Nama:</label> <input type="text" id="author" name="author" class="input_field" />
                    <div class="cleaner h10"></div>
                    
                    <label for="email">Email:</label> <input type="text" id="email" name="email" class="validate-email input_field" />
                    <div class="cleaner h10"></div>
                    
                    <label for="text">Pesan:</label> <textarea id="text" name="text" rows="0" cols="0"></textarea>
                    <div class="cleaner h10"></div>
                    
                    <input type="submit" class="submit_btn float_l" name="submit" id="submit" value="Send" />
                    <input type="reset" class="submit_btn float_r" name="reset" id="reset" value="Reset" />
                
                </form>
        
            </div> 
        </div>
        
        <div class="col_w300 float_r">
            <div class="col_fw">	
            <h4>ALAMAT KAMI :</h4>
                <h6> Web Design Studio</h6>
                JL.tubagus ismail dalam No.46, bandung - jawa barat, Indonesia.<br />
            </div>            
            <div class="col_fw_last">
                <h4>Tempat Kami :</h4>
                <div id="map"><a class="pirobox" href="images/map_big.jpg" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit."><img src="images/map_thumb.jpg" alt="Image" /></a></div>                
            </div>
        </div>
	    <div class="cleaner"></div>
    </div> <!-- end of main -->
</div>

<div id="templatemo_footer_wrapper">
    <div id="templatemo_footer">
        Copyright © 2013| 
        Designed by <a href="http://www.templatemo.com" target="_parent">Fz</a>
        <div class="cleaner"></div>
    </div>
</div> 
  
</body>
</html>