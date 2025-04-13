-- Write an SQL statement to find student_fname and student_lname of all students who have issued (borrowed) at least one book.

SELECT DISTINCT 
    students.student_fname, 
    students.student_lname
FROM 
    students
JOIN 
    members ON students.roll_no = members.roll_no
JOIN 
    book_issue ON members.member_no = book_issue.member_no
