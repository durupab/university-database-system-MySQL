
--  

Drop view course_matching_criteria_curr;
CREATE VIEW course_matching_criteria_curr AS
SELECT distinct COUNT(*) AS matching_criteria, course.coname,section.year,dept.dname
FROM course, section, has, lecturer, researchs, faculty_member, research_area,includes,curriculum,dept
WHERE
curriculum.dcode=dept.dcode
AND (includes.year=curriculum.year and includes.semester=curriculum.semester and includes.language=curriculum.language)  
AND course.ccode=includes.ccode
AND section.ccode = course.ccode
AND course.ccode = has.ccode
AND section.lecid = lecturer.lecid
AND lecturer.fmid = faculty_member.fmid
AND faculty_member.fmid = researchs.fmid
AND researchs.raname = research_area.raname
AND research_area.keywordname = has.keywordname

    
  
group by  dept.dname,section.year;




select  dname as Departman, year as cur_year  ,matching_criteria
from course_matching_criteria_curr;