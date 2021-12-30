--Создать таблицу employees
--Наполнить таблицу employee 70 строками.
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

insert into employees(employee_name)
values ('Kastner Stephen'),
('Murray John'),
('Godsey Sean'),
('Keels Henrietta'),
('Quesenberry Tracey'),
('McBroom Dustin'),
('Davis Brian'),
('Hibbard Teresa'),
('Xiong Rodger'),
('Collins Hattie'),
('Shannon Jennifer'),
('Weibel Maria'),
('Legaspi Marco'),
('Keaton Reginald'),
('Scott Edward'),
('Johnson Roberto'),
('Swaney Selena'),
('Kelley Bree'),
('Carr William'),
('Webber Felix'),
('Bailey Homer'),
('Blount Dorris'),
('Nieves Guillermo'),
('Reimann John'),
('Devries Elvira'),
('Howard Joyce'),
('Garrett Barbara'),
('Panek Gloria'),
('Sanford Palmira'),
('Bandy David'),
('Scott Theresa'),
('Howard Russell'),
('Nicklas August'),
('Vaughn Rosie'),
('Johnson Marty'),
('Weatherspoon Karen'),
('Schwarz Art'),
('Fritts Jennifer'),
('Dahlin Andrea'),
('Prickett Michael'),
('Johnson William'),
('Harvey Devon'),
('Baker Marilyn'),
('Alexander Johnnie'),
('Mitchell Francisco'),
('Wilson Bernard'),
('Deines Paul'),
('Hertz Ta'),
('Comstock John'),
('Rojas Evan'),
('Walton Marget'),
('Worrell Michael'),
('Orona Marybeth'),
('Smith Wayne'),
('Cain Clifton'),
('Coates David'),
('Li Ryan'),
('Dykes Lee'),
('Shackelford Donnie'),
('Aguilar Joan'),
('Roan Dewayne'),
('Esquibel Ashley'),
('Messing Marcia'),
('Tang Cora'),
('Campos James'),
('McCool Maria'),
('Williams Gregory'),
('Hancock Preston'),
('Gleason Dorothy'),
('Moore Steven');

--Создать таблицу salary
--Наполнить таблицу salary 16 строками
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

insert into salary(monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

--Создать таблицу employee_salary
--Наполнить таблицу employee_salary 40 строками, 10 из которых не существуют
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

select * from employee_salary;

insert into employee_salary(employee_id, salary_id)
values (1, 2),
(2, 4),
(3, 6),
(4, 8),
(6, 7),
(9, 9),
(23, 3),
(24, 1),
(34, 5),
(45, 10),
(39, 12),
(66, 13),
(49, 15),
(56, 11),
(70, 14),
(25, 2),
(64, 5),
(59, 13),
(37, 1),
(42, 7),
(31, 3),
(67, 9),
(33, 6),
(55, 4),
(22, 15),
(44, 11),
(11, 3),
(27, 8),
(51, 6),
(52, 5),
(90, 6),
(89, 11),
(88, 14),
(87, 2),
(86, 3),
(85, 8),
(84, 4),
(83, 5),
(82, 7),
(81, 9);

--Создать таблицу roles
create table roles(
id serial primary key,
role_name int not null unique
);

select * from roles;

--Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

--Наполнить таблицу roles 20 строками
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--Создать таблицу roles_employee
--Наполнить таблицу roles_employee 40 строками
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key  (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);

select * from roles_employee;

insert into roles_employee (employee_id, role_id)
values (1, 7),
(4, 20),
(5, 1),
(8, 3),
(10, 5),
(20, 9),
(48, 10),
(39, 12),
(29, 2),
(16, 4),
(69, 6),
(23, 8),
(3, 13),
(24, 17),
(32, 11),
(36, 19),
(43, 14),
(54, 18),
(57, 16),
(62, 15),
(50, 7),
(41, 20),
(19, 1),
(70, 3),
(31, 5),
(13, 9),
(15, 10),
(67, 12),
(53, 2),
(47, 4),
(26, 6),
(33, 8),
(38, 13),
(58, 17),
(52, 11),
(9, 19),
(64, 14),
(66, 18),
(59, 16),
(22, 15);

