SELECT players.name, players.jersey_no, managers.name
FROM players
JOIN teams on players.team_id= teams.team_id
JOIN managers on teams.team_id=managers.team_id
where players.jersey_no='14'
or players.jersey_no='16'