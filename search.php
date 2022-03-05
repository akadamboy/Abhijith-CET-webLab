<?php require('admin_session.php'); 
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Admin Search Books :: Library Administration</title>
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
<!-- Validation -->
<script src="../assets/js/validator.min.js"></script>
<script src="../assets/js/bootbox.min.js"></script><script>
$(document).ready(function () {
	
	$("#tblbook").dataTable(); //for data table
	
	$("#book").keyup(function(){
		var book = $("#book").val();
		if(book.length > 2){	
			$("#result").html('<img src="../assets/images/loading.gif">');
			$.ajax({
				type : 'POST',
				url  : 'displaybook.php',
				data : 'book='+$("#book").val(),
				success : function(data)
						  {
					         $("#bookrslt").html(data);
							 	$("#result").html('');
					      }
			});
			return false;
		}
		else{
			$("#bookfg").addClass('has-error');
			$("#result").html('<span style=\'color:red;\'>Please type minimum of 3 characters to search.</span>');
		}
	});

});
</script>
<!-- //Validation -->
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
    	<div class="blankpage-main">
						<h4>Search Books</h4><br>
						<div class="alert alert-warning hidden">
							<span></span>
							<button type="button" class="close" onclick="$('.alert').addClass('hidden');">&times;</button>
						</div>		
									<form class="form form-horizontal" id="search" data-toggle="validator" method="post">
										<div class="form-group" id="bookfg">
											<label for="book" class="col-sm-3 control-label">Name of Book</label>
											<div class="col-sm-8">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-book"></i>
													</span>
													<input type="text" class="form-control1" placeholder="Name of Book" id="book" name="book" required>
												</div><span id="result"></span>
											</div>
										</div>
									</form>	
			<div id="bookrslt"></div>
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