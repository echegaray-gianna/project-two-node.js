
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY NOT NULL,
    category_name VARCHAR (200)
)

CREATE TABLE streaming (
    streaming_id SERIAL PRIMARY KEY NOT NULL,
    streaming_name VARCHAR (200),
    streaming_img VARCHAR(200)
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




INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Netflix', '/img/netflix.jpg');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Disney Plus', '/img/disney.jpg');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Prime Video', '/img/prime.jpg');

INSERT INTO streaming (streaming_name, streaming_img ) VALUES ('Hulu', '/img/hulu.jpg');


-- DONE

UPDATE streaming SET streaming_img = '/img/netflix.jpg' WHERE streaming_id = 1;

UPDATE streaming SET streaming_img = '/img/disney.jpg' WHERE streaming_id = 2;

UPDATE streaming SET streaming_img = '/img/prime.jpg' WHERE streaming_id = 3;

UPDATE streaming SET streaming_img = '/img/hulu.jpg' WHERE streaming_id = 4;


-- DONE
ALTER TABLE movie ALTER COLUMN movie_date SET DATA type VARCHAR (50);


INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/lion.jpg', 'The Lion King', '2019-07-19', 'https://www.youtube.com/watch?v=7TavVZMewpY', 
     'Donald Glover, Beyonce, Seth Rogen, Billy Eichnner, Chiwetel Ejiofor', '01:58:00', 
    'Simba idolizes his father, King Mufasa, and takes to heart his own royal destiny on the plains of Africa. But not everyone in the kingdom celebrates the new cubs arrival. Scar, Mufasa"s brother -- and former heir to the throne -- has plans of his own. The battle for Pride Rock is soon ravaged with betrayal, tragedy and drama, ultimately resulting in Simba"s exile. Now, with help from a curious pair of newfound friends, Simba must figure out how to grow up and take back what is rightfully his.',
    '1', '2');

 
INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/beauty.jpg', 'Beauty and the Beast', '2017-03-17', 'https://www.youtube.com/watch?v=k-AyhL9AR9Q', 
    'Emma Watson, Dan Stevens, Luke Evans, Josh Gad, Emma Thompson', '02:19:00', 
    'An arrogant prince is cursed to live as a terrifying beast until he finds true love. Strangely, his chance comes when he captures an unwary clockmaker, whose place is then taken by his bold and beautiful daughter Belle. Helped by the Beast"s similarly enchanted servants, including a clock, a teapot and a candelabra, Belle begins to see the sensitive soul behind the fearsome facade. But as time runs out, it soon becomes obvious that Belle"s cocky suitor Gaston is the real beast of the piece',
    '1', '2');

INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/onward.jpg', 'Onward', '2020-03-06', 'https://www.youtube.com/watch?v=gn5QmllRCn4',
    'Tom Holland, Chris Pratt, Octavia Spencer, Julia Louis, Ali Wong', '01:42:00', 
    'Teenage elf brothers Ian and Barley embark on a magical quest to spend one more day with their late father. Like any good adventure, their journey is filled with cryptic maps, impossible obstacles and unimaginable discoveries. But when dear Mom finds out her sons are missing, she teams up with the legendary manticore to bring her beloved boys back home.',
    '1', '2');

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/spider.jpg', 'Spider-Man: Into the Spider-Verse', '2018-12-14', 'https://www.youtube.com/watch?v=g4Hbz2jLxvQ',
    'Shameik Moore, Hailee Steinfeld, Jake Jhonson, Nicolas Cage', '01:56:00', 
    'Bitten by a radioactive spider in the subway, Brooklyn teenager Miles Morales suddenly develops mysterious powers that transform him into the one and only Spider-Man. When he meets Peter Parker, he soon realizes that there are many others who share his special, high-flying talents. Miles must now use his newfound skills to battle the evil Kingpin, a hulking madman who can open portals to other universes and pull different versions of Spider-Man into our world.',
    '2', '1');

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/gemini.jpg', 'Gemini Man', '2019-10-03', 'https://www.youtube.com/watch?v=AbyJignbSj0',
    'Will Smith, Mary Winstead, Clive Owen, Benedic Wong', '01:57:00', 
    'Henry Brogan is an elite 51-year-old assassin who"s ready to call it quits after completing his 72nd job. His plans get turned upside down when he becomes the target of a mysterious operative who can seemingly predict his every move. To his horror, Brogan soon learns that the man who"s trying to kill him is a younger, faster, cloned version of himself.',
    '3', '4');

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/suits.jpg', 'Suits', '2019-10-03', 'https://www.youtube.com/watch?v=SYUQKm2nZNE',
    'Gabriel Macht, Meghan Duchess of Sussex,  Patrick J. Ademas, Sarah Rafferty, Rick Hoffman', '00:43:00', 
    'Big-time Manhattan corporate lawyer Harvey Specter and his team, which includes Donna Paulsen, Louis Litt, and Alex Williams, are launched into a play for power when a new partner joins the firm. With his two best associates gone and Jessica back in Chicago, Specter and the team try to adjust to a new normal without them. The team faces down betrayals, fiery relationships, and secrets that eventually come to light. Old and new rivalries surface among members of the team as they learn to deal with their new member.',
    '5', '3');

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/social.jpg', 'The Social Dilemma', '2020-01-26', 'https://www.youtube.com/watch?v=uaaC57tcci0',
    'Skyler Gisondo, Jaron Lanier, Kara Hayward', '01:34:00', 
    'Tech experts sound the alarm on the dangerous human impact of social networking.',
    '6', '1');

    --DONE ^^^^^

    UPDATE movie SET movie_name = 'the lion king' WHERE movie_id = 1;

    UPDATE movie SET movie_name = 'beauty and the beast' WHERE movie_id = 2;

    UPDATE movie SET movie_name = 'onward' WHERE movie_id = 3;

    UPDATE movie SET movie_name = 'spider-man: into the spider-verse' WHERE movie_id = 4;

    UPDATE movie SET movie_name = 'gemini man' WHERE movie_id = 5;

    UPDATE movie SET movie_name = 'suits' WHERE movie_id = 6;

    UPDATE movie SET movie_name = 'the social dilemma' WHERE movie_id = 7;
 --DONE ^^^^^

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/hitch.jpg', 'hitch', '2005-02-11', 'https://www.youtube.com/watch?v=dMaq_pfxs-0',
    'Eva Mendez, Will Smith, Amber Valletta, Kevin James, Paula Patton', '01:58:00', 
    'Dating coach Alex "Hitch" Hitchens (Will Smith) mentors a bumbling client, Albert (Kevin James), who hopes to win the heart of the glamorous Allegra Cole (Amber Valletta). While Albert makes progress, Hitchens faces his own romantic setbacks when proven techniques fail to work on Sara Melas (Eva Mendes), a tabloid reporter digging for dirt on Allegra Cole"s love life. When Sara discovers Hitchens" connection to Albert -- now Allegra"s boyfriend -- it threatens to destroy both relationships.',
    '4', '1');
--DONE ^^^^^

    ALTER TABLE review ALTER COLUMN review_date SET DATA TYPE timestamp;

    ALTER TABLE review ALTER COLUMN review_date SET DEFAULT current_timestamp;

    INSERT INTO review  (review_description, movie_id) VALUES ('Great movie', '1');
