-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE Goodreads_Books (
    title VARCHAR   NOT NULL,
    authors VARCHAR   NOT NULL,
    average_rating float   NOT NULL,
    isbn VARCHAR   NOT NULL,
    num_pages int   NOT NULL,
    CONSTRAINT pk_Goodreads_Books PRIMARY KEY (
        isbn
     )
);

CREATE TABLE Books_Urls (
    isbn VARCHAR   NOT NULL,
    library_url VARCHAR   NOT NULL
);

ALTER TABLE Books_Urls ADD CONSTRAINT fk_Books_Urls_isbn FOREIGN KEY(isbn)
REFERENCES Goodreads_Books (isbn);

-- Join the data table together
CREATE TABLE combined_all 
as SELECT goodreads_books.*, books_urls.library_url
FROM goodreads_books LEFT JOIN books_urls
ON goodreads_books.isbn = books_urls.isbn;

-- print out to ensure table loaded correctly 
SELECT *
FROM combined_all;