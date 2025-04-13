SELECT 
    COUNT(accession_no) AS num
FROM 
    book_issue
WHERE
    doi = '2021-08-11'