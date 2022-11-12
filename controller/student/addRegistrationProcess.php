<?php
    require_once "../../model/registrationModel.php";
    session_start();
    
    function process_input($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){

        $sesson=$_REQUEST['sesson'];
        $student_id=$_SESSION['id'];
        $subjects=$_SESSION['registation'];
        $registered_subjects=serialize($_SESSION['registation']);

        $request=[
            'student_id'=> $student_id,
            'registered_subjects'=> $registered_subjects,
            'sesson'=> $sesson
        ];

        if(sizeof($subjects)>0){
            if(addRegistration($request)){
                unset($_SESSION['registation']);
                echo "success";
             }
             else{
                 echo "*Something went wrong, try again!";
             }
        }
        else{
            echo "*Add Subjects";
        }

    }

?>
