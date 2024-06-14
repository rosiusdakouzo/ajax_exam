<?php
// FootballScoresService.php
class FootballScoresService
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function getScores()
    {
        // $query = "SELECT * FROM scores";
        $query = "SELECT m.id AS match_id, t1.name AS team_home, t2.name AS team_away, s.score_home, s.score_away, m.date
        FROM matches m
        JOIN teams t1 ON m.team_home_id = t1.id
        JOIN teams t2 ON m.team_away_id = t2.id
        JOIN scores s ON m.id = s.match_id;
        ";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $scores_arr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $scores_arr[] = $row;
        }
        return json_encode($scores_arr);
    }

    public function createScore($match_id, $score_home, $score_away)
    {
        $query = "INSERT INTO scores (match_id, score_home, score_away, timestamp) VALUES (:match_id, :score_home, :score_away, :timestamp)";
        $stmt = $this->conn->prepare($query);

        $timestamp = date('Y-m-d H:i:s');

        $stmt->bindParam(':match_id', $match_id);
        $stmt->bindParam(':score_home', $score_home);
        $stmt->bindParam(':score_away', $score_away);
        $stmt->bindParam(':timestamp', $timestamp);

        if ($stmt->execute()) {
            return "Score created successfully.";
        } else {
            return "Failed to create score.";
        }
    }
}
