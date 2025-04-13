-- Write an SQL statement to find the book titles and the number of copies of the books which has the word 'Programming' in their title

SELECT 
    book_catalogue.title, 
    COUNT(book_copies.accession_no) AS num_copies
FROM 
    book_catalogue
JOIN 
    book_copies ON book_catalogue.ISBN_no = book_copies.ISBN_no
WHERE 
    book_catalogue.title LIKE '%Programming%'
GROUP BY 
    book_catalogue.title
