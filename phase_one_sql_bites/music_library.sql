-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: design
-- Generation Time: 2022-04-27 17:13:27.2140
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."albums";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS albums_id_seq;

-- Table Definition
CREATE TABLE "public"."albums" (
    "id" SERIAL,
    "title" text,
    "release_year" int4,
    "artist_id" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."artists";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS artists_id_seq;

-- Table Definition
CREATE TABLE "public"."artists" (
    "id" SERIAL,
    "name" text,
    "genre" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES
('Doolittle', 1989, 1),
('Surfer Rosa', 1988, 1),
('Waterloo', 1974, 2),
('Super Trouper', 1980, 2),
('Bossanova', 1990, 1),
('Lover', 2019, 3),
('Folklore', 2020, 3),
('I Put a Spell on You', 1965, 4),
('Baltimore', 1978, 4),
( 'Here Comes the Sun', 1971, 4),
( 'Fodder on My Wings', 1982, 4),
( 'Ring Ring', 1973, 2);

INSERT INTO "public"."artists" ("name", "genre") VALUES
('Pixies', 'Rock'),
('ABBA', 'Pop'),
('Taylor Swift', 'Pop'),
('Nina Simone', 'Pop');

SELECT * FROM artists;

SELECT id, title FROM albums;

SELECT id, title, release_year
  FROM albums
  WHERE release_year > 1990;

SELECT release_year FROM albums;

SELECT id, title, release_year
  FROM albums 
 WHERE release_year > 1980 AND release_year < 1990;

-- Update the release_year of the album with ID 3 to the value 1972.
UPDATE albums
   SET release_year = 1972
 WHERE id = 3;

-- Check that the update was successful
 SELECT id, title, release_year
   FROM albums
   WHERE release_year = 1972;

-- Update the title and release_year of the album with ID 1 (in a single query). 
-- Then use a SELECT query to get the list of albums and verify that one has been updated.
UPDATE albums
  SET release_year = 1972, title = 'new title'
 WHERE id = 1;

SELECT id, title, release_year
  FROM albums
  WHERE id = 1;

-- Delete the album with ID 12. Then use a SELECT query to get the list of albums
-- and verify that one has been deleted.
DELETE FROM albums
      WHERE id = 12

SELECT id, title, release_year
  FROM albums
  WHERE id = 12;

-- INSERT a new record in albums with title 'Mezzanine', and release year 1998.
INSERT INTO albums (title, release_year)
     VALUES ('Mezzanine', 1998);

SELECT id, title, release_year
  FROM albums
  WHERE title = 'Mezzanine';

-- We forgot to link this new record with the correct artist. 
-- Use an UPDATE query to update the artist_id of that new album with Massive Attack 
-- (it should have the id value 5).

UPDATE albums
  SET artist_id = 5
WHERE id = 13;

SELECT id, title, release_year, artist_id
  FROM albums
  WHERE title = 'Mezzanine';

-- Insert a new artist of your choice, and a new album related to that artist 
-- Then run a SELECT query to check the new artist is now in the table.

INSERT INTO albums (title, release_year, artist_id)
     VALUES ('OK Computer', 1997, 6);

INSERT INTO artists (name, genre)
     VALUES('Radiohead', 'alternative rock');

SELECT id, title, release_year, artist_id
  FROM albums
WHERE title = 'OK Computer';