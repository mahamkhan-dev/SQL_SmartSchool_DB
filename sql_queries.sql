USE Smart_School_DB;

SET SQL_SAFE_UPDATES=0;

SHOW DATABASES;
SHOW TABLES;

SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Teachers;

SELECT First_name,Last_name 
FROM Students;

SELECT DISTINCT Gender  
FROM Students;

SELECT Student_id,First_name,Last_name
FROM Students
WHERE Class_id=5;

SELECT Student_id,First_name,Last_name
FROM Students
WHERE Admission_date > '2024-01-20';

SELECT Teacher_id,First_name,Last_name,Salary
FROM Teachers
WHERE Salary> 80000;

SELECT Student_id,First_name,Last_name
FROM Students
ORDER BY First_name;

SELECT Student_id,First_name,Last_name,Date_of_birth
FROM Students
ORDER BY Date_of_birth;

SELECT Teacher_id,First_name,Last_name,Salary
FROM Teachers
ORDER BY Salary desc;

SELECT Result_id,Student_id,Marks_obtained
FROM Results
ORDER BY Marks_obtained;

SELECT First_name,Last_name
FROM Students
WHERE First_name LIKE 'S%';

SELECT Teacher_id,First_name,Last_name,Subject
FROM Teachers
Where Subject='Physics';

SELECT Student_id,First_name,Last_name
FROM Students
WHERE Admission_date BETWEEN '2024-06-01' AND '2024-07-01';

SELECT Teacher_id,First_name,Last_name,Salary
FROM Teachers
WHERE Salary BETWEEN 75000 AND 80000;

SELECT Student_id,First_name,Last_name,Email
FROM Students
WHERE Email IS NULL;

SELECT COUNT(*) 
FROM Students;

SELECT COUNT(*) 
FROM Teachers;

SELECT AVG(Salary)
FROM Teachers;

SELECT MAX(Salary)
FROM Teachers;

SELECT MIN(Salary)
FROM Teachers;

SELECT SUM(Salary)
FROM Teachers;

SELECT AVG(Marks_Obtained)
FROM Results;

SELECT Class_id,COUNT(*)
FROM Students
GROUP BY Class_id;

SELECT COUNT(*),Subject
FROM Teachers
GROUP BY Subject;

SELECT AVG(Marks_obtained),Exam_id
FROM Results
GROUP BY Exam_id;

SELECT AVG(Marks_obtained),Student_id
FROM Results
GROUP BY Student_id;

SELECT Class_id
FROM Students
GROUP BY Class_id
HAVING COUNT(*)>5;

SELECT Exam_id,AVG(Marks_obtained)
FROM Results
GROUP BY Exam_id
HAVING AVG(Marks_obtained)>70;

SELECT Subject,AVG(Salary)
FROM Teachers
GROUP BY Subject
HAVING AVG(Salary)>80000;

SELECT b.Class_name,Student_id,First_name,Last_name
FROM STUDENTS_INFO as a
INNER JOIN Classes as b
ON a.Class_id=b.Class_id;

SELECT Result_id,a.Student_id,First_name
FROM Students as a
INNER JOIN Results as b
ON a.Student_id=b.Student_id;

SELECT a.Student_id,First_name,Subject_name
FROM Students as a
INNER JOIN Enrollments as b
ON a.Student_id=b.Student_id
INNER JOIN Subjects as c
ON b.Subject_id=c.Subject_id;

SELECT a.Teacher_id,First_name,Subject_id,Subject_name
FROM Teachers as a
INNER JOIN Subjects as b
ON a.Teacher_id=b.Teacher_id;

SELECT S.Student_id,S.First_name,su.Subject_name,t.First_name,t.Teacher_id
FROM STUDENTS_INFO S
INNER JOIN Enrollments E
ON E.Student_id=S.Student_id
INNER JOIN Subjects su
ON E.Subject_id=su.Subject_id
INNER JOIN Teachers t
ON su.Teacher_id=t.Teacher_id;

SELECT S.Student_id,S.First_name,c.Class_id,c.Class_name,t.Teacher_id
FROM STUDENTS_INFO S
INNER JOIN Classes c
ON c.Class_id=S.Class_id
INNER JOIN Teachers t
ON c.Teacher_id=t.Teacher_id;

