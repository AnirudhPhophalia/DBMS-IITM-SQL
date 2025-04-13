SELECT book_catalogue.title
FROM book_catalogue
JOIN book_authors ON book_catalogue.ISBN_no = book_authors.ISBN_no
WHERE book_authors.author_fname = 'Joh Paul' 
    AND book_authors.author_lname = 'Mueller'
