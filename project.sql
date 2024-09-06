CREATE DATABASE project;
use project;
set foreign_key_checks=0;
CREATE TABLE journal(
  name varchar(120) not null,
  frequency varchar(150),
  primary key(name)
);

CREATE TABLE keywords(
	 keywId int not null,
     keyword varchar(130),
     primary key(keywId)
);

CREATE TABLE volume(
   id int not null,
   name varchar(120) not null,
   dates Date,  
   publicationDate Date,
   primary key(id,name),
   foreign key(name) references journal(name)
);

CREATE TABLE Person(
     email varchar(160) not null,
     name varchar(150) not null,
     vid int not null,
     vname varchar(120) not null,
     isAuthor boolean,
     isReviewer boolean,
     isEditor boolean,
     primary key(email, vid, vname),
     foreign key(vid) references volume(id),
     foreign key(vname) references volume(name)
);

CREATE TABLE article(
      id int not null,
      title varchar(120),
      bodyText text,
      volId int,
      volName varchar(120) not null,
      correspAut varchar(160),
      submissionDate date,
      result varchar(130),
      primary key(id),
	  foreign key(volId) references volume(id),
	  foreign key(volName) references volume(name),
      foreign key(correspAut) references Person(email) 
);


CREATE TABLE ArticleReviews(
	  id int not null,
      email varchar(160) not null,
      scoreOfTheReviewer float,
      primary key(id,email),
      foreign key(email) references person(email),
      foreign key(id) references article(id)
);

CREATE TABLE VolumeTheme(
    id int not null,
	name varchar(120) not null,
    keywId int not null,
    primary key(id,name,keywId),
    foreign key(id) references volume(id),
    foreign key(name) references volume(name),
    foreign key(keywId) references keywords(keywId)
);


CREATE TABLE personInterest(
     email varchar(160) not null,
     keywId int not null,
     primary key(email, keywId),
     foreign key(email) references person(email),
     foreign key(keywId) references keywords(keywId)
);

CREATE TABLE WrittenBy(
     id int not null,
     email varchar(160) not null,
     primary key(id, email),
     foreign key(id) references article(id),
     foreign key(email) references person(email)
);

CREATE TABLE ArticleKeywords(
      aid int not null,
      keywId int not null,
      primary key(aid,keywId),
      foreign key(aid) references article(id),
      foreign key(keywId) references keywords(keywId)
);


INSERT INTO journal VALUES ('The Journey Within','Monthly');
INSERT INTO journal VALUES ('The Magic of Manifestation','Bi-Monthly');
INSERT INTO journal VALUES ('A Life of Purpose','Quarterly');
INSERT INTO journal VALUES ('The Power of Positivity','Semi-annually');
INSERT INTO journal VALUES ('Path to Happiness','Annual');

INSERT INTO keywords VALUES (1,'History');
INSERT INTO keywords VALUES (2,'Science');
INSERT INTO keywords VALUES (3,'Environment');
INSERT INTO keywords VALUES (4,'Technology');
INSERT INTO keywords VALUES (5,'Philosophy');

INSERT INTO volume (id, name, dates,publicationDate) VALUES
(1, 'Volume 1', '2018-01-22','2018-01-22'),
(2, 'Volume 2', '2020-11-06','2020-11-06'),
(3, 'Volume 3', '2022-05-14','2022-05-14'),
(4, 'Volume 4', '2019-02-12','2019-02-12'),
(5, 'Volume 5', '2021-08-22','2021-08-22');

INSERT INTO Person (email, name, vid, vname, isAuthor, isReviewer, isEditor) VALUES
('jones@db.com','Jones',1,'Volume 1',0,1,1),
('shero@db.com','Shero',2,'Volume 2',0,1,1),
('dustin@db.com','Dustin',3,'Volume 3',0,1,1),
('lubber@db.com','Lubber',4,'Volume 4',0,0,0),
('justin@db.com','Justin',5,'Volume 5',0,1,1);

