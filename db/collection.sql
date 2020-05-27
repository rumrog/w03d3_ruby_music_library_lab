DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    artist_id INT REFERENCES artist(id),
    title VARCHAR(255),
    genre VARCHAR(255),
    year INT
);
