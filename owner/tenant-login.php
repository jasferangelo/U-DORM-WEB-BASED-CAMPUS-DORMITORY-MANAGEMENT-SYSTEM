<?php 
session_start();
if(!empty($_GET["id"])){
  header("location:index.php");
}

include("navbar.php");


 ?>

     <div align = "center" class="container">
         <div align = "left">
              <h3 style="font-weight: bold; text-align: center;">Tenant Login</h3><hr><br><br>
				
            <div style = "margin:30px">
               
               <form action = "tenant-engine.php" method = "post">
                   <div class="form-group">
                  <label>UserName  :</label><input class="form-control" type = "text" name = "username" class = "box"/>
                  </div>
                  <div class="form-group">
                  <label>Password  :</label><input class="form-control" type = "password" name = "password" class = "box" /><br/><br />
                  <input class="btn btn-primary btn-block" type = "submit" value = " Submit "/>
                  <div>
               </form>
               
               <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
                 <a href="forgot-password-owner.php">Lost your Password ? </a>
					
            </div>
				
         </div>
			
      </div>