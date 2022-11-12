<?php 
    require_once "../../model/registrationModel.php";
    require_once "../../model/userModel.php";
    require_once "../../model/studentDetailsModel.php";
    session_start();
    $conn=getConnection();

    if(isset($_REQUEST['detete_id'])){
        $id=$_REQUEST['detete_id'];
        $delete_sql="delete from users where id={$id}";
        $conn->query($delete_sql);
    }

    $id=$_REQUEST['id'];
    $registration=getRegistrationById($id);
    $registeredSubjects=unserialize($registration['registered_subjects']);
    $student=getUserById($registration['student_id']);
    $studentDetails=getStudentDetailsById($registration['student_id']);

?>


<div class="container-fluid d-flex justify-content-center">
    <div class="request-container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <img src="../img/logo.png" class="img-fluid">
            </div>
        </div>
        <div class="mb-1 mt-1">
            <h6 class="text-center">Qadirabad, Dayarampur, Natore-6431, Bangladesh</h6>
            <h4 class="text-center mt-3">Course Registration <?=$registration['sesson']?>, 2022</h4>
        </div>
        <div class="row mb-3">
            <div class="col-md-12 d-flex justify-content-end">
                <button class='btn btn-success mx-2' onclick='approveRegistration(<?=$id?>)'>Approve</button>
                <button class='btn btn-danger mx-2' onclick='declineRegistration(<?=$id?>)'>Decline</button>
            </div>
        </div>
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Name:</h6></div>
                        <div class="col-md-6"><p><?=$student['name']?></p></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>ID No:</h6></div>
                        <div class="col-md-6"><p><?=$student['id']?></p></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Department:</h6></div>
                        <div class="col-md-6"><p><?=strtoupper($studentDetails['department'])?></p></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Sesson:</h6></div>
                        <div class="col-md-6"><p><?=$registration['sesson']?></p></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Year:</h6></div>
                        <div class="col-md-6"><p><?=date("Y")?></p></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Semester:</h6></div>
                        <div class="col-md-6"><p><?=intval($studentDetails['semester'])+1?></p></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>Email:</h6></div>
                        <div class="col-md-6"><p><?=$student['email']?></p></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><h6>CGPA:</h6></div>
                        <div class="col-md-6"><p><?=$studentDetails['cgpa']?></p></div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="text-center">
                                <th scope="col">Sl No.</th>
                                <th scope="col">Course Code</th>
                                <th scope="col">Course Title</th>
                                <th scope="col">Credit</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            $c=1;
                            $totalCredit=0;
                            foreach ($registeredSubjects as $subject) {
                                $subjectDetails=getSubjectById($subject);

                                echo "<tr>
                                        <td>$c</td>
                                        <td>$subjectDetails[course_code]</td>
                                        <td>$subjectDetails[name]</td>
                                        <td>$subjectDetails[credit]</td>
                                    </tr>";
                                    $c++;
                                    $totalCredit=$totalCredit+ floatval($subjectDetails['credit']);
                            }
                        ?>
                        <tr>
                            <td colspan="3" class="text-center">Total Credit Hours:</td>
                            <td style="background-color: #150338; color: white;"><?=$totalCredit?></td>
                        </tr>
                            
                        </tbody>
                        </table>
                </div>
            </div>


            <div class="row mt-5">
                <div class="col-md-3 text-center mt-4 px-3">
                    <p class="mb-1"><?=$student['name']?></p>
                    <h6 class="signature">Student's Signature</h6>
                </div>
                <div class="col-md-3 text-center px-3">
                    <?php
                        if($registration['course_coOrdinator_approvedBy']!=''){
                            $signature=getSignature($registration['course_coOrdinator_approvedBy']);
                            echo "<img class='sig' src='../img/signatures/$signature[signature]'>";
                        }
                        else{
                            echo "<img class='sig' src='../img/white.PNG'>";
                        }
                    ?>
                    <h6 class="signature">Course Co-ordinator</h6>
                </div>
                <div class="col-md-3 text-center px-3">
                    <?php
                        if($registration['department_head_approvedBy']!=''){
                            $signature=getSignature($registration['department_head_approvedBy']);
                            echo "<img class='sig' src='../img/signatures/$signature[signature]'>";
                        }
                        else{
                            echo "<img class='sig' src='../img/white.PNG'>";
                        }
                    ?>
                    <h6 class="signature">Department Head</h6>
                </div>
                <div class="col-md-3 text-center px-3">
                    <?php
                        if($registration['registrar_approvedBy']!=''){
                            $signature=getSignature($registration['registrar_approvedBy']);
                            echo "<img class='sig' src='../img/signatures/$signature[signature]'>";
                        }
                        else{
                            echo "<img class='sig' src='../img/white.PNG'>";
                        }
                    ?>
                    <h6 class="signature">Registrar</h6>
                </div>
            </div>
        </div>

        <!-- clearence -->

        <br><br><br>
        <div class="container-fluid mt-3">
            <div class="title">Clearence</div>

            <div class="row mt-2">
                <div class="col-md-6">
                    <div class="row mt-4 mb-2">
                        <div class="col-md-12">
                            <h5>Hall Provost:</h5>
                            <p>All due in hall is clear.</p>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-5 text-center">
                            <?php
                                if($registration['hall_provost_approvedBy']!=''){
                                    $signature=getSignature($registration['hall_provost_approvedBy']);
                                    echo "<img class='sig' src='../img/signatures/$signature[signature]'>";
                                }
                                else{
                                    echo "<img class='sig' src='../img/white.PNG'>";
                                }
                            ?>
                            <h6 class="signature">Hall Provost</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row mt-4 mb-2">
                        <div class="col-md-12">
                            <h5>Finace Department:</h5>
                            <p>All finace is clear.</p>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-5 text-center">
                            <?php
                                if($registration['finace_department_approvedBy']!=''){
                                    $signature=getSignature($registration['finace_department_approvedBy']);
                                    echo "<img class='sig' src='../img/signatures/$signature[signature]'>";
                                }
                                else{
                                    echo "<img class='sig' src='../img/white.PNG'>";
                                }
                            ?>
                            <h6 class="signature">Finace Department</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
