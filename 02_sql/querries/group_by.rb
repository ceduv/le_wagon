#============== GROUP BY ================

# In a DB with a students table, write an SQL query to get the number of students by age groups

SELECT COUNT(*), age
FROM students
GROUP BY age;

#---

# Write the SQL query to get the number of doctors by specialty from the doctors table, in descending order

SELECT COUNT(*) AS c, specialty
FROM doctors
GROUP BY specialty
ORDER BY c DESC;