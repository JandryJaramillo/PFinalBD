use `data`;

-- insert de los datos de la tabla movie//////
INSERT INTO movie
SELECT md.`index`,md.budget,md.genres,md.homepage,md.id_Movie,md.keywords,md.original_language,md.original_title,
       md.overview,md.popularity,md.release_date,md.revenue,md.runtime,md.status,md.tagline,md.title,
       md.vote_average,md.vote_count,md.cast,MD5(md.director)
	FROM movie_dataset_clean md;

-- insert production_companies//////
INSERT INTO production_companies
SELECT DISTINCT t.name_production_company,t.id_production_company
FROM tmp_production_companies t;
-- WHERE m.id_movie = t.id_movie ;

-- insert movies_companies//////
INSERT INTO movies_companies
SELECT  DISTINCT m.id_movie,  pc.id_production_companies
FROM movie m, tmp_production_companies t, production_companies pc
WHERE m.id_movie = t.id_movie AND t.id_production_company = pc.id_production_companies;

-- Insert Production Companies////////////
INSERT INTO production_countries
SELECT DISTINCT tpc.iso_3166_1,tpc.country
FROM tmp_production_countries tpc;
-- WHERE m.id_movie = t.id_movie ;

-- Insert movies_countries////////////
INSERT INTO movies_countries
SELECT  DISTINCT m.id_movie,  pc.iso_3166_1
FROM movie m, tmp_production_countries tpc, production_countries pc
WHERE m.id_movie = tpc.id_movie AND tpc.iso_3166_1 = pc.iso_3166_1;

-- Insert spoken_languages////////////
INSERT INTO spoken_languages
SELECT DISTINCT sl.iso_639_1,sl.language
FROM tmp_spoken_languages sl;
-- WHERE m.id_Movie = t.id_movie ;

-- Insert movies_languages////////////
INSERT INTO movies_languages
SELECT  DISTINCT m.id_Movie,  sl.iso_639_1
FROM movie m, tmp_spoken_languages tsl, spoken_languages sl
WHERE m.id_movie = tsl.id_movie AND tsl.iso_639_1 = sl.iso_639_1;

-- Insert genres////////////
INSERT INTO genres
SELECT DISTINCT tmg.idGe,tmg.genre
FROM  tmp_genres tmg;

-- Insert genres_movie////////////
INSERT INTO genres_movie
SELECT m.id_movie,  g.id_genres
FROM movie m,tmp_genres tmg, genres g
WHERE m.id_movie = tmg.id_movie AND tmg.idGe = g.id_genres;

-- Insert crew////////////
INSERT INTO crew(
SELECT DISTINCT tmc.id_crew, tmc.name,tmc.gender
FROM movie m,tmp_crew tmc
    WHERE m.id_movie=tmc.id_movie);

-- Insert credit////////////
INSERT INTO credit(
SELECT DISTINCT tmc.credit_id, tmc.job,tmc.department,tmc.id_crew
FROM movie m,tmp_crew tmc,crew c
WHERE m.id_movie = tmc.id_movie AND tmc.id_crew = c.idCrew);

-- Insert movies_credit////////////
INSERT INTO movies_credit(
SELECT DISTINCT m.id_Movie,c.credit_id
FROM tmp_crew tmc,movie m, credit c
WHERE m.id_movie = tmc.id_movie AND tmc.credit_id = c.credit_id);

-- Insert director////////////
INSERT INTO director(
SELECT distinct MD5(m.director) AS id_director, m.director AS Director
FROM movie_dataset m LEFT JOIN crew c ON m.director = REPLACE(c.name, '"', ''));

-- drops de tables temporales/////
DROP TABLE IF EXISTS tmp_production_companies ;
DROP TABLE IF EXISTS tmp_production_countries ;
DROP TABLE IF EXISTS tmp_spoken_languages ;
DROP TABLE IF EXISTS tmp_crew ;
DROP TABLE IF EXISTS tmp_genres ;