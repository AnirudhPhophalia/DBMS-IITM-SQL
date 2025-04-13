SELECT 
    DISTINCT teams.city, 
    teams.name AS team_name
FROM 
    players
JOIN 
    teams ON players.team_id = teams.team_id
WHERE 
    players.jersey_no BETWEEN 80 AND 99
