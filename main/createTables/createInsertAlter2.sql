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
VALUES ('EGE UNIVERSITY', 'BORNOVA', '232 311 10 10',	'10001'),
       ('DOKUZ EYLÜL UNIVERSITY',	'BUCA',	'232 412 12 12', '10005');
     
INSERT INTO DEPT
VALUES ('1001',	'COMPUTER ENGINEERING',	'232 311 10 10', 'EGE UNIVERSITY', '10001',	'2020.01.01'),
       ('1002',	'SOFTWARE ENGINEERING',	'232 311 10 10', 'EGE UNIVERSITY',	'10003',	'2020.02.03'),
       ('1003',	'ARTIFICAL ENGINEERING', '232 311 10 10', 'EGE UNIVERSITY',	'10004',	'2020.05.06'),
       ('2001',	'COMPUTER ENGINEERING',	'232 412 12 12', 'DOKUZ EYLUL UNIVERSITY',	'10005', '2020.02.15'),
       ('2002',	'SOFTWARE ENGINEERING',	'232 412 12 12', 'DOKUZ EYLUL UNIVERSITY',	'10007', '2020.01.09'),
       ('2003',	'ARTIFICAL ENGINEERING', '232 412 12 12', 'DOKUZ EYLUL UNIVERSITY',	'10008',	'2020.06.12');
     
INSERT INTO FACULTY_MEMBER
VALUES ('10001',    '1', 'MURAT OSMAN UNALIR',	'egebilmuh.1',	'232 388 72 21', '1001'),	
       ('10002',	'2',	'AYBARS UĞUR',	'egebilmuh.2',	'232 311 10 10',	'1001'),	
       ('10003',	'3',	'HAKAN YILMAZ',	'egesofteng.1', '232 311 10 10', '1002'),	
	   ('10004',	'4',	'AHMET YAŞAR',	'egearteng.1',	'232 311 10 10', '1003'),	
       ('10005',	'5',	'AYBARS UĞUR',	'deu.ceng',	'232 311 53 22',	'2001'),	
       ('10006',	'6',	'LEVENT TOKER', 'deu.sofeng',	'232 311 25 85',	'2002'),
       ('10007',	'7',	'ŞEBNEM BORA', 'ege.arteng',	'232 311 25 84',	'1003'),
       ('10008',	'8',	'RIZA CENK ERDUR',	'deu.arteng',	'232 311 25 97',	'2003'),	
	   ('10009',	null,	'ERCAN GÜNBİLEK',	'ege.softeng',	'232 311 53 09',	'1002'),	
	   ('10010',    '9',    'EMİNE SEZER',  'deu.softeng',    '232 311 25 95', '1002'),   
	   ('10011',    '10',    'ÖZGÜ CAN',  'deu.ceng1',    '232 311 53 32', '2001'), 
	   ('10012',    '11',    'HASAN BULUT',  'deu.arteng',    '232 311 25 96', '2003'), 
       ('10013',    '12',    'VECDİ AYTAÇ',  'deu.arteng1',    '232 311 53 24', '2003'),
	   ('10014',	null,	'SEZERCAN TANIŞMAN',	'ege.ceng',	'232 311 53 26',	'1001'),	
       ('10015',	null,	'HÜSEYİN UYAR', 'deu.sofeng',	'232 311 53 31',	'2002'),
       ('10016',	null,	'HAZAL TÜRKMEN', 'deu.sofeng',	'232 311 30 82',	'2002');
        
INSERT INTO LECTURER
VALUES ('10001',	'1'),	
	   ('10002',	'2'),	
       ('10003',	'3'),	
       ('10004',	'4'),	
       ('10005',	'5'),	
       ('10006',	'6'),	
       ('10007',	'7'),	
       ('10008',	'8'),
       ('10010',    '9'),
       ('10011',    '10'),
       ('10012',    '11'),
       ('10013',    '12')
       ;
       
