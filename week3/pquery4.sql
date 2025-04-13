SELECT
    faculty.faculty_fname,
    faculty.faculty_lname
FROM
    faculty
WHERE
    faculty.id not in
(SELECT
    members.id
FROM 
    members
NATURAL JOIN 
    book_issue
WHERE 
    members.id IS NOT NULL)