CREATE DATABASE IF NOT EXISTS Smart_School_DB;

USE Smart_School_DB;

CREATE TABLE Teachers(
		Teacher_id INT PRIMARY KEY,
		First_name VARCHAR(50),
		Last_name VARCHAR(50),
		Subject VARCHAR(50),
		Email VARCHAR(100),
		Phone VARCHAR(20),
		Hire_date DATE,
		Salary INT NOT NULL
);

CREATE TABLE Classes(
		Class_id INT PRIMARY KEY,
		Class_name VARCHAR(50),
		Section CHAR(1),
        Teacher_id INT NOT NULL,
		FOREIGN KEY (Teacher_id) REFERENCES Teachers(Teacher_id)
);

CREATE TABLE Students(
		 Student_id INT PRIMARY KEY,
		 First_name VARCHAR(50),
		 Last_name VARCHAR(50),
		 Gender CHAR(1),
		 Date_of_birth DATE,
		 Email VARCHAR(100),
		 Phone VARCHAR(15),
		 Address VARCHAR(100),
		 Admission_date DATE,
         Class_id INT NOT NULL,
		 FOREIGN KEY (Class_id) REFERENCES Classes(Class_id)
);

CREATE TABLE Subjects(
Subject_id INT PRIMARY KEY,
Subject_name VARCHAR(50),
Teacher_id INT NOT NULL,
FOREIGN KEY (Teacher_id) REFERENCES Teachers(Teacher_id)
);

CREATE TABLE Enrollments(
Enrollment_id INT primary key,
Student_id INT NOT NULL,
Subject_id INT NOT NULL,
Semester INT NOT NULL,
Year YEAR,
foreign key (Student_id) references Students(Student_id),
foreign key (Subject_id) references Subjects(Subject_id)
);

create table Attendance(
Student_id INT NOT NULL,
Date DATE,
Status CHAR(1),
PRIMARY KEY(Student_id,Date),
foreign key (Student_id) references Students(Student_id)
);

create table Exams(
Exam_id INT primary key,
Subject_id INT not null,
Exam_name VARCHAR(50),
Total_marks INT NOT NULL,
Exam_date DATE,
foreign key (Subject_id) references Subjects(Subject_id)
);

CREATE TABLE Results(
Result_id INT PRIMARY KEY,
Student_id INT NOT NULL,
Exam_id INT,
Marks_obtained INT,
Grade CHAR(1),
foreign key (Student_id) references Students(Student_id),
foreign key (Exam_id) references Exams(Exam_id)
);

