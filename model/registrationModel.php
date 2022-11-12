<?php
	
	require_once('connection.php');

	function getAllRegistration(){
		$conn = getConnection();
		$sql = "select * from registration";
		$result = mysqli_query($conn, $sql);
		$requests =[];

		while($row = mysqli_fetch_assoc($result)){
			array_push($requests, $row); 
		}

		return $requests;
	}

	function getRegistrationById($id){

		$conn = getConnection();

		$sql = "select * from registration where id='{$id}'";
		$result = mysqli_query($conn, $sql);
		$row = mysqli_fetch_assoc($result);
		return $row;
	}

	function getSubjectById($id){

		$conn = getConnection();

		$sql = "select * from subjects where id='{$id}'";
		$result = mysqli_query($conn, $sql);
		$row = mysqli_fetch_assoc($result);
		return $row;
	}

	function getSubjectBySemester($semester){

		$conn = getConnection();

		$sql = "select * from subjects where semester='{$semester}'";
		$result = mysqli_query($conn, $sql);
		$subjects =[];

		while($row = mysqli_fetch_assoc($result)){
			array_push($subjects, $row); 
		}
		return $subjects;
	}

	function addRegistration($request){

		$conn = getConnection();
		$date=date("Y-m-d");
		$sql = "insert into registration values('','{$request['student_id']}','{$request['sesson']}','{$request['registered_subjects']}','','','','','','','','','','','{$date}')";
		
		if(mysqli_query($conn, $sql)){
			return true;
		}else{
			return false;
		}
	}

	function getSignature($id){
		$conn = getConnection();
		$sql = "select * from signatures where user_id ='{$id}'";
		$result = mysqli_query($conn, $sql);
		$row = mysqli_fetch_assoc($result);
		return $row;
	}

?>