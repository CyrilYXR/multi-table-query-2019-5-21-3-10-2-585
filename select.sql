# 1.查询同时存在1课程和2课程的情况
SELECT
	studentId 
FROM
	student_course 
WHERE
	studentId IN ( SELECT studentId FROM student_course WHERE courseId = 1 ) 
	AND courseId = 2;

# 2.查询同时存在1课程和2课程的情况
SELECT
	studentId 
FROM
	student_course 
WHERE
	studentId IN ( SELECT studentId FROM student_course WHERE courseId = 1 ) 
	AND courseId = 2;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT
	studentId,
	NAME,
	avg( score )
FROM
	student
	JOIN student_course ON student.id = student_course.studentId 
GROUP BY
	student.id,NAME 
HAVING
	avg( score ) >= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT
	* 
FROM
	student
	LEFT JOIN student_course ON student.id = student_course.studentId 
WHERE
	score IS NULL;

# 5.查询所有有成绩的SQL
SELECT
	* 
FROM
	student s
	JOIN student_course sc ON s.id = sc.studentId
	JOIN course c ON c.id = sc.courseId;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT
	*
FROM
	student s join student_course sc on s.id=sc.studentId
WHERE
	studentId IN ( SELECT studentId FROM student_course WHERE courseId = 1 ) 
	AND courseId = 2;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT
	* 
FROM
	student s,
	student_course sc 
WHERE
	s.id = sc.studentId 
	AND sc.courseId = 1 
	AND score < 60 
ORDER BY
	score DESC;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT
	courseId,
	avg( score ) AS avg_score
FROM
	student_course 
GROUP BY
	courseId 
ORDER BY
	avg(score) DESC, courseId;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT
	s.NAME,
	score 
FROM
	student s
	JOIN student_course sc ON s.id = sc.studentId
	JOIN course c ON c.id = sc.courseId 
WHERE
	c.name = '数学' and score<60;