INSERT INTO article(id, title, bodyText, volId, volName, correspAut, submissionDate, result) VALUES
(1,'Tech Trends 2024: Whats Next?',"As we step into the year 2024,
 technology continues to evolve at a rapid pace.", 1,'Volume 1','Jones','2020-04-22','Published'),
(2,'The Power of Positivity',"In today's fast-paced world, staying positive 
 can be a challenge.", 2,'Volume 2','Shero', '2021-12-20','Published'),
(3,'The Future of Transportation',"From electric cars to hyperloop trains, the future of transportation 
is fast approaching.", 3,'Volume 3', 'Lubber', '2022-09-15','Rejected'),
(4,'Healthy Habits',"In today's hectic world, prioritizing health and wellness can o
ften take a backseat.", 4,'Volume 4','Justin', '2023-03-24','Published' ),
(5,'Mindfulness in Daily Life',"Taking the time to be present and aware can have profound effects on our overall
 happiness and well-being.", 5,'Volume 5', 'Dustin','2020-04-22', 'Reviewing');

INSERT INTO ArticleReviews(id,email,scoreOfTheReviewer) VALUES
(1,'justin@db.com',0),
(2, 'shero@db.com',1),
(3, 'shero@db.com',0.5),
(4, 'dustin@db.com',0.5),
(5, 'shero@db.com',1),
(6, 'shero@db.com',0),
(7, 'justin@db.com',0.5),
(8, 'dustin@db.com',1),
(9, 'shero@db.com',0),
(10, 'justin@db.com',1);

INSERT INTO VolumeTheme(id,name,keywId) VALUES
(1,'Future Forward',1),
(2,'AI',2),
(3,'Balance',3),
(4,'Happines',4),
(5,'Life',5),
(6,'Art',6),
(7,'Technology',7),
(8,'Mind',8),
(9,'Climate',9),
(10,'Culture',10);

INSERT INTO personInterest(email,keywID) VALUES
('justin@db.com',1),
('lubber@db.com',2),
('jones@db.com',3),
('dustin@db.com',4),
('shero@db.com',5),
('lubber@db.com',6),
('justin@db.com',7),
('dustin@db.com',8),
('shero@db.com',9),
('jones@db.com',10);

INSERT INTO WrittenBy(id, email) VALUES
(1,'lubber@db.com'),
(2, 'jones@db.com'),
(3, 'shero@db.com'),
(4, 'dustin@db.com'),
(5, 'jones@db.com'),
(6, 'shero@db.com'),
(7, 'justin@db.com'),
(8, 'lubber@db.com'),
(9, 'shero@db.com'),
(10, 'justin@db.com');

INSERT INTO ArticleKeywords(aid,keywId) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


use project;
#1)List the articles submitted to V.
SELECT * FROM article WHERE volId=1;

#2)List the people who are not editor, not author not reviewer in a V.
SELECT * FROM Person WHERE vid=4 AND isEditor=false AND isAuthor=false AND isReviewer=false;
 
#3)List the people who can be assigned as a reviewer to any AR of V [consider keywords also!].
SELECT * FROM Person p
JOIN ArticleReviews AS ar ON p.email = ar.email
JOIN article AS a ON ar.id = a.id
JOIN volume AS v ON a.volId = v.id
WHERE a.volName = 'Volume 1' AND p.isReviewer = 1;

#4)List the reviewers of S, and the scores they assigned
SELECT email, scoreOfTheReviewer FROM ArticleReviews WHERE id=1; 

#5)Calculate the result as accept or reject or revision of S based on the scores assigned by reviewers
SELECT
    IF(AVG(AR.scoreOfTheReviewer) = 0, 'reject',
    IF(AVG(AR.scoreOfTheReviewer) < 1, 'revision', 'Published')) AS Result
FROM ArticleReviews AR
JOIN article A ON AR.id = A.id
WHERE A.submissionDate IS NOT NULL;

#6)List the corresponding authors and titles of accepted articles’ of V
SELECT P.name AS CorrespondingAuthor, A.title AS ArticleTitle
FROM article A
JOIN Person P ON A.correspAut = P.email
JOIN ArticleReviews AR ON A.id = AR.id
WHERE AR.scoreOfTheReviewer = 1
AND A.result = 'Published'
AND A.volName = 'Volume 2';  

#7)For V, list the submitted articles’ titles, the authors, and reviewers’ names assigned to
SELECT A.title AS ArticleTitle, 
       P.name AS AuthorName, 
       AR.email AS ReviewerEmail
FROM article A
JOIN Person P ON A.correspAut = P.email
LEFT JOIN ArticleReviews AR ON A.id = AR.id
WHERE A.volName = 'Volume 2';

#8)List the people who reviewed the minimum number of articles. 
SELECT email, COUNT(id) AS reviewnumbers FROM ArticleReviews GROUP BY email HAVING reviewnumbers = 
(SELECT MIN(count) FROM (SELECT COUNT(id) AS count FROM ArticleReviews GROUP BY email) AS T);
        
#9)List the most productive people (authors whose has the maximum number of accepted articles)
SELECT correspAut, COUNT(*) AS numOfacceptedArticles 
FROM article WHERE result = 'Published' GROUP BY correspAut  ORDER BY numOfacceptedArticles DESC;

#10)List the articles’ titles of A with the status of each.
SELECT title, result AS stat FROM article WHERE correspAut='Justin';
