SELECT managers.name
FROM managers
JOIN teams ON managers.team_id = teams.team_id
WHERE teams.name = 'All Stars'