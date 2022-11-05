CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" varchar NOT NULL
);

CREATE TABLE "author" (
  "id_author" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "alias" varchar UNIQUE NOT NULL
);

CREATE TABLE "common_user" (
  "id_common_user" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "alias" varchar UNIQUE NOT NULL
);

CREATE TABLE "tags" (
  "id_tags" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "tags_posts" (
  "id_tags_posts" SERIAL PRIMARY KEY,
  "id_tags" int NOT NULL,
  "id_posts" int NOT NULL
);

CREATE TABLE "posts" (
  "id_posts" SERIAL PRIMARY KEY,
  "id_author" int NOT NULL,
  "alias" varchar NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar,
  "content" text NOT NULL,
  "date" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id_comments" SERIAL PRIMARY KEY,
  "id_common_user" int NOT NULL,
  "id_posts" int NOT NULL,
  "comment" text NOT NULL,
  "date" timestamp DEFAULT 'now()'
);

CREATE TABLE "answer_comments" (
  "id_answer_comments" SERIAL PRIMARY KEY,
  "id_comments" int NOT NULL,
  "id_author" int,
  "id_common_user" int,
  "comment" text NOT NULL,
  "date" timestamp DEFAULT 'now()'
);

ALTER TABLE "author" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "common_user" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id_author");

ALTER TABLE "posts" ADD FOREIGN KEY ("alias") REFERENCES "author" ("alias");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_posts") REFERENCES "posts" ("id_posts");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_common_user") REFERENCES "common_user" ("id_common_user");

ALTER TABLE "tags_posts" ADD FOREIGN KEY ("id_tags") REFERENCES "tags" ("id_tags");

ALTER TABLE "tags_posts" ADD FOREIGN KEY ("id_posts") REFERENCES "posts" ("id_posts");

ALTER TABLE "answer_comments" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id_author");

ALTER TABLE "answer_comments" ADD FOREIGN KEY ("id_common_user") REFERENCES "common_user" ("id_common_user");

ALTER TABLE "answer_comments" ADD FOREIGN KEY ("id_comments") REFERENCES "comments" ("id_comments");

insert into users (first_name, last_name, email, "password", age) 
values 
('Alvis', 'Echeverria', 'alvis@gmail.com', '123456', '32'),
('Adriana', 'Diaz', 'adriana@gmail.com', '12345', '28');

insert into author (id_user, alias) values (1, 'Petro');

insert into common_user  (id_user, alias) values (2, 'Petra');

insert into tags ("name") 
values 
('salud'), 
('alimentación'), 
('tecnología'), 
('educación'), 
('motores');

insert into posts (id_author, alias, title, description, "content") 
values
(1,  'Petro', 'Space X', 'Nueva Misión', 'Se planea llegar a marte muy pronto'),
(1,  'Petro', 'Nuevo Nissan', 'El Nissan que lo cambia todo', 'Este Nissan tiene un motor que cambiara el mercado, el más potente hasta el momento');

insert into tags_posts (id_tags, id_posts) 
values 
(3, 1),
(5, 2);

insert into "comments" (id_common_user, id_posts, "comment") 
values
(1, 2, 'Increible, ya quiero comprarlo'),
(1, 1, 'Y si mejor salvamos nuestro planeta?');

insert into answer_comments (id_comments, id_author, "comment")
values 
(1, 1, 'Sí, está muy genial'),
(2, 1, 'Tienes razón, pero no depende de nosotros. :(');

insert into answer_comments (id_comments, id_common_user, "comment")
values 
(1, 1, 'Lo compraré'),
(2, 1, 'Qué triste...');

/**/