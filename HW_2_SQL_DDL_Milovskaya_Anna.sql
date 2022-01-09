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


--1. Вывести всех работников, чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employee_salary
join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id;

--2. Вывести всех работников, у которых ЗП меньше 2000.
select employee_name from employee_salary
join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно, кто её получает.)
select monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where employee_id is null;

--4. Вывести все зарплатные позиции меньше 2000, но работник по ним не назначен. (ЗП есть, но не понятно, кто её получает.)
select monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where employee_id is null
and monthly_salary < 2000;

--5. Найти всех работников, кому не начислена ЗП.
select employee_name, monthly_salary from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary.id = employee_salary.salary_id
where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id;

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Java %';

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Automation%';

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles_employee.role_id = roles.id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name from employee_salary es 
full join salary s on es.salary_id=s.id 
full join roles_employee re on re.employee_id=es.employee_id 
full join roles r on r.id=re.role_id 
where role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name from employee_salary es 
full join salary s on es.salary_id=s.id 
full join roles_employee re on re.employee_id=es.employee_id 
full join roles r on r.id=re.role_id 
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles.id = roles_employee.role_id
where role_name like 'Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles.id = roles_employee.role_id
where role_name like 'Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id 
left join roles_employee on roles_employee.employee_id = employees.id
left join roles on roles.id = roles_employee.role_id
where role_name like 'Senior Java %';

--20. Вывести зарплаты Junior QA инженеров
select monthly_salary, role_name from employee_salary es 
full join salary s on es.salary_id=s.id 
full join roles_employee re on re.employee_id=es.employee_id 
full join roles r on r.id=re.role_id 
where role_name like '%Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from salary
left join employee_salary on salary.id = employee_salary.salary_id 
left join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) as sum_salary_JS from salary
full join employee_salary on salary.id = employee_salary.salary_id 
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id 
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) as min_salary_QA from salary
full join employee_salary on salary.id = employee_salary.salary_id 
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) as max_salary_QA from salary
full join employee_salary on salary.id = employee_salary.salary_id 
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--25. Вывести количество QA инженеров
select count (*) as count_QA from employees e 
join roles_employee on e.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
select count (*) as count_middle from employees e 
join roles_employee on e.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count (*) as count_dev from employees e 
join roles_employee on e.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as sum_dev from salary
full join employee_salary on salary.id = employee_salary.salary_id 
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees 
left join employee_salary es on es.employee_id = employees.id 
left join salary on es.salary_id = salary.id 
left join roles_employee re on re.employee_id =employees.id 
left join roles on re.role_id = roles.id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию специалистов, у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees
left join employee_salary es on es.employee_id = employees.id 
left join salary on es.salary_id = salary.id 
left join roles_employee re on re.employee_id = es.employee_id 
left join roles on re.role_id = roles.id
where monthly_salary between '1700' and '2300'
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию специалистов, у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees
left join employee_salary es on es.employee_id = employees.id 
left join salary on es.salary_id = salary.id 
left join roles_employee re on re.employee_id =employees.id 
left join roles on re.role_id = roles.id
where monthly_salary < '2300'
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию специалистов, у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees
left join employee_salary es on es.employee_id = employees.id 
left join salary on es.salary_id = salary.id 
left join roles_employee re on re.employee_id =employees.id 
left join roles on re.role_id = roles.id
where monthly_salary in ('1100', '1500', '2000')
order by monthly_salary;
