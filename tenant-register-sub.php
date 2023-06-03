<!DOCTYPE html>
<html>

<head>
	<title>Insert Page page</title>
</head>

<body>
	<center>
		<?php

		// servername => localhost
		// username => root
		// password => empty
		// database name => staff
		$conn = mysqli_connect("localhost", "nshrcukyhp", "wb4UgVV29R", "nshrcukyhp");
		
		// Check connection
		if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}
		
		// Taking all 5 values from the form data(input)
   $tenant_id = $_REQUEST['tenant_id'];
	$tenant_id=$_POST['tenant_id'];
	$full_name=$_REQUEST['full_name'];
	$email=$_REQUEST['email'];
	$password=$_REQUEST['password'];
	$phone_no=$_REQUESTST['phone_no'];
	$address=$_REQUEST['address'];
	$id_type=$_REQUEST['id_type'];
	$id_photo=$_REQUEST['id_photo'];
	$password = md5($password);

	if(!empty($_FILES['id_photo'])){
    $path = "tenant-photo/";
    $path=$path. basename($_FILES['id_photo']['name']);
        if(move_uploaded_file($_FILES['id_photo']['tmp_name'], $path))
        {
            echo"The file ". basename($_FILES['id_photo']['name']). " has been uploaded";
        }

        else{
            echo "There was an error uploading the file, please try again!";
        }
}
		
		// Performing insert query execution
		// here our table name is college
		$sql = "INSERT INTO tenant(full_name,email,password,phone_no,address,id_type,id_photo) VALUES ('$full_name','$email','$password','$phone_no','$address','$id_type','$path')";
		
		if(mysqli_query($conn, $sql)){
			header("location:tenant-login.php");
		} else{
			echo "ERROR: Hush! Sorry $sql. "
				. mysqli_error($conn);
		}
		
		// Close connection
		mysqli_close($conn);
		?>
	</center>
</body>

</html>
