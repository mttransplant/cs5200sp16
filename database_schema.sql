drop database if exists SRS;
create database SRS;
use SRS;

create table Building
(
	id int primary key,
	fname varchar(255),
	address varchar(255)
	
);

create table Location
(
	id int primary key,
	building int not null,
	foreign key(building) references Building(id)
		on update cascade on delete cascade,
	room_no varchar(250) not null
);

create table Department
(
	id int primary key,
	name varchar(255) not null,
	phoneNumber varchar(10),
	location int,
	foreign key (location) references Location(id)
		on update cascade on delete no action
);

create table Major
(
	id int primary key,
	name varchar(255) not null,
	department int,
	foreign key (department) references Department(id)
		on update cascade on delete no action
);

Create table Advisor
(
	id int primary key auto_increment,
 	fName varchar(255) not null,
	lName varchar(255) not null,
	email varchar(255),
	phone varchar(10),
	location integer,
	foreign key (location) references Location(id)
		on update cascade on delete set null
);

create table Student 
	(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
	sID char(8) not null,
	major integer,
	foreign key (major) references Major(id)
		on update cascade on delete set null,
	address1 varchar(255) not null,
	address2 varchar(255),
	address3 varchar(255),
	city varchar(255) not null,
	state varchar(255) not null,
	country varchar(255) not null,
	phoneNumber varchar(15),
	advisor int,
	foreign key (advisor) references Advisor(id)
		on update cascade on delete set null,
	yearOfGraduation integer,
	livesOncampus enum('Yes','No') not null
	);

create table Course
	(
	id int primary key auto_increment,
	courseNumber int,
	title varchar(255),
	courseLevel varchar(255),
    description longtext,
	department int,
	foreign key (department) references Department(id) 
		on update cascade on delete no action
);

create table Instructor
(
	id int primary key auto_increment,
	fName varchar(255),
	lName varchar(255),
	department integer,
	officeLocation integer,
	foreign key (officeLocation) references Location(id)
		on update cascade on delete cascade
	
);

create table Section
	(
	id int primary key auto_increment,
	course int,
	location int,
	semester varchar(255),
	instructor int,
	foreign key (course) references Course(id) 
		on update cascade on delete no action
);

create table Registration 
	(
	student int,
	foreign key (student) references Student(id) 
		on update cascade on delete cascade,
	section int,
    foreign key (section) references Section(id)
		on update cascade on delete cascade,
	grade varchar(2),
 	time_stamp timestamp,
	primary key (student, section)
);

Create table OnCampusHousing
(
	id int primary key,
	student int,
	foreign key (student) references Student(id)
		on update cascade on delete no action,
	foreign key (location) references Location(id)
		on update cascade on delete no action,
	location int
);

INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Library', '1 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Tower 1', '2 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Tower 2', '3 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Student Center', '4 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 1', '5 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 2', '6 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 3', '7 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 1', '8 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 2', '9 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 3', '10 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dining Hall', '11 Main Street');