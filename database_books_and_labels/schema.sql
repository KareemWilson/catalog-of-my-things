/* Database schema to keep the structure of entire database. */
CREATE DATABASE catalog_of_my_things;

CREATE TABLE book (
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
);

CREATE TABLE label (
  id INT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  items OBJECT []
);
