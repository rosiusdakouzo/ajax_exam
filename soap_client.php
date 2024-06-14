<?php
// soap_client.php
$wsdl = "http://localhost:8080/ajax/soap/scores_service.wsdl";
$client = new SoapClient($wsdl);

$action = $_GET['action'];

try {
    if ($action == 'getScores') {
        $scores = $client->getScores();
        echo $scores;
    } elseif ($action == 'createScore') {
        $match_id = $_POST['match_id'];
        $score_home = $_POST['score_home'];
        $score_away = $_POST['score_away'];
        $result = $client->createScore($match_id, $score_home, $score_away);
        echo json_encode(array("message" => $result));
    }
} catch (SoapFault $fault) {
    echo json_encode(array("error" => $fault->faultstring));
}
