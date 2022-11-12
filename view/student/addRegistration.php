<?php 
    require_once "../../model/registrationModel.php";
    session_start();
    if (!isset($_SESSION['registation'])) {
      $_SESSION['registation']=[];
    }
    $registeredSubjects=$_SESSION['registation'];
    $conn=getConnection();
    $semester=$_REQUEST['semester'];
    $subjects=getSubjectBySemester($semester);

?>

<div class="container-fluid bg-light">
  <div class="row">
    <div class="col-md-7 p-4">
          <div class="container-fluid">
        <div class="title mb-2">Registration</div>
        <span id="msg"></span>
          
        <div class="content">
          <form method="post" id="addRegistration" onsubmit="return addRegistrationProcess();" enctype="multipart/form-data">

          <div class="row mb-3">
              <div class="col-md-6">
                  <label for="semester" class="form-label">Select Semester</label>
                  <select name="semester" id="semester" class="form-select" onchange="changeSemester()">
                    <?php
                        for ($i=1; $i < 9; $i++) { 
                          if($semester == $i){
                            $selected='selected';
                          }
                          else{
                            $selected='';
                          }
                          echo "<option value='$i' $selected>$i</option>";
                        }
                    ?>
                  </select>
              </div>
              <div class="col-md-6">
                  <label for="sesson" class="form-label">Select Sesson</label>
                  <select name="sesson" id="sesson" class="form-select" onchange="changeSesson()">
                    <option value='Fall' 
                      <?php
                        if(isset($_SESSION['sesson'])){
                          if($_SESSION['sesson']=='Fall'){
                            echo 'selected';
                          }
                        }

                      ?>
                    >Fall</option>
                    <option value='Summer'
                      <?php
                          if(isset($_SESSION['sesson'])){
                            if($_SESSION['sesson']=='Summer'){
                              echo 'selected';
                            }
                          }

                        ?>
                    >Summer</option>
                  </select>
              </div>
          </div>

          <?php
              foreach ($subjects as $subject) {
                $id=$subject['id'];
                if(in_array($id, $registeredSubjects)){
                    $isSelected='checked';
                }
                else{
                  $isSelected='';
                }
                
                $name=$subject['name'];
                $slug=str_replace(' ','_',$name);
                $slug=strtolower($slug);
                echo "<div class='row mb-3'>
                          <div class='col-md-12'>
                            <input class='form-check-input' type='checkbox' value='$slug' id='$slug' onchange=addSubject($id) $isSelected>
                            <label class='form-check-label' for='$slug'>$name ($subject[credit])</label>
                          </div>
                      </div>";
              }

          ?>

          

            <div class="button pb-3 mt-4">
              <input type="submit" value="Submit" class="btn btn-primary form-control btn-bg-color">
            </div>

          </form>
        </div>
      </div>
    </div>
    <div class="col-md-5 p-4">
        <h4 class="mb-3">Registered Subjects</h4>

        <?php
            foreach ($registeredSubjects as $subject) {
              $subjectDetails=getSubjectById($subject);
              $id=$subjectDetails['id'];
              $name=$subjectDetails['name'];
              $credit=$subjectDetails['credit'];
              echo "<p class='mb-3'>$name ($credit) <span class='cursor' onclick=removeSubject($id)><i class='fa-solid fa-xmark text-danger'></i></span></p>";
            }
        ?>
          
    </div>
  </div>
</div>
