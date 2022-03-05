<?php require('admin_session.php');
require('../assets/include/config.php');
$con = connectTo();

// code for suspend users    
if(isset($_GET['sid']))
{
$uid = $_GET['.']; // id of user to be suspended
mysqli_query($con, "UPDATE `user` SET `status` = '0' WHERE `uid` = '$uid'") or die("database error:". mysqli_error($con));
header('location:user.php');
}
// code for Activate users    
if(isset($_GET['aid']))
{
$uid = $_GET['aid']; // id of user to be activated
mysqli_query($con, "UPDATE `user` SET `status` = '1' WHERE `uid` = '$uid'") or die("database error:". mysqli_error($con));
header('location:user.php');
}
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Admin View Users :: Library Administration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="../assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="../assets/css/style.css" rel="stylesheet" type="text/css" media="all"/>
 <!-- js-->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootbox.min.js"></script>
<script>
$(document).ready(function () {
	$("#tbluser").dataTable(); //for data table

	$('.remove_user').click(function(e){
	   e.preventDefault();   
	   var uid = $(this).attr('uid');
	   var parent = $(this).parent("td").parent("tr");   
	   bootbox.dialog({
			backdrop: false,
			message: "Are you sure you want to Remove this User?",
			title: "<i class='glyphicon glyphicon-remove-sign'></i> Remove User!",
			buttons: {
				success: {
					  label: "No",
					  className: "btn-success",
					  callback: function() {
					  $('.bootbox').modal('hide');
				  }
				},
				danger: {
				  label: "Remove!",
				  className: "btn-danger",
				  callback: function() {
				   $.ajax({        
						type: 'POST',
						url: 'process_removeusr.php',
						data: 'uid='+uid
				   })
				   .done(function(response){    
						bootbox.alert({message: response, backdrop: false});
						parent.fadeOut('slow');
						//window.location="";
				   })
				   .fail(function(){        
						bootbox.alert({message: "Error...", backdrop: false});               
				   })              
				  }
				}
			}
	   });   
	});
});
</script>
    <!-- DATATABLE STYLE  -->
    <link href="../assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- DATATABLE SCRIPTS  -->
    <script src="../assets/plugins/datatables/jquery.dataTables.js"></script>
    <script src="../assets/plugins/datatables/dataTables.bootstrap.js"></script>
<!--icons-css-->
<link href="../assets/css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
</head>
<body>	
<div class="page-container">
   <div class="left-content">
	   <div class="mother-grid-inner">
<?php require('admin_header.php'); ?>
<!--inner block start here-->
<div class="inner-block">
<!--main page chart start here-->
<div class="main-page">
    <div class="blank">
    	<h2>Users List</h2>
    	<div class="blankpage-main">	
						<div class="table table-responsive">
						<h4>New User Details Table:</h4><br>
							<table class="table table-hover" id="tbluser">
							<thead> <tr> <th>S.No</th> <th>Name</th> <th>Username</th> <th>LBID</th> <th>Email</th> <th>Mobile No.</th><th>Registered On</th> <th>Status</th> <th>Action</th> <th>Delete?</th></tr> </thead>
							<tbody> 
						

<?php 
//taking data from database
        $query = "SELECT * FROM `user` WHERE `username` != 'admin' ORDER BY `name`";
		$result = mysqli_query($con,$query) or die(mysqli_error($con));
		$c=1;
		while($obj=mysqli_fetch_object($result))
		{	
			 echo "<tr> <td>$c</td>
                        <td>$obj->name</td>
                        <td>$obj->username</td>
                        <td>$obj->rfid</td>
                        <td>$obj->email</td>
                        <td>$obj->mobile</td>
                        <td>$obj->rgon</td>";
			if($obj->status == 1)
			{ echo "<td>Active</td>
					<td><a href=\"user.php?sid=$obj->uid\" onclick=\"return confirm('Are you sure you want to Suspend this User?');\"><button class=\"btn btn-danger\">Suspend</button></a></td>";}
			else
			{ echo "<td>Suspended</td>
					<td><a href=\"user.php?aid=$obj->uid\" onclick=\"return confirm('Are you sure you want to Activate this User?');\"><button class=\"btn btn-primary\">Activate</button></a></td>";}
			
                   echo "<td><a class=\"remove_user\" uid=\"$obj->uid\" href=\"javascript:void(0)\">
						<i class=\"glyphicon glyphicon-trash\"></i></a></td></tr>";
			$c++;
		}
?>
							 </tbody> </table>
						</div>
    	</div>
    </div>
</div>
</div><!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
<p>© LIBRARY AUTOMATION | Developed by  <a href="" target="_blank">Group 1</a> </p>
</div>	
<!--COPY rights end here-->
</div>
</div>
	<div class="clearfix"> </div>
</div>
<!--scrolling js-->
		<script src="../assets/js/jquery.nicescroll.js"></script>
		<script src="../assets/js/scripts.js"></script>
		<!--//scrolling js-->
<script src="../assets/js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>                     