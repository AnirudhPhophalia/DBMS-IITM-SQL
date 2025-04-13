SELECT 
    players.name AS youngest_player_name
FROM 
    players
JOIN 
    teams ON players.team_id = teams.team_id
WHERE 
    teams.name = 'All Stars'
ORDER BY 
    players.dob DESC
LIMIT 1
