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

/* TABLES FOR GENRE AND MUSIC_ALBUM */
CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  author_id INT, 
  source_id INT,   
  label_id INT,
  CONSTRAINT fk_author
    FOREIGN KEY (author_id)
      REFERENCES  author(id),
  CONSTRAINT fk_source
    FOREIGN KEY (source_id)
      REFERENCES  source(id),
  CONSTRAINT fk_genres
    FOREIGN KEY (genres_id)
      REFERENCES genres(id),
  CONSTRAINT fk_label
    FOREIGN KEY (label_id)
      REFERENCES  label(id)
);

CREATE TABLE genres (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(150)
);

CREATE TABLE games (
  published_date DATE,
  last_played_at DATE,
  multiplayer BOOLEAN, 
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES authors (id), 
  label_id INT REFERENCES label (id),
)

CREATE TABLE authors (
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
)