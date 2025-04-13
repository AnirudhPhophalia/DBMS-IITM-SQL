SELECT players.player_id, players.name
FROM players
JOIN teams ON players.team_id = teams.team_id
WHERE teams.name = 'Arawali'
