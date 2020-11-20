
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY NOT NULL,
    category_name VARCHAR (200)
)

CREATE TABLE streaming (
    streaming_id SERIAL PRIMARY KEY NOT NULL,
    streaming_name VARCHAR (200)
)


CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY NOT NULL,
    movie_img VARCHAR(200),
    movie_name VARCHAR(100) NOT NULL,
    movie_date DATE,
    movie_trailer VARCHAR (300),
    movie_actors VARCHAR (200),
    movie_duration TIME,
    movie_description VARCHAR (1000),
    category_id INT references category(category_id),
    streaming_id INT references streaming(streaming_id)
)

CREATE TABLE review (
    review_id SERIAL PRIMARY KEY NOT NULL,
    review_date DATE,
    review_description VARCHAR (1000),
    movie_id  INT references movie(movie_id)
)


GRANT SELECT, INSERT, UPDATE, DELETE ON review TO projecttwouser;
GRANT USAGE, SELECT ON SEQUENCE review_review_id_seq TO projecttwouser;



INSERT INTO category (category_name) VALUES ('Family Movie');

INSERT INTO category (category_name) VALUES ('SuperHero');

INSERT INTO category (category_name) VALUES ('Action');

INSERT INTO category (category_name) VALUES ('Romance');

INSERT INTO category (category_name) VALUES ('Series');

INSERT INTO category (category_name) VALUES ('Documentaries');



ALTER TABLE streaming ADD streaming_img VARCHAR(200);

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Netflix', '/img/netflix.png');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Disney Plus', '/img/disney.jpg');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Prime Video', '/img/prime.png');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Hulu', '/img/hulu.jpg');




INSERT INTO movie(
    movie_name, movie_date, movie_actors, movie_duration, movie_description, movie_img)
    VALUES ('The Lion King', '2019-07-19', 'Donald Glover, Beyonce, Seth Rogen, Billy Eichnner, Chiwetel Ejiofor', '01:58:00', 
    'Simba idolizes his father, King Mufasa, and takes to heart his own royal destiny on the plains of Africa. But not everyone in the kingdom celebrates the new cubs arrival. Scar, Mufasa"s brother -- and former heir to the throne -- has plans of his own. The battle for Pride Rock is soon ravaged with betrayal, tragedy and drama, ultimately resulting in Simba"s exile. Now, with help from a curious pair of newfound friends, Simba must figure out how to grow up and take back what is rightfully his.',
    '/projecttwo/img/lion.jpg')


INSERT INTO movie(
    movie_name, movie_date, movie_actors, movie_duration, movie_description, movie_img)
    VALUES ('Beauty and the Beast', '2017-03-17', 'Emma Watson, Dan Stevens, Luke Evans, Josh Gad, Emma Thompson', '02:19:00', 
    'An arrogant prince is cursed to live as a terrifying beast until he finds true love. Strangely, his chance comes when he captures an unwary clockmaker, whose place is then taken by his bold and beautiful daughter Belle. Helped by the Beast"s similarly enchanted servants, including a clock, a teapot and a candelabra, Belle begins to see the sensitive soul behind the fearsome facade. But as time runs out, it soon becomes obvious that Belle"s cocky suitor Gaston is the real beast of the piece',
    '/projecttwo/img/beauty.jpg')

INSERT INTO movie(
    movie_name, movie_date, movie_actors, movie_duration, movie_description, movie_img)
    VALUES ('Onward', '2020-03-06', 'Tom Holland, Chris Pratt, Octavia Spencer, Julia Louis, Ali Wong', '01:42:00', 
    'Teenage elf brothers Ian and Barley embark on a magical quest to spend one more day with their late father. Like any good adventure, their journey is filled with cryptic maps, impossible obstacles and unimaginable discoveries. But when dear Mom finds out her sons are missing, she teams up with the legendary manticore to bring her beloved boys back home.',
    '/projecttwo/img/onward.jpg')

    INSERT INTO movie(
    movie_name, movie_date, movie_actors, movie_duration, movie_description, movie_img)
    VALUES ('Spider-Man: Into the Spider-Verse', '2018-12-14', 'Shameik Moore, Hailee Steinfeld, Jake Jhonson, Nicolas Cage', '01:56:00', 
    'Bitten by a radioactive spider in the subway, Brooklyn teenager Miles Morales suddenly develops mysterious powers that transform him into the one and only Spider-Man. When he meets Peter Parker, he soon realizes that there are many others who share his special, high-flying talents. Miles must now use his newfound skills to battle the evil Kingpin, a hulking madman who can open portals to other universes and pull different versions of Spider-Man into our world.',
    '/projecttwo/img/spider.jpg')

