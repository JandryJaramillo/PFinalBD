-- SET GLOBAL sort_buffer_size = 256000000, para poder cargar los datos sin errores
-- Borrar/DROP tablas si existen, evitar errores
-- Creacion de movite data  set clean

use `data`;

DROP TABLE IF EXISTS movie_dataset_clean;
CREATE TABLE movie_dataset_clean  AS
SELECT
	`index`, budget, genres, homepage, id as id_movie, keywords, original_language, original_title, overview, popularity,
	 production_companies, production_countries, release_date, revenue, runtime, spoken_languages, `status`,
	 tagline, title, vote_average, vote_count,CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                            (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                            REPLACE(REPLACE(cast,'\\u00e1','á'),'\\u00e5','å'),'\\u00e9','é'),
           '\\u00eb','ë'),'\\u00ed','í'),'\\u00e0','à'), '\\u00f1','ñ'),'\\u00f8','ø'),'\\u042','B'),
           '\\u0438','N'),'\\u044f','я'),'\\u0421','C'), '\\u043d','H'),'\\u0440','p'),'\\u0433','r'),
           '\\u044c','b'),'\\u067e','پ'),'\\u06cc','ی'), '\\u0645','م'),'\\u0627','ا'),'\\u0646','ن'),
           '\\u0646','ع'),'\\u062f','د'),'\\u00e8','è'), '\\u00f3','ó'),'\\u0160','Š'),'\\u0107','ć'),
           '\\u0107','ć'),'\\u00f6','ö'),'\\u00e4','ä'), '\\u00e4','ô'),'\\u00e4','ç'),'\\u0144','ń'),
           '\\u2019','’'),'\\u00fc','ü'),'\\u00c1','Á'), '\\u00ea','ê'),'\\u00ea','ê'),'\\u00e7','ç'),
           '\\u00dc','Ü'),'\\u0159','ř'),'\\u00d8','Ø'), '\\u00fa','ú'),'\\u010d','č'),'\\u010d','č'),
           '\\u00f0','ð'),'\\u0219','ș'),'\\u00d3','Ó'), '\\u0110','Đ'),'\\u0161','š'),'\\u0101','ā'),
           '\\u00c5','Å'),'\\u043b','л'),'\\u014c','Ō'), '\\u016b','ū'),'\\u014d','ō'),'\\u015b','ś'),
           '\\u00ef','ï'),'\\u021b','ț'),'\\u00c9b','ಛ'), '\\u00f4','ô'),'\\u0301','´'),'\\u00fb','û'),
           '\\u00fb','û'),'\\u1ed7','ỗ'),'\\u1ecb','ị'), '\\u1ea3','ả'),'\\u1ebf','ế'),'\\u015f','ş'),
           '\\u015ea','D'),'\\u017e','ž'),'\\u00c0','À'), '\\u0131','ı'),'\\u011f','ğ'),'\\u1ec1','ề'),
           '\\u0639','ع'),'\\u00ee','îع'),'\\u00e6','æ'), '\\u00c9','É'),'\\u00df','ß'),'\\u015ea','ᗪ')using utf8mb4) AS cast,
	CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	    (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	        (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crew,'\\\\', '\\'),
	        """", "'"),
	 		"', '", """, """),
	 		"': '", """: """),
	 		"': ", """: "),
	 		", '", ", """),
	 		"{'", "{"""), "\\t", ""),
	        '\\u00e9', 'é'),'\\u00e1', 'á'),'\\u00f1', 'ñ'),'\\u00c9', 'É'),
	        '\\u0159','ř'),'\\u00f4', 'ô'),'\\u00f3','ó'),'\\u00ed','í'),
            '\\u00d8','Ø'),'\\u00f8','ø'),'\\u00c5','Å'),'\\u00f6','ö'),
            '\\u0142','ɫ'),'\\u017','ž'),'\\u0161','š'),'\\u00e8','è'),
	        '\\u0144','ń'),'\\u00e7','ç'),'\\u00ef','ï'),'\\u0160','Š'),
	        '\\u00fc','ü'),'\\u00d3','Ó'),'\\u00fd','ý'),'\\u00cf','ï'),
            '\\u00e3','ã'),'\\u00ee','î'),'\\u00e2','â'),'\\u00e4','ä'),
            '\\u00e5','å'),'\\u00eb','ë'),'\\u00eb','ë'),'\\u00fa','ú'),
            '\\u00df','þ'),'\\u00f0','ð'),'\\u00c1','Á'),'\\u0107','ć'),
            '\\u015','𓍃'),'\\u0165','ť'),'\\u00ea','ê'),'\\u014c','Ō'),
            '\\u00c0','À'),'\\u2019','’'),'\\u00fb','û'),'\\u00e6','æ'),
            '\\u00fe','þ'),'\\u0141','Ł '),'\\u0411','Б'),'\\u043e','o'),
            '\\u0440','p'),'\\u0438','и'),'\\u0441','с'),'\\u0421','C'),
            '\\u0443','y'),'\\u0442','T'),'\\u0430','a'),'\\u0446','ц'),
            '\\u043a','k'),'\\u0439','й'),'\\u010d','č'),'\\u5f20','张 '),
            '\\u7acb','立'),'\\u00d6','Ö'),'\\u0441','с'),'\\u010c','Č'),
            '\\u00cd','Í'),'\\u00f5','õ'),'\\u00e0','à'),'\\u00f2','ò'),
            '\\u00d4','Ô'),'\\u011b','ě'),'\\u00de','Þ'),'\\u00ec','ì'),
            '\\u00da','Ú'),'\\u010e','Ď'),'\\u0433','r'),
	         """'", """"), "'""", """")using utf8mb4) AS Crew,
       CONVERT(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(director,
           '\\u00e1','á'),'\\u00e4','ä'),'\\u00f3','ó'),
           '\\u00e9','é'),'\\u00d8','Ø'),'\\u00ed','í'),
           '\\u00e8','è'),'\\u00e7','ç'),'\\u00f4','ô'),
           '\\u0159','ř'),'\\u00f8','ø'),'\\u00c5','Å'),
           '\\u00f6','ö'),'\\u00e5','å'),'\\u00ef','ï'),
           '\\u00e6','æ'),'\\u00fb','û'),'\\u00c0','À'),
           '\\u00c1','Á'),'\\u00c9','É'),'\\u014c','Ō'),
           '\\u0161','š'),'\\u0142','ɫ'),'\\u0144','ń'),
           '\\u017','ž'),'\\u00f1','ñ')using utf8mb4) AS director
		FROM `movie_dataset - copia`;
