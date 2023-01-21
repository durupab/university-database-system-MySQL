Drop view course_matching_criteria;
CREATE VIEW TABLE1 AS
SELECT  research_area.keywordname as hocakeyw, faculty_member.fmId as hocanum -- her hoca için onların araştırdığı alanların keywordleri
    FROM faculty_member
	JOIN researchs ON faculty_member.fmid = researchs.fmid
    JOIN research_area ON researchs.raname = research_area.raname
    WHERE faculty_member.fmname IN (
      SELECT  faculty_member.fmname -- açılan dersleri veren hocaların listesi dönüyor
      FROM faculty_member
      JOIN lecturer ON faculty_member.lecid = lecturer.lecid
      INNER JOIN section ON section.lecid = lecturer.lecid
      INNER JOIN course ON course.ccode = section.ccode
      WHERE  section.ccode = course.ccode
    );
    

CREATE VIEW course_matching_criteria AS
SELECT distinct COUNT(*) AS matching_criteria, course.coname
FROM section
INNER JOIN course ON section.ccode = course.ccode
INNER JOIN has ON section.ccode = has.ccode
INNER JOIN table1 on section.fmId = table1.hocanum
WHERE  section.ccode = course.ccode
  AND has.keywordname = table1.hocakeyw
GROUP BY course.coname;

select * 
from course_matching_criteria;