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