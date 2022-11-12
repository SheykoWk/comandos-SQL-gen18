CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "country" char(3),
  "gender" varchar,
  "membership_id" int
);

CREATE TABLE "movies" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "year" int,
  "duration" int,
  "director" varchar,
  "score" float,
  "clasification" varchar,
  "url_video" varchar,
  "url_cover" varchar
);

CREATE TABLE "genres" (
  "id" serial PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "movie_genres" (
  "id" uuid PRIMARY KEY,
  "movie_id" uuid,
  "genre_id" int
);

CREATE TABLE "series" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "year" int,
  "seasons" int,
  "genre" varchar,
  "clasification" varchar,
  "director" varchar,
  "score" float,
  "url_cover" varchar
);

CREATE TABLE "serie_genres" (
  "id" uuid PRIMARY KEY,
  "genre_id" int,
  "serie_id" uuid
);

CREATE TABLE "episodes" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "cap_number" int,
  "duration" int,
  "url_video" varchar,
  "thumbnail_url" varchar,
  "season" int,
  "serie_id" uuid
);

CREATE TABLE "memberships" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "description" text,
  "price" money,
  "duration" int,
  "devices" int
);

CREATE TABLE "profiles" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "url_cover" varchar,
  "user_id" uuid,
  "is_kid_profile" bool
);

ALTER TABLE "movie_genres" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_genres" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "serie_genres" ADD FOREIGN KEY ("serie_id") REFERENCES "series" ("id");

ALTER TABLE "serie_genres" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "episodes" ADD FOREIGN KEY ("serie_id") REFERENCES "series" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("membership_id") REFERENCES "memberships" ("id");

-- CRUD
-- C create insert into 
-- R read select
-- U update update 
-- D delete delete 


insert into users (
	id, 
	first_name, 
	last_name, 
	email, 
	"password",
	age,
	country,
	membership_id 
) values (
	'9ddc4885-e8c7-474b-a0b5-197c0a8a87a9', 
	'Diego', 
	'Fusaro', 
	'diego@academlo.com', 
	'root',
	27,
	'ARG',
	2
);



insert into memberships (
	name, 
	description ,
	price,
	duration,
	devices
) values (
	'Basica Mensual',
	'Con esta membresia podras hacer uso de nuestra plataforma durante 1 mes en 3 equipos',
	8,
	1,
	3
), (
	'Avanzada Mensual',
	'Con esta membresia podras hacer uso de nuestra plataforma durante 1 mes en 4 equipos',
	11,
	1,
	4
);

select * from users;

select first_name, email  from users;

select id as user_id, last_name, age, email from users;



select * from users where id = 'af77fd1f-7a27-4d40-9797-0ab861c56907';

select * from users where email = 'admin@academlo.com';

select * from users where age = 27 and first_name = 'Diego';

select * from users where age = 27;


update users 
set membership_id = 1, gender = 'male'
where "password"  = 'root';


delete from users where id = '6932ed6e-bbe7-4e59-b6d7-c921d371a142';




select * from users inner join memberships on users.membership_id = memberships.id;
-- Aqui agregamos alias para que sea mas sencilla la lectura
select * from users as u inner join memberships as m on u.membership_id = m.id;
 
select u.id, u.first_name, m."name", m.devices  from users as u inner join memberships as m on u.membership_id = m.id;

