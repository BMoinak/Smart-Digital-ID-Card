<?php 
// connect to database
	$db1 = mysqli_connect('localhost', 'id4765542_moinak123', 'nopass', 'id4765542_minor');
	
			// Retrive Products
			if(isset($_GET["studentid"]))
			{
				$studentid=$_GET["studentid"];

				get_datas($studentid);
			}
		




function get_datas($studentid)
	{
		global $db1;

		$query = "SELECT * from slots where student_id = '$studentid'";
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






			/*
			{
			$stud= $_GET['studentid'];	
			$query = "SELECT * from slots where student_id = '$stud'";
			$result = mysqli_query($db1, $query);
			$note="|";
			while ($row = $result->fetch_assoc()) {
				
				$note.=$row['slot'];
				$note.=": ";
				$note.=$row['notification'];
				$note.="|";
			//echo json_encode($row['slot']);
			//header('location: post.php');
		}
		echo $note;
		$_GET['note']=$note;
		}*/
?>