INSERT INTO PROFESSOR
VALUES ('10001',	'1'),
       ('10003',	'3'),
       ('10004',	'4'),
       ('10005',	'5'),
       ('10007',	'7'),
       ('10008',	'8'); 
       
       
       
INSERT INTO ASSOCIATE_PROFESSOR
VALUES  ('10002', '2'),
		('10010',    '9'),
        ('10012',    '11');
           

INSERT INTO ASSISTANT_PROFESSOR
VALUES  ('10006', '6'),
		('10013',    '12');    

INSERT INTO INSTRUCTOR
VALUES  ('10010', '9'),
		('10011',    '10'); 

INSERT INTO RESEARCH_ASSISTANT
VALUES  ('10009'),
		('10014'), 
		('10015'),
		('10016');  


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
         ('mobile application'),
         ('math');    
         
INSERT INTO RESEARCH_AREA
VALUES     ('oop',		'java'),
             ('oop',		'design patterns'),
             ('oop','object'),
		   ('algoritma',		'python'), 
            ('algoritma',	'optimization algorithms'),
           ('big data',	'data'),
           ('data security',	'database'),
           ('game application',	'mobile application'),
           ('ayrık mat','math');
           
INSERT INTO COURSE
VALUES  ('1',	'database management',	'4',	'1',	'asda'),
		('2',	'ayrık yapılar',	'4',	'1',	'sdfsfs'),
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
VALUES   ('5200000027',	'2002.10.04',	'Duru', null,	'Pabuşçu',	'izmir',	'551 553 72 60',	'engineerring',	'1001'),
         ('7190000077',	'2000.12.12',	'Emre', 'Hüseyin',	'Sarıoğlu',	'kocaeli',	'507 949 54 76',	'engineerring',	'2001'),
         ('5200000048',	'1999.11.25',	'Mira', null,	'Beylice',	'istanbul',	'552 765 87 89',	'engineerring',	'1002'),
         ('7000000125',	'1997.06.17',	'Yaman', null,	'Koper',	'istanbul',	'534 467 90 92',	'engineerring',	'2002'),
         ('5180000032',	'2002.09.06',	'Eylül', null,	'Buluter',	'izmir',	'506 789 34 65',	'engineerring',	'1003'),
         ('7180000099',	'2001.11.15',	'Mert',	 'Asım',   'Serez',	    'ankara',	'512 911 23 95',	'engineerring',	'2003'),
         ('5210000010',	'2000.10.10',	'Orkun', null,	'Işık',	    'erzurum',	'515 330 75 57',	'engineerring',	'1001');     
        
        
INSERT INTO SECTION
VALUES ('Monday',	'A7',	    'B4',	'2020',	'S',	'1',	'101',	'1',	'10001',	'1','open?'),
       ('Monday',	'A7',	    'B4',	'2020',	'A',	'2',	'102',	'2',	'10002',	'2','open?'),
       ('Friday',	'C8',	'B7',	'2020',	'S', 	'3',	'103',	'3',	'10011',	'10','open?'),
       ('thursday',	'C8',	    'B3',	'2020',	'S', 	'4',	'104',	'4',	'10003',	'3','open?'),
       ('Thursday',	'D1',	'B8',	'2020',	'A',	'5',	'105',	'5',	'10003',	'3','open?'),
       ('thuesday',	'D1',	'B8',	'2020',	'A',	'6',	'106',	'6',	'10004',	'4','open?'),
       ('Friday',	'A2',	    'B4',	'2021',	'S', 	'7',	'107',	'1',	'10005',	'5','open?'),
       ('friday',	'A2',	'B4',	'2021',	'A', 	'8',	'108',	'2',	'10005',	'5','open?'),
       ('Monday',	'B2',	    'B8',	'2021',	'A', 	'9',	'109',	'3',	'10006',	'6','open?'),
       ('Thursday',	'B2',	    'B8',	'2021',	'S', 	'10',	'110',	'4',	'10007',	'7','open?'),
       ('Monday',	'B2',	'B9',   '2021',	'S', 	'11',	'111',	'5',	'10008',	'8','open?'),
       ('thuesday',	'B2',	'B9',	'2021',	'S',	'12',	'112',	'6',	'10001',	'1','open?');       
       
