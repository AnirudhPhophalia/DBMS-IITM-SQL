SELECT teams.name
FROM teams
JOIN matches ON teams.team_id IN (matches.host_team_id, matches.guest_team_id)
GROUP BY teams.name
HAVING COUNT(*) > 3