--=================== Users ====================

create table users(
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(50)
);

select * from users

insert into users (first_name, last_name, email) values 
	('Jose', 'Rico', 'joserico@gmail.com'),
	('Alberto', 'Zambrano', 'albertozambrano@gmail.com'),
	('Luis', 'Garcia', 'luisgarcia@gmail.com')

--================== Posts ===================

create table posts(
	id serial primary key,
	creator_id int references users(id),
	tittle varchar(50),
	text text
);

select * from posts

insert into posts (creator_id, tittle, text) values
	(1, 'Hay que salir de aquí', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus feugiat.'),
	(1, 'Deberíamos quedarnos aquí', 'Curabitur neque arcu, mollis tincidunt sem et, congue hendrerit lacus.'),
	(2, 'Situacion nacional', 'Sed maximus, magna in rhoncus venenatis, erat tellus luctus magna.'),
	(2, 'Limites nacionales', 'Curabitur gravida mi sed mauris laoreet, eget lobortis elit bibendum.'),
	(3, 'Programacion Orientada a Objetos', 'Integer quis blandit sem, in pretium enim. Fusce sit amet.')
	
update posts set text  = 'Integer quis blandit sem, in pretium enim. Fusce sit amet.' where id = 5
--================== Likes ===================

create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

select * from likes

insert into likes (user_id, post_id) values
	(1, 3),
	(1, 4),
	(2, 3),
	(3, 1),
	(3, 2)
	
--================== join ===================

select * from users inner join posts on users.id = posts.creator_id

select * from users inner join likes on users.id = likes.user_id inner join posts on likes.post_id = posts.id

