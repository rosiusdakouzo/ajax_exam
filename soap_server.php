<?php
// soap_server.php
require 'db.php';
require 'FootballScoresService.php';

$database = new Database();
$db = $database->getConnection();
$service = new FootballScoresService($db);

$server = new SoapServer("http://localhost:8080/ajax/soap/scores_service.wsdl");
$server->setObject($service);
$server->handle();
