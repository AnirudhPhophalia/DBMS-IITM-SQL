SELECT managers.name
FROM managers
JOIN teams on managers.team_id= teams.team_id
WHERE teams.name = 'Arawali'