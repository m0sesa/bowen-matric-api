<?php
header("Content-Type: application/json");

require "../func.php";

$required = array('matricNumber', 'reason', 'firstName', 'lastName');

if (!(count(array_intersect_key(array_flip($required), $_POST)) === count($required))) {
    echo jsonResponse(5, true, "Invalid REQUEST", null);
    die();
}

$matricNumber = htmlspecialchars(stripslashes(trim($_POST['matricNumber'])));
$reason = htmlspecialchars(stripslashes(trim($_POST['reason'])));
$firstName = htmlspecialchars(stripslashes(trim($_POST['firstName'])));
$lastName = htmlspecialchars(stripslashes(trim($_POST['lastName'])));

$ip = $_SERVER['REMOTE_ADDR'];
$req = json_encode($_POST);

if (!validateMatricNumber($matricNumber)) {
    $res = jsonResponse(2, true, "Invalid Matric Number format", null);
    echo $res;
    logAction($ip, $req, $res, null, 1);
    die();
}

if (strlen($reason) == 0) {
    $res = jsonResponse(2, true, "Reason can not be empty", null);
    echo $res;
    logAction($ip, $req, $res, null, 1);
    die();
}

$student = searchOldStudentWithName($matricNumber, $firstName, $lastName);
if (!(isset($student) && count($student) > 0)) {
    $res = jsonResponse(2, true, "Matric number and details does not match our records", null);
    echo $res;
    logAction($ip, $req, $res, null, 1);
    die();
}

if (!deleteMatricNumber($student[0]->id)) {
    $res = jsonResponse(4, true, "Something went wrong", null);
    echo $res;
    logAction($ip, $req, $res, null, 1);
    die();
}

$res = jsonResponse(1, false, "Matric number deleted", studentResponse($student[0]));
echo $res;
logAction($ip, $req, $res, null, 0);
