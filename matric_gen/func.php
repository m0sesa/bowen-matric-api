<?php

try {
    $conn = new mysqli("localhost", "root", "root", "sshub_bowen");
} catch (Exception $e) {
    die('Error......');
}

// SQL calls
function getSqlResult($preparedQuery, $returnData = true, $paramsTypeString = '', array $params = [])
{
    global $conn;

    $stmt = $conn->prepare($preparedQuery);
    if (count($params) > 0) {
        $stmt->bind_param($paramsTypeString, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();

    if ($returnData == false) {
        return [
            "affected_rows" => $conn->affected_rows,
            "data" => null
        ];
    }
    $array = [];
    while ($row = $result->fetch_object()) {
        array_push($array, $row);
    }

    return [
        "affected_rows" => $conn->affected_rows,
        "data" => $array
    ];
}

function searchFreshStudent($formNumber, $session)
{
    $query = "select * from matric_numbers WHERE form_number = ? AND session = ?";
    $result = getSqlResult($query, true, 'ss', [$formNumber, $session]);

    return $result['data'];
}

function searchStudents($session)
{
    $query = "select * from matric_numbers WHERE session = ?";
    $result = getSqlResult($query, true, 's', [$session]);

    return $result['data'];
}

function searchOldStudent($matric_number)
{
    $query = "select * from matric_numbers WHERE matric_number = ?";
    $result = getSqlResult($query, true, 's', [$matric_number]);

    return $result['data'];
}

function searchOldStudentWithName($matric_number, $firstName, $lastName)
{
    $query = "select * from matric_numbers WHERE matric_number = ? AND first_name = ? AND last_name = ?";
    $result = getSqlResult($query, true, 'sss', [$matric_number, $firstName, $lastName]);

    return $result['data'];
}

function deactivateOldMatric($matric_number)
{
    $query = "UPDATE matric_numbers SET active = 0 WHERE matric_number = ?";
    $result = getSqlResult($query, false, 's', [$matric_number]);

    if ($result['affected_rows'] > 0) {
        return true;
    }
    return false;
}

function insertNewMatric($formNumber, $email, $college, $programme, $session, $level, $firstName, $lastName, $type)
{
    $query = "SELECT matric_number FROM `matric_numbers` WHERE college = ? AND programme = ? AND session = ? AND level = ? AND matric_number LIKE '$type%'ORDER BY matric_number ASC";
    $result = getSqlResult($query, true, 'sssi', [$college, $programme, $session, $level]);
    $count = $result['affected_rows'];
    // The database constraint is instrumental to not getting duplicate matric here, 
    // so the database has to be setup correctly to ensure unique matric_numbers
    // matricExamples: BU20CIT1005, BU20PUH3003
    $defaultMatric = $type . substr($session, 2, 2) . $programme . (substr($level, 0, 1) * 1000 + $count + 1);

    $query2 = "INSERT INTO `matric_numbers` (`id`, `matric_number`, `form_number`, `email`, `first_name`,`last_name`,`college`, `programme`, `session`, `level`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, NULL)";
    $result2 = getSqlResult($query2, false, 'sssssssss', [$defaultMatric, $formNumber, $email, $firstName, $lastName, $college, $programme, $session, $level]);
    if ($result2['affected_rows'] < 0) {
        foreach ($result['data'] as $index => $data) {
            $humanIndex = $index + 1;
            $number = (int) substr($data->matric_number, 8, 3);
            if ($humanIndex != $number) {
                $freeMatric = 'BU' . substr($session, 2, 2) . $programme . (substr($level, 0, 1) * 1000 + $humanIndex);
                $query2 = "INSERT INTO `matric_numbers` (`id`, `matric_number`, `form_number`, `email`, `first_name`,`last_name`, `college`, `programme`, `session`, `level`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, NULL)";
                $result = getSqlResult($query2, false, 'sssssssss', [$freeMatric, $formNumber, $email, $firstName, $lastName, $college, $programme, $session, $level]);
                break;
            }
        }
    }
    return $result;
}

function deleteMatricNumber($id){
    $query = "DELETE FROM `matric_numbers` WHERE id = ?";
    $result = getSqlResult($query, false, 'i', [$id]);

    if ($result['affected_rows'] == 1) {
        return true;
    }
    return false;
}

// Modifiers (helpers)
function jsonResponse($status, $error, $message, $data)
{
    return json_encode([
        "status" => $status,
        "error"  => $error,
        "mesage" => $message,
        "data"   => $data
    ]);
}

function studentResponse($student, $newStudent = true)
{
    return [
        "matric_number" => $student->matric_number,
        "form_number"   => $student->form_number,
        "firstName"     => $student->first_name,
        "lastName"      => $student->last_name,
        "email"         => $student->email,
        "college"       => $student->college,
        "programme"     => $student->programme,
        "session"       => $student->session,
        "level"         => $student->level,
        "old_matric"    => $newStudent ? null : $student->form_number
    ];
}

// Validators
function validateFormNumber($formNumber)
{
    return true;
}

function validateMatricNumber($matricNumber)
{
    if (strlen($matricNumber) < 14) {
        return true;
    }
    if (!is_numeric($matricNumber)) {
        return true;
    }
    if (strpos($matricNumber, '/') !== false || strpos(strtolower($matricNumber), 'bu') !== false) {
        return true;
    }
    return false;
}

function validateSession($session)
{
    if (strlen($session) == 9) {
        if (strpos($session, '/') !== false) {
            $ses = explode('/', $session);
            if ((int)$ses[1] == (int)($ses[0]+1)) {
                return true;
            }
        }
        return false;
    }
    return false;
}

function validateLevel($level){
    if (is_numeric($level) && ($level >= 100 || $level <= 300)){
        return true;
    }
    return false;
}

function validateCollege($college){
    $query = "SELECT * FROM faculty WHERE FacultyCode = ?";
    $result = getSqlResult($query, false, 's', [$college]);

    if ($result['affected_rows'] == 1) {
        return true;
    }
    return false;
}

function validateProgramme($programme){
    $query = "SELECT * FROM departments WHERE DepartmentCode = ?";
    $result = getSqlResult($query, false, 's', [$programme]);

    if ($result['affected_rows'] == 1) {
        return true;
    }
    return false;
}

function validateType($type){
    $types = [
        "BU", // Undergraduate
        "BP", // Postgraduate
        "BD", // Distance Learning
        "BW" // Weekend Programme
    ];
    
    return in_array($type, $types);
}

// Log
function logAction($ip, $request, $response, $matricId, $error){
    $query = "INSERT INTO `matric_numbers_logs` (`id`, `user_ip`, `request`, `response`, `error`, `matric_number_id`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, NULL)";
    getSqlResult($query, false, 'sssii', [$ip, $request, $response, $error, $matricId]);
}