DROP DATABASE IF EXISTS `COLLEGE_DB`;
CREATE DATABASE `COLLEGE_DB`; 
USE `COLLEGE_DB`;

CREATE TABLE KEYWORDS(
keywordname varchar(50),
PRIMARY KEY (keywordname)
);

CREATE TABLE COURSE(
ccode int,
coname varchar(50),
credits int,
level int,
cdesc varchar(250),
PRIMARY KEY(ccode),
CONSTRAINT CHK_credits CHECK (credits<10)
);

CREATE TABLE RESEARCH_AREA(
raname varchar(50),
keywordname varchar(50),
PRIMARY KEY(raname,keywordname)


);

CREATE TABLE DEPT(
dcode int ,
dname varchar(50),
dphone varchar(15),
cname varchar(50),
chairid int NOT NULL,
cstartdate date,
PRIMARY KEY(dcode)



);

CREATE TABLE FACULTY_MEMBER(
fmid int,
lecid int,
fmname varchar(50),
office varchar(250),
phone varchar(15),
dcode int,
PRIMARY KEY(fmid)

);

CREATE TABLE LECTURER(
fmid int,
lecid int,
PRIMARY KEY (lecid)

);

CREATE TABLE PROFESSOR(
fmid int,
lecid int,
PRIMARY KEY (fmid)

);


CREATE TABLE CURRICULUM(
language varchar(15) ,
year int ,
semester varchar(15) ,
dcode int ,
PRIMARY KEY (year,semester,language),
CONSTRAINT CHK_Year CHECK (year<2023)
);

CREATE TABLE COLLEGE(
cname varchar(50),
coffice varchar(250),
cphone varchar(15),
fmid int NOT NULL,
PRIMARY KEY (cname)

);



CREATE TABLE SECTION(
daystime varchar(30),
bldg varchar(30),
roomno varchar(10),
year int,
sem varchar(15),
secno int,
secid int,
ccode int,
fmid int,
lecid int,
status varchar(30),
PRIMARY KEY (secid),
CONSTRAINT CHK_YearSec CHECK (year<2023)
);

CREATE TABLE STUDENT(
sid bigint,
dob date,
fname varchar(15),
mname varchar(15),
lname varchar(15),
addr varchar(250),
phone varchar(15),
major varchar(50),
dcode int,
PRIMARY KEY(sid)

);


CREATE TABLE INCLUDES(
year int,
language varchar(15),
semester varchar(15),
ccode int,
PRIMARY KEY(year,language,semester,ccode)
);

CREATE TABLE HAS(
ccode int,
keywordname varchar(50),
PRIMARY KEY(ccode,keywordname)
);

CREATE TABLE TAKES(
secid int,
sid bigint,
grade int,
PRIMARY KEY (secid,sid),
CONSTRAINT CHK_grade CHECK (grade<=100)
);

CREATE TABLE RESEARCHS(
fmid int,
raname varchar(50),
PRIMARY KEY (fmid,raname)

);


CREATE TABLE COMPUTER_ENGINEERING(
dcode int,
PRIMARY KEY (dcode)
);

CREATE TABLE SOFTWARE_ENGINEERING(
dcode int,
PRIMARY KEY (dcode)
);

CREATE TABLE ARTIFICIAL_INTELLIGENCE(
dcode int,
PRIMARY KEY (dcode)
);







CREATE TABLE MANDATORY(
ccode int,
PRIMARY KEY(ccode)
);

CREATE TABLE TECHNICAL(
ccode int,
PRIMARY KEY(ccode)
);

CREATE TABLE NON_TECHNICAL(
ccode int,
PRIMARY KEY(ccode)
);





CREATE TABLE RESEARCH_ASSISTANT(
fmid int,
PRIMARY KEY (fmid)
);




CREATE TABLE ASSISTANT_PROFESSOR(
fmid int,
lecid int,
PRIMARY KEY (fmid)
);

