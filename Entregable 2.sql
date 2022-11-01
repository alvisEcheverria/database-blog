CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY,
  "alias" varchar UNIQUE NOT NULL,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" varchar NOT NULL
);

CREATE TABLE "author" (
  "id_author" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "alias" varchar NOT NULL
);

CREATE TABLE "common_user" (
  "id_common_user" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "alias" varchar NOT NULL
);

CREATE TABLE "tags" (
  "id_tags" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "posts" (
  "id_posts" SERIAL PRIMARY KEY,
  "id_author" int NOT NULL,
  "id_tags" int NOT NULL,
  "name_tags" varchar NOT NULL,
  "title" varchar,
  "description" varchar,
  "content" text,
  "date" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id_comments" SERIAL PRIMARY KEY,
  "id_common_user" int NOT NULL,
  "id_posts" int NOT NULL,
  "comment" text,
  "date" timestamp DEFAULT 'now()'
);

CREATE TABLE "answer_comments_author" (
  "id_answer_comments" SERIAL PRIMARY KEY,
  "id_comments" int NOT NULL,
  "id_author" int NOT NULL,
  "comment" text,
  "date" timestamp DEFAULT 'now()'
);

CREATE TABLE "answer_comments_users" (
  "id_answer_comments" SERIAL PRIMARY KEY,
  "id_comments" int NOT NULL,
  "id_common_user" int NOT NULL,
  "comment" text,
  "date" timestamp DEFAULT 'now()'
);

ALTER TABLE "author" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "author" ADD FOREIGN KEY ("alias") REFERENCES "users" ("alias");

ALTER TABLE "common_user" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "common_user" ADD FOREIGN KEY ("alias") REFERENCES "users" ("alias");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id_author");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_tags") REFERENCES "tags" ("id_tags");

ALTER TABLE "posts" ADD FOREIGN KEY ("name_tags") REFERENCES "tags" ("name");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_posts") REFERENCES "posts" ("id_posts");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_common_user") REFERENCES "common_user" ("id_common_user");

ALTER TABLE "answer_comments_author" ADD FOREIGN KEY ("id_comments") REFERENCES "comments" ("id_comments");

ALTER TABLE "answer_comments_author" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id_author");

ALTER TABLE "answer_comments_users" ADD FOREIGN KEY ("id_comments") REFERENCES "comments" ("id_comments");

ALTER TABLE "answer_comments_users" ADD FOREIGN KEY ("id_common_user") REFERENCES "common_user" ("id_common_user");

insert into users ("alias", first_name, last_name, email, "password", age) 
values 
('Petro', 'Alvis', 'Echeverria', 'alvis@gmail.com', '123456', '32'),
('Petra', 'Adriana', 'Diaz', 'adriana@gmail.com', '12345', '28');

insert into author (id_user, alias) values (1, 'Petro');

insert into common_user  (id_user, alias) values (2, 'Petra');

insert into tags ("name") 
values 
('salud'), 
('alimentación'), 
('tecnología'), 
('educación'), 
('motores'); 

insert into posts (id_author, id_tags, name_tags, title, description, "content") 
values
(1, 3, 'tecnología', 'Space X', 'Nueva Misión', 'Se planea llegar a marte muy pronto'),
(1, 5, 'motores', 'Nuevo Nissan', 'El Nissan que lo cambia todo', 'Este Nissan tiene un motor que cambiara el mercado, el más potente hasta el momento');

insert into "comments" (id_common_user, id_posts, "comment") 
values
(1, 2, 'Increible, ya quiero comprarlo'),
(1, 1, 'Y si mejor salvamos nuestro planeta?');

insert into answer_comments_author (id_comments, id_author, "comment")
values 
(1, 1, 'Sí, está muy genial'),
(2, 1, 'Tienes razón, pero no depende de nosotros. :(');

insert into answer_comments_users (id_comments, id_common_user, "comment")
values 
(1, 1, 'Lo compraré'),
(2, 1, 'Qué triste...');