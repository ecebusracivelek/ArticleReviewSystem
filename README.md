Submitter can host for many journals where each journal has a unique name, and can be published in different
frequencies: monthly, bi-monthly, quarterly, semi-annually, annual; where each is called as a volume.
The people involved in the Submitter are: editor(s), author(s), reviewer(s). All need to be registered users, there
is no guest or visitor in the system. A particular person might have different roles in different volumes.
Each volume has an id, which is composition of year and month, like April2024, which becomes unique when
combined with journal name. Each volume has an editor, a theme (nothing but a subset of keywords chosen
by the editor). A person can be an editor of several volumes, and any keyword may appear in more than one
volume’s theme. In addition, some associated dates exist for every volume: 1st submission opening date, 1st
submission deadline, review starting date, review deadline, results announcement date, for the “revision” articles
2nd submission opening date, 2nd submission deadline, publication date. A volume also has a list of reviewers
whose area of interest, i.e. some of the keywords, matches with the theme of volume.
An article has a title, a list of keywords, its body text, and a list of authors where one of them is identified as
“corresponding author”. Corresponding author submits the article to a particular volume. An author can be a
corresponding author of many articles. An article cannot be submitted to more than one volume.
The volume editor, after 1st submission deadline, assigns 3 reviewers for every submitted article considering the
keywords of the articles and reviewers’. Note that, the reviewer cannot be one of the authors of the article, but
may review many articles in volumes.
Every reviewer, after checking the article, assigns one of three values-0, 0.5, 1 - to every article they evaluate.
The state of the article is decided as follows: The average is calculated and if avg==0, reject; if avg<1, revision; 
if avg==1, accept. The articles with revision result need to be resubmitted by their corresponding author again.
If they submit, the state of the article becomes accept, otherwise, if they don’t submit, the state of the article
turns to reject.
After the 2nd submission deadline, the accepted articles’ corresponding authors receive acceptance letters. 