ALTER TABLE movie_dataset_clean  ADD Primary Key (id_movie);

-- Creación tabla movie;
DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
  index_movie INTEGER ,
  budget INTEGER ,
  genres VARCHAR(255),
  homepage VARCHAR(255) ,
  id_movie INTEGER PRIMARY KEY ,
  keywords VARCHAR(255) ,
  original_language VARCHAR(255) ,
  original_title VARCHAR(255) ,
  overview VARCHAR(1000),
  popularity FLOAT ,
  release_date VARCHAR(255),
  revenue VARCHAR(255),
  runtime VARCHAR(100),
  status_movie VARCHAR(255),
  tagline VARCHAR(255),
  title VARCHAR(255),
  vote_average FLOAT,
  vote_count INTEGER,
  cast VARCHAR(255),
  director VARCHAR(100)
);

-- Creación tabla production_companies
DROP TABLE IF EXISTS production_companies;
CREATE TABLE production_companies(
    name_pcomp VARCHAR(200),
    id_production_companies INTEGER PRIMARY KEY
);

-- Creación tabla movies_companies
DROP TABLE IF EXISTS movies_companies;
CREATE TABLE movies_companies(
id_movie Integer NOT NULL,
id_production_companies INTEGER NOT NULL,
primary key(id_movie,id_production_companies),

CONSTRAINT FK_id_movie_movie_companies
        FOREIGN KEY(id_movie) REFERENCES movie(id_movie),

CONSTRAINT FK_id_movie_production_companies
        FOREIGN KEY(id_production_companies) REFERENCES production_companies(id_production_companies)

);

