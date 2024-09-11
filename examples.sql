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
