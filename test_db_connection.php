<?php
// test_db_connection.php
require 'db.php';

$database = new Database();
$db = $database->getConnection();

if ($db) {
    echo "Connected to the database successfully.";
} else {
    echo "Failed to connect to the database.";
}