-- Creación tabla production_countries
DROP TABLE IF EXISTS production_countries;
CREATE TABLE production_countries (
iso_3166_1 VARCHAR(30) PRIMARY KEY NOT NULL,
name_production_countries VARCHAR(30) NOT NULL
);

-- Creación tabla movies_countries
DROP TABLE IF EXISTS movies_countries;
CREATE TABLE movies_countries(
id_movie INTEGER,
iso_3166_1 VARCHAR(30) NOT NULL,
primary key(id_movie,iso_3166_1),
CONSTRAINT FK_id_movies_movies_countries
        FOREIGN KEY(id_movie) REFERENCES movie(id_movie),

CONSTRAINT FK_id_production_countries_movies_countries
        FOREIGN KEY(iso_3166_1) REFERENCES production_countries(iso_3166_1)
);

-- Creación tabla spoken_languages
DROP TABLE IF EXISTS spoken_languages;
CREATE TABLE spoken_languages(
iso_639_1 VARCHAR(40) PRIMARY KEY NOT NULL,
`language` VARCHAR(30)
);

-- Creación tabla movies_languages
DROP TABLE IF EXISTS movies_languages;
CREATE TABLE movies_languages(
id_movie Integer NOT NULL,
iso_639_1 VARCHAR(40) NOT NULL,
primary key(id_movie,iso_639_1),

CONSTRAINT FK_id_movies_languages
        FOREIGN KEY(id_movie) REFERENCES movie(id_movie),
CONSTRAINT FK_id_movies_spoken_languages
        FOREIGN KEY(iso_639_1) REFERENCES spoken_languages(iso_639_1)
);

-- Creación tabla genres
DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
id_genres VARCHAR(40) PRIMARY KEY NOT NULL,
nombre VARCHAR(50)
);

-- Creación tabla genero_movie
DROP TABLE IF EXISTS genres_movie;
CREATE TABLE genres_movie(
id_movie Integer NOT NULL,
id_genres VARCHAR(100) NOT NULL,
primary key(id_movie,id_genres),

CONSTRAINT FK_id_movies_genres_movie
        FOREIGN KEY(id_movie) REFERENCES movie(id_movie),
CONSTRAINT FK_id_movies_genres_genres
        FOREIGN KEY(id_genres) REFERENCES genres(id_genres)
);

-- Creación tabla crew
DROP TABLE IF EXISTS crew;
CREATE TABLE crew (
idCrew INTEGER primary key NOT NULL,
name VARCHAR(400) NOT NULL,
gender INTeger
);

-- Creación tabla credit
DROP TABLE IF EXISTS credit;
CREATE TABLE credit(
credit_id   VARCHAR(100) primary key ,
job  VARCHAR(100),
departament VARCHAR(100),
idCrew INTEGER,
CONSTRAINT FK_credit_crew FOREIGN KEY (idCrew) REFERENCES crew(idCrew)
);

-- Creación tabla movies_credit
DROP TABLE IF EXISTS movies_credit;
CREATE TABLE movies_credit(
 id_Movie INTEGER,
 credit_id VARCHAR(100),
  PRIMARY KEY (id_movie, credit_id),
  CONSTRAINT FK_movie_credit_idMovie FOREIGN KEY (id_movie) REFERENCES movie(id_Movie),
  CONSTRAINT FK_movie_credit_idCredit FOREIGN KEY (credit_id) REFERENCES credit(credit_id)
 );

-- Creación tabla director
DROP TABLE IF EXISTS director;
CREATE TABLE director(
  id_director VARCHAR(100) PRIMARY KEY NOT NULL,
  name_director VARCHAR(100)
);