SELECT 
    matches.match_num, 
    referees.name AS fourth_referee_name
FROM 
    matches
JOIN 
    match_referees ON matches.match_num = match_referees.match_num
JOIN 
    referees ON match_referees.fourth_referee = referees.referee_id
WHERE 
    matches.match_date = '2020-05-15'
