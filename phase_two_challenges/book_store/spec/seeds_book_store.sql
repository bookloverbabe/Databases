-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

# INSERT INTO author_name (author_name) VALUES ('George Orwell');

INSERT INTO books (id, title, author_name) VALUES (1, 'Nineteen Eighty-Four', 'George Orwell');

SELECT * FROM books;