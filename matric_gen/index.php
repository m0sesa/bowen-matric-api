<?php
header("Content-Type: application/json");

require "./func.php";

/**
 * 1. Check if is fresh student matric generation
 *  a) Search using form_number and email
 *      i) if exists return matric number
 *      ii) if not exist, insert new matric number ans return it
 *  2. if it is not fresh student
 *  a) search db using form_id (the former matric number)
 *      i) if exist set active = 0
 *          -> insert new matric and return it
 *      ii) if not exist return error
 *  
 */

/*
Status Codes:
    1: Success
    2: Validation Error
    3: Action performed already
    4: Unkown Error
    5: Invalid request
*/

$required = array('formNumber', 'email', 'college', 'programme', 'session', 'level', 'isFreshStudent', 'firstName', 'lastName');

if (!(count(array_intersect_key(array_flip($required), $_POST)) === count($required))) {
    echo jsonResponse(5, true, "Invalid REQUEST", null);
    die();
}

// all required fields received
$formNumber = htmlspecialchars(stripslashes(trim($_POST['formNumber'])));
$session = htmlspecialchars(stripslashes(trim($_POST['session'])));
$college = htmlspecialchars(stripslashes(trim($_POST['college'])));
$email = htmlspecialchars(stripslashes(trim($_POST['email'])));
$programme = htmlspecialchars(stripslashes(trim($_POST['programme'])));
$level = htmlspecialchars(stripslashes(trim($_POST['level'])));
$firstName = htmlspecialchars(stripslashes(trim($_POST['firstName'])));
$lastName = htmlspecialchars(stripslashes(trim($_POST['lastName'])));

$ip = $_SERVER['REMOTE_ADDR'];
$req = json_encode($_POST);

if (!validateLevel($level)) {
    $res = jsonResponse(2, true, "Invalid Level", null);
    echo $res;
    logAction($ip, $req, $res, null, 1);
    die();
}

if (!validateSession($session)) {
    $res = jsonResponse(2, true, "Invalid Session", null);
    echo $res;
    logAction($ip, $req, $res , null, 1);
    die();
}

if (!validateProgramme($programme)) {
    $res = jsonResponse(2, true, "Invalid Programme", null);
    echo $res;
    logAction($ip, $req, $res , null, 1);
    die();
}

if (!validateCollege($college)) {
    $res = jsonResponse(2, true, "Invalid College", null);
    echo $res;
    logAction($ip, $req, $res , null, 1);
    die();
}

if (empty($firstName)){
    $res = jsonResponse(2, true, "Firstname can not be empty", null);
    echo $res;
    logAction($ip, $req, $res , null, 1);
    die();
}

if (empty($lastName)){
    $res = jsonResponse(2, true, "Lastname can not be empty", null);
    echo $res;
    logAction($ip, $req, $res , null, 1);
    die();
}

if ((int)htmlspecialchars(stripslashes(trim($_POST['isFreshStudent']))) === 1) {
    if (!validateFormNumber($formNumber)) {
        $res = jsonResponse(2, true, "Invalid Form Number format", null);
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }

    $student = searchFreshStudent($formNumber, $session);
    if (isset($student) && count($student) > 0) {
        $res = jsonResponse(3, true, "Student already have a matric number", studentResponse($student[0]));
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }

    $insert = insertNewMatric($formNumber, $email, $college, $programme, $session, $level, $firstName, $lastName);
    if ($insert['affected_rows'] == -1) {
        $res = jsonResponse(4, true, "Something went wrong", null);
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }
    $student = searchFreshStudent($formNumber, $session)[0];
    $res = jsonResponse(1, false, "Matric number generated", studentResponse($student));
    echo $res;
    logAction($ip, $req, $res , $student->id, 0);
} else {

    if (!validateMatricNumber($formNumber)) {
        $res = jsonResponse(2, true, "Invalid Matric Number format", null);
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }
    $student = searchOldStudent($formNumber); //formNumber same as old matric number here
    if (!(isset($student) && count($student) > 0)) {
        $res = jsonResponse(2, true, "Matric number does not exist", null);
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }
    if (!deactivateOldMatric($formNumber)) {
        $res = jsonResponse(3, true, "Matric number changed alread", studentResponse(searchFreshStudent($formNumber, $session)[0], false));
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }
    $insert = insertNewMatric($formNumber, $email, $college, $programme, $session, $level, $firstName, $lastName);
    if ($insert['affected_rows'] == -1) {
        $res = jsonResponse(4, true, "Something went wrong", null);
        echo $res;
        logAction($ip, $req, $res , null, 1);
        die();
    }
    $student = searchFreshStudent($formNumber, $session)[0];
    $res = jsonResponse(1, false, "Matric number generated", studentResponse($student, false));
    echo $res;
    logAction($ip, $req, $res , $student->id, 0);
}
