SELECT *
FROM DEPT
WHERE DEPT.cname = 'EGE UNIVERSITY';

SELECT *
FROM FACULTY_MEMBER
WHERE FACULTY_MEMBER.dcode = '2002';

SELECT STUDENT.fname, STUDENT.lname
FROM STUDENT
WHERE STUDENT.addr = 'istanbul';


SELECT FACULTY_MEMBER.fmid
FROM FACULTY_MEMBER, PROFESSOR
WHERE FACULTY_MEMBER.fmid = PROFESSOR.fmid;

SELECT STUDENT.fname
FROM STUDENT, DEPT
WHERE STUDENT.dcode = DEPT.dcode AND DEPT.cname ='EGE UNIVERSITY';

SELECT COURSE.coname
FROM COURSE, SECTION
WHERE SECTION.year = '2021' AND COURSE.ccode = SECTION.ccode;

SELECT distinct FACULTY_MEMBER.fmname
FROM FACULTY_MEMBER, RESEARCH_AREA,RESEARCHS
WHERE RESEARCH_AREA.raname = 'oop' AND  RESEARCH_AREA.raname=researchs.raname AND RESEARCHS.fmid = FACULTY_MEMBER.fmid;


-- kodu verilen deapartmann charinin verdiği dersler
SELECT COURSE.coname
FROM COURSE, SECTION, DEPT, PROFESSOR, LECTURER
WHERE DEPT.dcode= '1001' AND DEPT.chairid = PROFESSOR.fmid AND PROFESSOR.lecid = LECTURER.lecid 
AND LECTURER.lecid= SECTION.lecid AND SECTION.ccode=COURSE.ccode;

-- mat-1 dersini veren dekan hocalar
SELECT FACULTY_MEMBER.fmname
FROM COLLEGE, COURSE , SECTION, FACULTY_MEMBER
WHERE COURSE.coname = 'mat-1' AND COURSE.ccode = SECTION.ccode AND SECTION.fmid=FACULTY_MEMBER.fmid AND COLLEGE.fmid = FACULTY_MEMBER.fmid ;



 
 -- verilen yil ve verilen dildeki courselari alan öğrencilerein listesi ve notlari
 SELECT COURSE.coname, TAKES.sid , TAKES.grade
 FROM  COURSE, INCLUDES, SECTION, TAKES
 WHERE INCLUDES.year = '2019' AND INCLUDES.language='eng' AND INCLUDES.ccode = COURSE.ccode AND COURSE.ccode=SECTION.ccode 
 AND SECTION.secid=TAKES.secid  ;

-- assistant profesörlerin verdiği zorunlu dersler
 SELECT COURSE.coname
 FROM ASSISTANT_PROFESSOR, SECTION, MANDATORY, COURSE
 WHERE ASSISTANT_PROFESSOR.lecid=SECTION.lecid AND SECTION.ccode = MANDATORY.ccode AND MANDATORY.ccode=COURSE.ccode;



-- ÖĞRENCİLERİN 2021 SECTIONLARINDAN KAÇ TANESİNİ ALDIĞI 
SELECT Fname,Count(TAKES.SecId) as 2021_sections FROM STUDENT,TAKES,SECTION WHERE TAKES.SID = STUDENT.SID AND TAKES.SECID = SECTION.SECID AND SECTION.YEAR = 2021 GROUP BY STUDENT.FNAME ORDER BY FNAME ;

-- YA DERS VEREN YA CHAIR YA DEAN OLAN PROFESSORLER
(SELECT DISTINCT PROFESSOR.FMId
FROM COLLEGE,PROFESSOR 
WHERE PROFESSOR.FMId = COLLEGE.FMId )
UNION
(SELECT DISTINCT PROFESSOR.FMId
FROM DEPT,PROFESSOR
WHERE PROFESSOR.FMId = DEPT.ChairId)
UNION 
(SELECT DISTINCT PROFESSOR.FMId
FROM SECTION,PROFESSOR
WHERE PROFESSOR.FMId = SECTION.FMId
);


-- 2021 DEN ÖNCE SECTION OLAN COURSE ADLARI
SELECT SECID,COURSE.CONAME FROM SECTION INNER JOIN COURSE ON COURSE.CCODE = SECTION.CCODE WHERE section.year < 2021
order by secid asc;




select  distinct count(*),researchs.fmid,faculty_member.fmname
from  researchs,faculty_member
where faculty_member.fmid=researchs.fmid 

group by researchs.fmid;




