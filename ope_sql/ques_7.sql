SELECT players.name, players.dob, teams.name, managers.name
FROM players
JOIN teams ON players.team_id= teams.team_id
JOIN managers on teams.team_id=managers.team_id
where players.jersey_no='39'