CREATE TABLE ASSOCIATE_PROFESSOR(
fmid int,
lecid int,
PRIMARY KEY (fmid)
);

CREATE TABLE INSTRUCTOR(
fmid int,
lecid int,
PRIMARY KEY (fmid)
);

INSERT INTO COLLEGE
VALUES ('EGE UNIVERSITY', 'BORNOVA', '12345',	'10001'),
       ('DOKUZ EYLÜL UNIVERSITY',	'BUCA',	'12344', '10005');
     
INSERT INTO DEPT
VALUES ('1001',	'COMPUTER ENGINEERING',	'12333', 'EGE UNIVERSITY', '10001',	'2020.01.01'),
       ('1002',	'SOFTWARE ENGINEERING',	'12444', 'EGE UNIVERSITY',	'10003',	'2020.02.03'),
       ('1003',	'ARTIFICAL ENGINEERING', '12555', 'EGE UNIVERSITY',	'10004',	'2020.05.06'),
       ('2001',	'COMPUTER ENGINEERING',	'233444', 'DOKUZ EYLUL UNIVERSITY',	'10005', '2020.02.15'),
       ('2002',	'SOFTWARE ENGINEERING',	'23555', 'DOKUZ EYLUL UNIVERSITY',	'10007', '2020.01.09'),
       ('2003',	'ARTIFICAL ENGINEERING', '23666', 'DOKUZ EYLUL UNIVERSITY',	'10008',	'2020.06.12');
     
INSERT INTO FACULTY_MEMBER
VALUES ('10001',    '1', 'MURAT OSMAN UNALIR',	'Bilmuh.1',	'1233443', '1001'),	
       ('10002',	'2',	'AYBARS UĞUR',	'Bilmuh.2',	'123444',	'1001'),	
       ('10003',	'3',	'HAKAN YILMAZ',	'softeng.1', '12233', '1002'),	
	   ('10004',	'4',	'AHMET YAŞAR',	'arteng.1',	'13445', '1003'),	
       ('10005',	'5',	'sezercan',	'jshdsudh',	'74627462',	'2001'),	
       ('10006',	'6',	'ercan', 'jsnasn',	'84738473',	'2002'),
       ('10007',	'7',	'veli', 'jsdffgd',	'54735743',	'2002'),
       ('10008',	'8',	'rıza cenk',	'jhubuın',	'787878',	'2003'),	
	   ('10009',	null,	'MEHMET',	'Aasda',	'4534556',	'1002'),	
	   ('10010',    '9',    'Emine',  'sdafgf',    '1423536', '2001');   
        
INSERT INTO LECTURER
VALUES ('10001',	'1'),	
	   ('10002',	'2'),	
       ('10003',	'3'),	
       ('10004',	'4'),	
       ('10005',	'5'),	
       ('10006',	'6'),	
       ('10007',	'7'),	
       ('10008',	'8'),
       ('10010',    '9');
       
INSERT INTO PROFESSOR
VALUES ('10001',	'1'),
       ('10003',	'3'),
       ('10004',	'4'),
       ('10005',	'5'),
       ('10007',	'7'),
       ('10008',	'8'); 
       
       
       
INSERT INTO ASSOCIATE_PROFESSOR
VALUES  ('10002', '2');     

INSERT INTO ASSISTANT_PROFESSOR
VALUES  ('10006', '6');    

INSERT INTO INSTRUCTOR
VALUES  ('10010', '9'); 

INSERT INTO RESEARCH_ASSISTANT
VALUES  ('10009');  


INSERT INTO CURRICULUM
VALUES ('eng',	'2019',	'S', 	'1001'),
       ('eng',	'2020',	'A',	'1002'),
       ('eng',	'2021',	'S', 	'1003'),
	   ('tr',	'2019',	'A',	'2001'),
       ('tr',	'2020',	'S', 	'2002'),
       ('tr',	'2021',	'A',	'2003');
       
