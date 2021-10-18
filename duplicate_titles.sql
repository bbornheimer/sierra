SELECT title, COUNT(title) 
FROM sierra_view.bib_view
GROUP BY title
HAVING ( COUNT(title) > 1 );