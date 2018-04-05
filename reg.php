<?php 
// connect to database
	$db1 = mysqli_connect('localhost', 'id4765542_moinak123', 'nopass', 'id4765542_minor');
	
			// Retrive Products
			if(isset($_GET["studentid"]))
			{
				$studid=$_GET["studentid"];

				get_datas($studid);
			}
		




function get_datas($studid)
	{
		global $db1;

		$query = "SELECT stud_name from studentdata where studentid = '$studid'";
		$response=array();
		$result=mysqli_query($db1, $query);
		while($row=mysqli_fetch_assoc($result))
		{
			$response[]=$row;
			
		}
		//header('Content-Type: application/json');
		header('Content-Type: application/json; charset=utf-8', true,200);
		echo json_encode($response);
	}



?>