INSERT INTO KEYWORDS
VALUES   ('java'),
         ('python'), 
         ('object'),
         ('data'),
         ('database'),
         ('optimization algorithms'),
         ('design patterns'),
         ('mobile application');    
         
INSERT INTO RESEARCH_AREA
VALUES     ('oop',		'java'),
		   ('oop',		'design patterns'),
		   ('algoritma',		'python'), 
		   ('algoritma',	'optimization algorithms'),
           ('big data',	'data'),
           ('data securty',	'database'),
           ('game application',	'mobile application'),
           ('ayrık math','data');
           
INSERT INTO COURSE
VALUES  ('1',	'mat-1',	'4',	'1',	'asda'),
		('2',	'mat-2',	'4',	'1',	'sdfsfs'),
        ('3',	'ics',  	'2',	'2',	'sdfsfs'),
        ('4',	'algoritma-1',	'6',	'1',	'asda'),
        ('5',	'algoritma-2',	'6',	'1',	'dasa'),
        ('6',	'yapay zeka',	'5',	'3',	'ada'),
        ('7',	'veri madenciliği',	'4',	'4',	'asdas'),
        ('8',	'data structures',	'3',	'2',	'aaads'),
        ('9',	'tarih',	'2',	'1',	'asdf'),
        ('10',	'topluma hizmet',	'1',	'1',	'dfgs'),
        ('11',	'diferansiyel denklemler',	'2',	'4',	'ssdg'),
        ('12',	'olasılık ve istatistik',	'5',	'3',	'fgfdsd'),
        ('13',	'oop',	'3',	'4',	'sdfsd'),
        ('14',	'dbm',	'6',	'4',	'sfsfs'),
        ('15',	'işletim sistemleri',	'2',	'3',	'fgs');  
        
INSERT INTO MANDATORY
VALUES ('1'),
       ('2'),
       ('3'),
       ('4'),
       ('5'),
       ('7'),
       ('11'),
       ('13');
       
INSERT INTO TECHNICAL
VALUES  ('6'),
        ('8'),
		('12'),
        ('14'),
        ('15');
        
INSERT INTO NON_TECHNICAL
VALUES  ('9'),
        ('10');     
        
        
INSERT INTO STUDENT
VALUES   ('5200000027',	'2002.10.04',	'Duru', 'x ',	'Pabuşçu',	'bornova',	'551 553 72 60',	'hjghjg',	'1001'),
         ('5190000077',	'2000.12.12',	'Emre', 'x',	'Sarıoğlu',	'kocaeli',	'507 949 54 76',	'ghjsd',	'2001'),
         ('1010101010',	'1999.11.25',	'Mira', 'x',	'Beylice',	'istanbul',	'552 765 87 89',	'dfgdg',	'1002'),
         ('1212121212',	'1997.06.17',	'Yaman', 'x',	'Koper',	'istanbul',	'534 467 90 92',	'dfgdr',	'2002'),
         ('1313131313',	'2002.09.06',	'Eylül', 'x',	'Serez',	'izmir',	'506 789 34 65',	'dfgdg',	'1003'),
         ('1414141414',	'2001.11.15',	'Mert',	 'x',   'Asım',	    'ankara',	'512 911 23 95',	'kykyuh',	'2003'),
         ('1515151515',	'2000.10.10',	'Orkun', 'x',	'Işık',	    'erzurum',	'515 330 75 57',	'ertdgg',	'1001');     
        
        