SELECT S.Student_id,S.First_name,su.Subject_name,R.Marks_obtained
FROM STUDENTS_INFO S
INNER JOIN Enrollments E
ON E.Student_id=S.Student_id
INNER JOIN Subjects su
ON E.Subject_id=su.Subject_id
INNER JOIN Exams ex
ON ex.Subject_id=su.Subject_id
INNER JOIN Results R
ON R.Exam_id=ex.Exam_id AND R.Student_id=S.Student_id;

SELECT S.Student_id,R.Result_id,R.Marks_obtained
FROM STUDENTS_INFO S
LEFT JOIN Results R
ON S.Student_id=R.Student_id;

SELECT DISTINCT Subject_name
FROM Subjects su
LEFT JOIN Enrollments E
ON E.Subject_id=su.Subject_id
LEFT JOIN STUDENTS_INFO S
ON S.Student_id=E.Student_id;

SELECT T.Teacher_id,T.First_name
FROM Teachers T
LEFT JOIN Classes C
ON T.Teacher_id=C.Teacher_id;

SELECT Student_id,First_name,Last_name
FROM STUDENTS_INFO
WHERE Student_id IN
(SELECT Student_id FROM Results WHERE Marks_obtained=
(SELECT MAX(Marks_obtained) FROM Results)
);

SELECT S.Student_id,S.First_name,S.Last_name,R.Marks_obtained
FROM STUDENTS_INFO S
INNER JOIN Results R
ON S.Student_id = R.Student_id
WHERE R.Marks_obtained =
(
    SELECT MAX(Marks_obtained)
    FROM Results
);

SELECT Teacher_id,Salary
FROM Teachers
WHERE Salary IN (SELECT MAX(Salary) FROM Teachers);

SELECT S.Student_id,Marks_obtained
FROM STUDENTS_INFO S
INNER JOIN Results R
ON S.Student_id=R.Student_id
WHERE Marks_obtained>
(  SELECT AVG(Marks_obtained) FROM Results);

SELECT Teacher_id,Salary
FROM Teachers
Where Salary>
(SELECT Avg(Salary) FROM Teachers);

UPDATE Students
SET Phone='03221712992'
Where Student_id=1; 

UPDATE Teachers
SET Salary=Salary + 10*Salary/100;

UPDATE Classes
SET Teacher_id=2
Where Class_id=1;

UPDATE Students
SET Email='mahamkhan_dev@gmail.com'
Where Student_id=1;

DELETE FROM Attendance
WHERE Student_id=2;

DELETE FROM Results
WHERE Exam_id=5;

DELETE FROM Exams
Where Exam_id=5;

DELETE FROM Results
WHERE Result_id=1;

SELECT UPPER(First_name)
FROM Students;

SELECT LOWER(Email)
FROM Students;

SELECT CONCAT(First_name,"   ",Last_name)
AS Full_name
FROM Students;

SELECT LENGTH(First_name)
FROM Students;

SELECT LEFT(First_name,3)
FROM Students;

SELECT RIGHT(Phone,3)
FROM Students;

SELECT CURDATE();

SELECT Teacher_id,YEAR(Hire_date)
FROM Teachers;

SELECT Student_id,Date_of_birth
FROM Students
WHERE MONTH(Date_of_birth)=10;

SELECT Day(Admission_date)
FROM Students;

SELECT 
Teacher_id,DATEDIFF(CURDATE(),Hire_date)
FROM Teachers;

INSERT INTO Students 
Values
(1,'Student1','L1','M','2009-01-02','student1@mail.com','03110000001','City','2024-04-01',1);

INSERT INTO Students
Values
(49,'Student1','L1','M','2009-01-02','student1@mail.com','03110000001','City','2024-04-01',10);

INSERT INTO Students 
Values
(NULL,'Student1','L1','M','2009-01-02','student1@mail.com','03110000001','City','2024-04-01',1);

ALTER TABLE Teachers
ADD COLUMN Date_of_Birth DATE;

ALTER TABLE Students
MODIFY Date_of_birth DATE NOT NULL;

ALTER TABLE Students
RENAME TO STUDENTS_INFO; 

aLter Table Teachers
DROP COLUMN Date_of_Birth; 

CREATE VIEW view2 as
SELECT Student_id,Exam_id,Grade FROM Results
where Exam_id=1;

SELECT * FROM view2;

CREATE VIEW VIEW3 AS
SELECT Teacher_id,First_name,Subject,Salary
FROM Teachers;

SELECT * FROM VIEW3;

SELECT * FROM VIEW3
WHERE Salary=80000;

CREATE INDEX Email_index 
ON STUDENTS_INFO(Email);

alter table STUDENTS_INFO
DROP INDEX Email_index;
