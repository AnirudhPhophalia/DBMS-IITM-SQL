select teams.team_id, count(players.player_id) as no_player
from teams
join players on teams.team_id=players.team_id
group by teams.team_id
order by no_player