INSERT INTO SECTION
VALUES ('Monday',	'asda',	    'B4',	'2020',	'S',	'1',	'101',	'1',	'10001',	'1','open?'),
       ('Monday',	'sada',	    'B4',	'2020',	'A',	'2',	'102',	'2',	'10001',	'1','open?'),
       ('Friday',	'asdad',	'B7',	'2020',	'S', 	'3',	'103',	'3',	'10002',	'2','open?'),
       ('thursday',	'adas',	    'B3',	'2020',	'S', 	'4',	'104',	'4',	'10003',	'3','open?'),
       ('Thursday',	'ertetr',	'B8',	'2020',	'A',	'5',	'105',	'5',	'10003',	'3','open?'),
       ('thuesday',	'asdad',	'B8',	'2020',	'A',	'6',	'106',	'6',	'10004',	'4','open?'),
       ('Friday',	'asds',	    'B4',	'2021',	'S', 	'7',	'107',	'1',	'10005',	'5','open?'),
       ('friday',	'dsfsf',	'B4',	'2021',	'A', 	'8',	'108',	'2',	'10005',	'5','open?'),
       ('Monday',	'asda',	    'B8',	'2021',	'A', 	'9',	'109',	'3',	'10006',	'6','open?'),
       ('Thursday',	'asdf',	    'B8',	'2021',	'S', 	'10',	'110',	'4',	'10007',	'7','open?'),
       ('Monday',	'asdas',	'B9',   '2021',	'S', 	'11',	'111',	'5',	'10008',	'8','open?'),
       ('thuesday',	'adtht',	'B9',	'2021',	'S',	'12',	'112',	'6',	'10001',	'1','open?');  
       
INSERT INTO INCLUDES
VALUES      ('2019',	'eng',	'S', 	'1'),
            ('2020',	'eng',	'A',	'1'),
            ('2021',	'eng',	'S', 	'3'),
            ('2019',	'tr',	'A',	'4'),
            ('2020',	'tr',	'S', 	'5');
           
  
  INSERT INTO HAS
  VALUES ('1',	'java'),
         ('2',	'python'), 
         ('3',	'object'),
         ('4',	'data'),
         ('5',	'database'),
         ('6',	'mobile application'),
         ('7',	'java'),
         ('8',	'python'), 
         ('9',	'object'),
         ('10',	'data'),
         ('11',	'database'),
         ('12',	'mobile application'),
         ('13',	'java'),
         ('14',	'python'),
         ('15',	'object'),
         ('1',	'data'),
         ('2',	'database'),
         ('3',	'mobile application');
           
           
INSERT INTO TAKES
VALUES ('101',	'5200000027',	'90'),
       ('102',	'5190000077',	'85'),
       ('103',	'1010101010',	'87'),
       ('104',	'1212121212',	'92'),
       ('105',	'1313131313',	'67'),
       ('106',	'1414141414',	'45'),
       ('107',	'1515151515',	'77'),
       ('108',	'5200000027',	'73'),
       ('109',	'5190000077',	'98'),
       ('110',	'1010101010',	'68'),
       ('111',	'1212121212',	'12'),
       ('112',	'1313131313',	'54'),
       ('101',	'1414141414',	'61'),
       ('102',	'1515151515',	'79');           
         
         
INSERT INTO RESEARCHS
VALUES ('10001',	'oop'),
       ('10002',	'algoritma'),
       ('10003',	'oop'),
       ('10004',	'big data'),
       ('10005',	'data securty'),
       ('10006',	'game application'),
       ('10007',	'ayrık math'),
       ('10009',	'oop'),
       ('10001',	'algoritma'),
       ('10002',	'oop'),
       ('10003',	'big data'),
       ('10004',	'data securty'),
       ('10005',	'game application'),
       ('10006',	'ayrık math'),
       ('10008',	'oop');
                





INSERT INTO COMPUTER_ENGINEERING
VALUES ('1001'),
       ('1002'); 

INSERT INTO SOFTWARE_ENGINEERING
VALUES ('1003'),
       ('2001'); 
       
INSERT INTO ARTIFICIAL_INTELLIGENCE
VALUES ('2002'),
       ('2003');   
       
       
 

