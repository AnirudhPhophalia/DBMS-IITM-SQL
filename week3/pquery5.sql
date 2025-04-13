SELECT distinct
    title 
FROM
  book_catalogue 
NATURAL JOIN
  book_copies 
NATURAL JOIN
  book_issue 
NATURAL JOIN
  members
WHERE 
    member_type = 'PG'
EXCEPT
SELECT distinct
    title 
FROM
  book_catalogue 
NATURAL JOIN
  book_copies 
NATURAL JOIN
  book_issue 
NATURAL JOIN
  members
WHERE 
    member_type ='UG'