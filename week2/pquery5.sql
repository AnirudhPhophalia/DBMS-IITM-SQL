SELECT 
    student_fname, student_lname
FROM 
    students
JOIN
    members on students.roll_no = members.roll_no
where
    members.member_type = 'PG'