ALTER TABLE CURRICULUM
ADD CONSTRAINT FK_curriculum_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE COLLEGE 
ADD CONSTRAINT FK_college_fmid FOREIGN KEY (fmid)
REFERENCES PROFESSOR(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DEPT 
ADD CONSTRAINT FK_dept_cname FOREIGN KEY (cname)
REFERENCES COLLEGE(cname) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DEPT 
ADD CONSTRAINT FK_dept_chairid FOREIGN KEY (chairid)
REFERENCES PROFESSOR(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE RESEARCH_AREA
ADD CONSTRAINT FK_researcharea_keywordname FOREIGN KEY (keywordname)
REFERENCES KEYWORDS(keywordname) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SECTION
ADD CONSTRAINT FK_section_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SECTION
ADD CONSTRAINT FK_section_lecid FOREIGN KEY (lecid)
REFERENCES LECTURER(lecid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SECTION
ADD CONSTRAINT FK_section_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE STUDENT
ADD CONSTRAINT FK_student_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE HAS
ADD CONSTRAINT FK_has_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE HAS
ADD CONSTRAINT FK_has_keywordname FOREIGN KEY (keywordname)
REFERENCES KEYWORDS(keywordname) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TAKES
ADD CONSTRAINT FK_takes_secid FOREIGN KEY (secid)
REFERENCES SECTION(secid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TAKES
ADD CONSTRAINT FK_takes_sid FOREIGN KEY (sid)
REFERENCES STUDENT(sid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE INCLUDES
ADD CONSTRAINT FK_includes_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE INCLUDES
ADD CONSTRAINT FK_includes_ysl FOREIGN KEY (year,semester,language)
REFERENCES CURRICULUM(year,semester,language) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE RESEARCHS 
ADD CONSTRAINT FK_researchs_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE RESEARCHS 
ADD CONSTRAINT FK_researchs_raname FOREIGN KEY (raname)
REFERENCES RESEARCH_AREA(raname) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE COMPUTER_ENGINEERING
ADD CONSTRAINT FK_CE_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SOFTWARE_ENGINEERING
ADD CONSTRAINT FK_SE_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ARTIFICIAL_INTELLIGENCE
ADD CONSTRAINT FK_AI_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE MANDATORY
ADD CONSTRAINT FK_mandatory_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TECHNICAL
ADD CONSTRAINT FK_tecnichal_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE NON_TECHNICAL
ADD CONSTRAINT FK_nontecnichal_ccode FOREIGN KEY (ccode)
REFERENCES COURSE(ccode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE FACULTY_MEMBER
ADD CONSTRAINT FK_FM_dcode FOREIGN KEY (dcode)
REFERENCES DEPT(dcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE RESEARCH_ASSISTANT
ADD CONSTRAINT FK_RA_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LECTURER
ADD CONSTRAINT FK_lecturer_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE PROFESSOR
ADD CONSTRAINT FK_prof_lecid FOREIGN KEY (lecid)
REFERENCES LECTURER(lecid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ASSOCIATE_PROFESSOR
ADD CONSTRAINT FK_Associateprof_lecid FOREIGN KEY (lecid)
REFERENCES LECTURER(lecid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ASSISTANT_PROFESSOR
ADD CONSTRAINT FK_assistantprof_lecid FOREIGN KEY (lecid)
REFERENCES LECTURER(lecid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE INSTRUCTOR
ADD CONSTRAINT FK_instructor_lecid FOREIGN KEY (lecid)
REFERENCES LECTURER(lecid) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE PROFESSOR
ADD CONSTRAINT FK_prof_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ASSOCIATE_PROFESSOR
ADD CONSTRAINT FK_Associateprof_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ASSISTANT_PROFESSOR
ADD CONSTRAINT FK_assistantprof_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE INSTRUCTOR
ADD CONSTRAINT FK_instructor_fmid FOREIGN KEY (fmid)
REFERENCES FACULTY_MEMBER(fmid) ON DELETE CASCADE ON UPDATE CASCADE;





