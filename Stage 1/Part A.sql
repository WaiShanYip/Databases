Part A- SQL

1)	List the names and weightings of all assessments in the course titled ‘Web technologies. The list should be ordered by the assessment name. [4 marks]
mysql> SELECT DISTINCT name, weighting, title
    -> FROM Assessment, Course
    -> WHERE title = 'Web technologies'
    -> ORDER BY name;

2)	Find the course ID, the name and average mark of each assessment. Results should be ordered by the course ID and then the assessment [4 marks]
mysql> SELECT Course.cid, Assessment.aid, name, AVG(mark)
    -> FROM (Assessment JOIN Course ON Course.cid = Assessment.cid) JOIN Grade ON Assessment.aid = Grade.aid
    -> GROUP BY Course.cid, Assessment.aid
    -> ORDER BY Course.cid, name;

3)	Show the detailed results achieved by a specific student, say sid=’s0002’

a) For each course taken by the given student, show the Course ID, title, name, weighting and mark achieved for each assessment [3 marks]

mysql> SELECT DISTINCT Assessment.cid, title, name, weighting, mark
    -> FROM (Course JOIN Assessment ON Course.cid=Assessment.cid) JOIN Grade ON Assessment.aid=Grade.aid
    -> WHERE sid = 'S0002';

b) Show the given student’s final result on each of the courses the student has taken [5 marks] 

mysql> SELECT Assessment.cid, SUM(weighting/100*mark)
    -> FROM (Course JOIN Assessment ON Course.cid=Assessment.cid) JOIN Grade ON Assessment.aid=Grade.aid
    -> WHERE sid = 'S0002'
    -> GROUP BY Assessment.cid;
