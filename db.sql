
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


--DONE ^^^^^

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/iron.jpg', 'iron man', '2008-05-02', 'https://www.youtube.com/watch?v=8ugaeA-nMTc',
    'Robert Downey Jr., Jon Favreu, Gwyneth Paltrow, Stan Lee, Paul Bettany', '02:06:00', 
    'A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism.',
    '2', '2');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/avengers.jpg', 'the avengers', '2012-05-04', 'https://www.youtube.com/watch?app=desktop&v=eOrNdBpGMv8',
    'Scarlett Johansson, Robert Downey Jr., Chris Evans, Chris Hemsworth, Mark Ruffalo', '02:24:00', 
    'When Thor"s evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of S.H.I.E.L.D., initiates a superhero recruitment effort to defeat the unprecedented threat to Earth. Joining Fury"s "dream team" are Iron Man (Robert Downey Jr.), Captain America (Chris Evans), the Hulk (Mark Ruffalo), Thor (Chris Hemsworth), the Black Widow (Scarlett Johansson) and Hawkeye (Jeremy Renner)',
    '2', '2');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/thor.jpg', 'thor: the dark world', '2013-11-08', 'https://www.youtube.com/watch?v=npvJ9FTgZbM',
    'Chris Hemsworth, Natalie Portman, Tom Hiddleston, Christopher Eccleston, Kat Dennings', '01:52:00', 
    'In ancient times, the gods of Asgard fought and won a war against an evil race known as the Dark Elves. The survivors were neutralized, and their ultimate weapon -- the Aether -- was buried in a secret location. Hundreds of years later, Jane Foster (Natalie Portman) finds the Aether and becomes its host, forcing Thor (Chris Hemsworth) to bring her to Asgard before Dark Elf Malekith (Christopher Eccleston) captures her and uses the weapon to destroy the Nine Realms -- including Earth.',
    '2', '2');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/unorthodox.jpg', 'unorthodox' , '2020-03-26', 'https://www.youtube.com/watch?v=-zVhRId0BTw',
    'Shira Haas, Amit Rahav, Aaron Altaras, Jeff Wilbusch, Alex Reid', '00:52:00', 
    'A woman flees an arranged marriage in Brooklyn to start a new life abroad, then her past catches up to her.',
    '5', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/david.jpg', 'david attenborough: a life on our planet', '2020-10-04', 'https://www.youtube.com/watch?v=8ugaeA-nMTc',
    '--', '01:54:00', 
    'In his 93 years, Attenborough has visited every continent on the globe, exploring the wild places of the planet and documenting the living world in all its variety and wonder. But during his lifetime, Attenborough has also seen first-hand the monumental scale of humanity"s impact on nature.',
    '6', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/trial.jpg', 'trial 4', '2020-11-11', 'https://www.youtube.com/watch?v=Q_X_WqC75Yc',
    '--', '00:54:00', 
    'Charged as a teenager in the 1993 killing of a Boston police officer, Sean K. Ellis fights to prove his innocence while exposing police corruption and systematic racism.',
    '6', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/barca.jpg', 'barca dreams', '2008-05-02', 'https://www.youtube.com/watch?v=mn0K45FURLk',
    'Lionel Messi, Xavi, Johan Cruyff, Andres Iniesta, Gary Lineker', '002:00:00', 
    'BARÇA DREAMS is the most complete documentary ever to be made about the story of FC Barcelona, one of the top soccer clubs in the world, highly praised for its legendary figures like Leo Messi, the best footballer of all time, the prestigious coach Pep Guardiola, or the man who revolutionized this sport (soccer and football are used interchangeably throughout the entire text) with his innovative vision: Johan Cruyff. The film narrates the soccer club"s long road to fame and acknowledgement, culminating in the generation of players of the stature of Leo Messi, Xavi Hernández and Andrés Iniesta, all of them trained in the famous school of La Masía.',
    '6', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/anne.jpg', 'anne with an e', '2017-03-19', 'https://www.youtube.com/watch?v=S5qJXYNNINo',
    'Amybeth McNulty, Lucas Jade Zumann, Geraldine James, Dalila Bela, R.H. Thomson', '00:55:00', 
    'This reimagining of the classic book and film is a coming-of-age story about a young orphan who is seeking love, acceptance and her place in the world. Amybeth McNulty stars as Anne, a 13-year-old who has endured an abusive childhood in orphanages and the homes of strangers. In the late 1890s, Anne is mistakenly sent to live with aging siblings, Marilla and Matthew Cuthbert, who live on Prince Edward Island. Anne, who proves to be uniquely spirited, imaginative and smart, transforms the lives of Marilla, Matthew and everyone else in their small town.',
    '5', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/dance.jpg', 'the last dance', '2020-05-19', 'https://www.youtube.com/watch?v=N9Z9JtNcCWY',
    'Dennos Rodman, Michael Jordan, Scottie Pippen, Carmen Electra , Phil Jackson', '00:55:00', 
    'In the fall of 1997, Michael Jordan and the Chicago Bulls allowed a film crew to follow them as they went for their sixth NBA title in eight seasons. That resulted in a stunning portrait of one of the sport"s most iconic athletes and a celebrated team. "The Last Dance" follows the Bulls" 1997-98 season from start to finish, while also covering the rest of the chapters in Jordan"s remarkable career. The 10-part docuseries follows the Jordan timeline from when he was an emerging star on his high school team to becoming a worldwide marketing force and cultural figure. The series takes its name from a phrase coined by then-Bulls coach Phil Jackson, who knew that the season would likely be the final run for the core members of that 1990s Bulls dynasty.',
    '5', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/adrift.jpg', 'adrift', '2018-06-01', 'https://www.youtube.com/watch?app=desktop&v=If2lCD0SQrE',
    'Shailene Woodley, Sam Clafin, Tami Oldham Ashcraft, Grace Palmer, Elizabeth Hawthorne', '01:39:00', 
    'Tami Oldham and Richard Sharp couldn"t anticipate that they would be sailing directly into one of the most catastrophic hurricanes in recorded history. In the aftermath of the storm, Tami awakens to find Richard badly injured and their boat in ruins. With no hope of rescue, Tami must now find the strength and determination to save herself and the only man she has ever loved.',
    '4', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/falling.jpg', 'falling inn love', '2019-08-29', 'https://www.youtube.com/watch?v=P9vXNloQfTM',
    'Adam Demos, Christina Milian, Jeffrey Bowyer, Claire Chitham', '01:38:00', 
    'Romance and remodeling collide when a corporate executive wins a New Zealand inn that lacks curb appeal.',
    '4', '1');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/forever.jpg', 'forever my girl', '2018-01-19', 'https://www.youtube.com/watch?v=5iEOQn8UUHI',
    'Alex Roe, Jessica Rothe, Abby Ryder Fortson, John Benjamin Hickey, Travis Tritt.', '01:48:00', 
    'Liam Page is a country music superstar who left his bride Josie at the altar to pursue fame and fortune. Page never got over Josie, his one true love, or forgot his Southern roots in the small community where he was born and raised. Now, he must unexpectedly face the consequences of his actions when he returns to his hometown for the funeral of his best friend from high school.',
    '4', '3');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/transformers.jpg', 'transformers: dark of the moon', '2011-06-28', 'https://www.youtube.com/watch?v=EkqdO8dhptc',
    'Rosie Huntigton, Shia LaBeouf, Josh Duhamel, Patrick Dempsey, Tyrese Gibson', '02:37:00', 
    'Sam Witwicky (Shia LaBeouf) and his new girlfriend, Carly (Rosie Huntington-Whiteley), join the fray when the evil Decepticons renew their longstanding war against the Autobots. Optimus Prime (Peter Cullen) believes that resurrecting ancient Transformer Sentinel Prime (Leonard Nimoy), once the leader of the Autobots, may lead to victory. That decision, however, has devastating consequences; the war appears to tip in favor of the Decepticons, leading to a climactic battle in Chicago.',
    '3', '4');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/megan.jpg', 'megan leavey', '2017-06-09', 'https://www.youtube.com/watch?v=IGGcFbW__XI',
    'Kate Mara, Tom Felton, Edie Falco, Bradley Whitford, Ramom Rodriguez', '01:56:00', 
    'The true life story of Megan Leavey, a young Marine corporal whose unique discipline and bond with a military combat dog saved many lives during her deployment in Iraq. Assigned to clean up the K-9 unit after a disciplinary hearing, Leavey starts to identify with Rex, a particularly aggressive dog that she trains. Over the course of their service, Megan and Rex complete more than 100 missions until an improvised explosive device injures both, putting their fates in jeopardy.',
    '3', '4');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/abominable.jpg', 'abominable', '2019-09-27', 'https://www.youtube.com/watch?v=Ap0NRJD-2ts',
    'Chloe Bennet, Tenzing Norgay Trainor, Albert Tsai, Sarah Paulson, Eddie Izzard', '01:37:00', 
    'After discovering a Yeti on the roof of her apartment building, teenage Yi and her two friends embark on an epic quest to reunite the magical creature with his family. But to do so, they must stay one step ahead of a wealthy financier and a determined zoologist who want to capture the beast for their own gain.',
    '1', '4');



    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/dragon.jpg', 'how to train your dragon: the hidden world', '2019-01-03', 'https://www.youtube.com/watch?v=qLTDtbYmdWM',
    'Jay Baruchel, America Ferrera, Gerard Butler, Kit Harington, Christopher Mintz-Plasse', '01:45:00', 
    'All seems well on the island of Berk as Vikings and dragons live together in peace and harmony. Now a Viking leader, Hiccup finds himself increasingly attracted to Astrid, while his beloved dragon Toothless meets an enchanting creature who captures his eye. When the evil Grimmel launches a devious plan to wipe out all the dragons, Hiccup must unite both clans to find Caldera, a hidden land that holds the key to saving Toothless and his flying friends.',
    '1', '4');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/divergent.jpg', 'divergent', '2014-03-21', 'https://www.youtube.com/watch?app=desktop&v=npSkNAHQ2kI',
    'Shailene Woodley, Theo James, Miles Teller, Zoe Kravits, Kate Winslet', '02:20:00', 
    'Tris Prior (Shailene Woodley) lives in a futuristic world in which society is divided into five factions. As each person enters adulthood, he or she must choose a faction and commit to it for life. Tris chooses Dauntless -- those who pursue bravery above all else. However, her initiation leads to the discovery that she is a Divergent and will never be able to fit into just one faction. Warned that she must conceal her status, Tris uncovers a looming war which threatens everyone she loves.',
    '3', '3');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/ww.jpg', 'wonder woman', '2017-06-02', 'https://www.youtube.com/watch?v=1Q8fG0TtVAY',
    'Gal Gadot, Chris Pine, Robin Wright, Connie Nielsen, Zack Snyder', '02:29:00', 
    'Before she was Wonder Woman (Gal Gadot), she was Diana, princess of the Amazons, trained to be an unconquerable warrior. Raised on a sheltered island paradise, Diana meets an American pilot (Chris Pine) who tells her about the massive conflict that"s raging in the outside world. Convinced that she can stop the threat, Diana leaves her home for the first time. Fighting alongside men in a war to end all wars, she finally discovers her full powers and true destiny.',
    '2', '3');

    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/black.jpg', 'black beauty', '2020-11-27', 'https://www.youtube.com/watch?v=DpZ3yZhsWZE',
    'Mackenzie Foy, Kate Winslet, Calam Lynch, Claire Forlani, Iain Glen', '01:50:00', 
    'Born free in the American West, Black Beauty is rounded up and brought to Birtwick Stables, where she meets spirited teenager Jo Green. Black Beauty and Jo forge a bond that carries Beauty through the different chapters, challenges and adventures.',
    '1', '2');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/captain.jpg', 'captain america: civil War', '2016-05-06', 'https://www.youtube.com/watch?app=desktop&v=dKrVegVI0Us',
    'Chris Evans, Robert Downey Jr., Sebastian Stan, Anthony Mackie, Elizabeth Olsen', '02:28:00', 
    'Political pressure mounts to install a system of accountability when the actions of the Avengers lead to collateral damage. The new status quo deeply divides members of the team. Captain America (Chris Evans) believes superheroes should remain free to defend humanity without government interference. Iron Man (Robert Downey Jr.) sharply disagrees and supports oversight. As the debate escalates into an all-out feud, Black Widow (Scarlett Johansson) and Hawkeye (Jeremy Renner) must pick a side.',
    '2', '2');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/furious.jpg', 'furious 7', '2015-04-04', 'https://www.youtube.com/watch?v=5Yab0sXGEjg',
    'Paul Walker, Vin Diesel, Michelle Rodriguez, Jason Staham, Tyrese Gibson', '02:20:00', 
    'After defeating international terrorist Owen Shaw, Dominic Toretto (Vin Diesel), Brian O"Conner (Paul Walker) and the rest of the crew have separated to return to more normal lives. However, Deckard Shaw (Jason Statham), Owen"s older brother, is thirsty for revenge. A slick government agent offers to help Dom and company take care of Shaw in exchange for their help in rescuing a kidnapped computer hacker who has developed a powerful surveillance program.',
    '3', '4');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/us.jpg', 'this is us', '2016-09-20', 'https://www.youtube.com/watch?v=-sUyGGkucNs',
    'Mandy Moore, Chrissy Metz, Milo Ventimiglia, Justin Hartley, Sterling K. Brown', 
    '00:42:00', 
    'Jack and his wife - who is very pregnant with triplets - have just moved into their new home in Pittsburgh. Successful and handsome television actor Kevin is growing increasingly bored with his bachelor lifestyle. Randall - who was abandoned at a fire station by his father as an infant - is a stylish New York-based businessman working to raise two daughters with his wife, Beth. These people are among a group, several of whom share a birthday, of seemingly random individuals whose lives intertwine in unexpected ways',
    '5', '4');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/13.jpg', '13 hours: the secret soldiers of benghazi', '2016-01-12', 'https://www.youtube.com/watch?v=4CJBuUwd0Os',
    'John Krasinski, Pablo Schreiber, James Badge Dale, Max Martini, David Denman', '02:24:00', 
    'On Sept. 11, 2012, Islamic militants attack the U.S. Consulate in Benghazi, Libya, killing Ambassador J. Christopher Stevens and Sean Smith, an officer for the Foreign Service. Stationed less than one mile away are members (James Badge Dale, John Krasinski, Max Martini) of the Annex Security Team, former soldiers assigned to protect operatives and diplomats in the city. As the assault rages on, the six men engage the combatants in a fierce firefight to save the lives of the remaining Americans.',
    '3', '3');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/glass.jpg', 'the glass castle', '2017-08-09', 'https://www.youtube.com/watch?app=desktop&v=bdNiNhSeSDk',
    'Brie Larson, Woody Harrelson, Jannette Walls, Naomi Watts, Destin Daniel Cretton', '02:07:00', 
    'Based on a memoir, four siblings must learn to take care of themselves as their responsibility-averse, free-spirit parents both inspire and inhibit them. When sober, the children"s brilliant and charismatic father captured their imagination, teaching them physics, geology, and how to embrace life fearlessly. But when he drank, he was dishonest and destructive. Meanwhile, their mother abhorred the idea of domesticity and didn"t want to take on the work of raising a family.',
    '4', '3');


    INSERT INTO movie(
    movie_img, movie_name, movie_date, movie_trailer, movie_actors, movie_duration, movie_description, category_id, streaming_id)
    VALUES ('/img/short.jpg', 'the big short', '2015-12-11', 'https://www.youtube.com/watch?v=vgqG3ITMv1Q',
    'Christian Bale, Ryan Gosling, Brad Pitt, Finn Wittrock, Jeremy Strong ', '02:10:00', 
    'In 2008, Wall Street guru Michael Burry realizes that a number of subprime home loans are in danger of defaulting. Burry bets against the housing market by throwing more than $1 billion of his investors" money into credit default swaps. His actions attract the attention of banker Jared Vennett (Ryan Gosling), hedge-fund specialist Mark Baum (Steve Carell) and other greedy opportunists. Together, these men make a fortune by taking full advantage of the impending economic collapse in America.',
    '6', '3');

    