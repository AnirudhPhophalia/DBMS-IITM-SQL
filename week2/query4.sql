SELECT students.student_fname, students.dob
FROM students
JOIN departments ON students.department_code = departments.department_code
WHERE departments.department_code = 'ME'
  AND students.dob > '2003-06-15'