INSERT INTO INCLUDES
VALUES      ('2019',	'eng',	'S', 	'1'),
            ('2020',	'eng',	'A',	'1'),
            ('2021',	'eng',	'S', 	'3'),
            ('2019',	'tr',	'A',	'4'),
            ('2020',	'tr',	'S', 	'5');
           
  
  INSERT INTO HAS
  VALUES ('1',	'data'),
	     ('2',	'math'),
         ('2',	'java'),
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
         ('3',	'mobile application');
           
           
INSERT INTO TAKES
VALUES ('101',	'5200000027',	'91'),
			('101',	'5180000032',	'86'),
			('101',	'7190000077',	'79'),
			('101',	'5200000048',	'95'),
	     ('101',	'5210000010',	'77'),
         ('101',	'7000000125',	'77'),
		 ('101',	' 7180000099',	'77'),
       
         ('102',	'5200000027',	'85'),
        ('102',	'5180000032',	'85'),
         ('102',	'7190000077',	'85'),
          ('102',	'5200000048',	'85'),
           ('102',	'7000000125',	'85'),
          
          
       ('103',	'5200000027',	'87'),
        ('103',	'5180000032',	'87'),
         ('103',	'7190000077',	'87'),
          ('103',	'5200000048',	'87'),
          ('103',	'7000000125',	'87'),
         
       ('104',	'5200000027',	'92'),
       ('104',	'5180000032',	'92'),
       ('104',	'7190000077',	'92'),
       ('104',	'5200000048',	'92'),
       ('104',	'7000000125',	'87'),
      
      
       ('108',	'7000000125',	'67'),
       ('108',	'5210000010',	'67'),
       ('108',	'5200000048',	'67'),
       ('108',	'7190000077',	'67'),
       ('108',	'5200000027',	'67'),
      
	    ('109',	'7000000125',	'67'),
       ('109',	'5210000010',	'67'),
       ('109',	'5200000048',	'67'),
       ('109',	'7190000077',	'67'),
       ('109',	'5200000027',	'67'),
       
       ('110',	'5210000010',	'67'),
       ('110',	'5200000048',	'67'),
       ('110',	'7190000077',	'67'),
       ('110',	'5200000027',	'67'),
       ('110',	'5180000032',	'54'),
       
       	    ('111',	'7000000125',	'67'),
       ('111',	'5210000010',	'67'),
       ('111',	'5200000048',	'67'),
       ('111',	'7190000077',	'67'),
         ('111',	'5180000032',	'54'),
      
       ('106',	'5210000010',	'45'),
       ('105',	'5210000010',	'73'),
       ('107',	'5210000010',	'98'),
       ('112',	'5180000032',	'54');           
         
         
INSERT INTO RESEARCHS
VALUES ('10001',	'big data'),
		('10001',	'data security'),
       ('10002',	'ayrık mat'),
       ('10002','oop'),
       ('10003',	'oop'),
       ('10004',	'big data'),
       ('10005',	'data security'),
       ('10006',	'game application'),
       ('10007',	'ayrık mat'),
       ('10009',	'oop'),
       ('10013',	'algoritma'),
       ('10003',	'big data'),
       ('10004',	'data security'),
       ('10005',	'game application'),
       ('10006',	'ayrık mat'),
       ('10008',	'oop'),
       ('10010', 'algoritma'  ),   
	   ('10011',  'oop'), 
	   ('10012',  'game application'  );

INSERT INTO COMPUTER_ENGINEERING
VALUES ('1001'),
       ('2001'); 

INSERT INTO SOFTWARE_ENGINEERING
VALUES ('1002'),
       ('2002'); 
       
INSERT INTO ARTIFICIAL_INTELLIGENCE
VALUES ('1003'),
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
