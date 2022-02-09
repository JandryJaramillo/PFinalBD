-- production_companies JSON
-- Crear la tabla temporal de la relacion movies con production companies y se extrae los datos 

use `data`;

DROP PROCEDURE IF EXISTS Json2Relational_production_companies ;
DELIMITER //
CREATE PROCEDURE Json2Relational_production_companies()
BEGIN
	DECLARE a INT Default 0 ;
	DROP TABLE IF EXISTS tmp_production_companies ;
	CREATE TABlE tmp_production_companies (id_movie INTEGER, id_production_company INT, name_production_company VARCHAR (100) );
  simple_loop: LOOP
		INSERT INTO tmp_production_companies (id_movie, name_production_company,id_production_company)
		SELECT m.id_movie,
		    JSON_EXTRACT(m.production_companies , CONCAT('$[',a,'].name')),
			JSON_EXTRACT(m.production_companies, CONCAT('$[',a,'].id'))
		FROM movie_dataset_clean m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   DELETE FROM tmp_production_companies WHERE id_production_company IS NULL ;
END //
DELIMITER ;
Call Json2Relational_production_companies();

-- production_countries JSON

DROP PROCEDURE IF EXISTS Json2Relational_production_countries ;
DELIMITER //
CREATE PROCEDURE Json2Relational_production_countries()
BEGIN
	DECLARE a INT Default 0 ;
	DROP TABLE IF EXISTS tmp_production_countries ;
	CREATE TABlE tmp_production_countries (id_movie INT, iso_3166_1 VARCHAR (7), country VARCHAR (100) );
  simple_loop: LOOP
		INSERT INTO tmp_production_countries (id_movie, iso_3166_1, country)
		SELECT id_movie,
			JSON_EXTRACT(production_countries, CONCAT('$[',a,'].iso_3166_1')) AS iso_3166_1,
			JSON_EXTRACT(production_countries , CONCAT('$[',a,'].name')) AS country
		FROM movie_dataset_clean m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   DELETE FROM tmp_production_countries WHERE iso_3166_1 IS NULL ;
END //
DELIMITER ;

CALL Json2Relational_production_countries();

-- spoken_languages JSON

DROP PROCEDURE IF EXISTS Json2Relational_spoken_languages ;
DELIMITER //
CREATE PROCEDURE Json2Relational_spoken_languages()
BEGIN
	DECLARE a INT Default 0 ;
	DROP TABLE IF EXISTS tmp_spoken_languages ;
	CREATE TABlE tmp_spoken_languages (id_movie INT, iso_639_1 VARCHAR (5), `language` VARCHAR (100) );
  simple_loop: LOOP
		INSERT INTO tmp_spoken_languages (id_movie, iso_639_1, `language`)
		SELECT id_movie,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].iso_639_1')) AS iso_639_1,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].name')) AS language
		FROM movie_dataset_clean m ;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   DELETE FROM tmp_spoken_languages WHERE iso_639_1 IS NULL ;
END //
DELIMITER ;

CALL Json2Relational_spoken_languages();

-- crew JSON

DROP PROCEDURE IF EXISTS Json2Relational_crew ;
DELIMITER //
CREATE PROCEDURE Json2Relational_crew()
BEGIN
	DECLARE a INT Default 0 ;
	DROP TABLE IF EXISTS tmp_crew;
	CREATE TABlE tmp_crew
	  (id_movie INT, id_crew INT, job VARCHAR (200), name VARCHAR (400), gender INT, credit_id VARCHAR (50), department VARCHAR (50) );
simple_loop: LOOP
		INSERT INTO tmp_crew (id_movie, id_crew, job, name, gender, credit_id, department)
		SELECT id_movie,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].id")) AS id_crew,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].job")) AS job,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].name")) AS name,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].gender")) AS gender,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].credit_id")) AS credit_id,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].department")) AS department
		FROM movie_dataset_clean m
		WHERE id_movie IN (SELECT id_Movie FROM movie_dataset_clean WHERE a <= JSON_LENGTH (crew) );
SET a=a+1;
     	IF a=436 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   DELETE FROM tmp_crew WHERE id_crew IS NULL ;
END //
DELIMITER ;
Call Json2Relational_crew();
Alter table tmp_crew add primary key (id_movie,credit_id);
UPDATE tmp_crew
SET gender = 2
WHERE id_crew = 30711 ;

-- genres JSON

DROP PROCEDURE IF EXISTS Json2Relational_genres ;
DELIMITER //
CREATE PROCEDURE Json2Relational_genres()
BEGIN
	DECLARE a INT Default 0 ;
	DROP TABLE IF EXISTS tmp_genres ;
	CREATE TABlE tmp_genres (id_movie INT not null, idGe VARCHAR(100),genre VARCHAR (100) );
	simple_loop: LOOP
		INSERT INTO tmp_genres (id_movie,idGe,genre)
        SELECT * FROM (
			SELECT id_movie as id_movie,MD5(REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'),
				    'Science","Fiction', 'Science Fiction'), '"]'), CONCAT("$[",a,"]")), """","")),
				REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'),
				    'Science","Fiction', 'Science Fiction'), '"]'), CONCAT("$[",a,"]")), """","") AS genre
			FROM movie_dataset_clean ) t
        WHERE genre != "";
			SET a=a+1;
     	IF a=6 THEN
            LEAVE simple_loop;
		END IF;
	END LOOP simple_loop;
	DELETE FROM tmp_genres
	WHERE genre IS NULL;
END //
DELIMITER ;
Call Json2Relational_genres();