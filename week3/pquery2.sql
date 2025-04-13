SELECT
    faculty.faculty_fname,
    faculty.faculty_lname
FROM 
    faculty
NATURAL JOIN
    departments
NATURAL JOIN
    members
NATURAL JOIN
    book_issue
WHERE
    departments.department_code ='ME'
AND
    book_issue.member_no IS NOT NULL