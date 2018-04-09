
create table research_papers(
  paper_id int auto_increment,
  paper_name varchar(100) not null,
  corresponding_author varchar(50) not null,
  year int,
  primary key (paper_id)
/*  check (paper_id > 0) */
);

create table authors(
  author_id int auto_increment,
  author_name varchar(50) not null,
  primary key (author_id)
  /*check(author_id > 0)*/
);

create table genres(
  genre_name varchar(50),
  primary key (genre_name)
);

create table paper_author(
  author_id int not null,
  paper_id int not null,
  primary key (author_id,paper_id),
  FOREIGN KEY (paper_id) REFERENCES research_papers(paper_id)
	on delete cascade,
	FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

create table trusts (
	organization_id int auto_increment,
	organization_name varchar(100) not null,
	PRIMARY KEY (organization_id)
	/*check (organization_id > 0)*/
);

create table publishers(
	publisher_id int auto_increment,
	publisher_name varchar(100) not null unique,
	PRIMARY KEY (publisher_id)show 
	/*check(publisher_id > 0)*/
);

create table books(
	ISBN int,
	book_name  varchar(100) not null,
	year int not null,
	corresponding_author varchar(50) not null,
	publisher_id int not null,
	genre_name varchar(50),
	price int not null,
  _count int default 0,
	PRIMARY KEY (ISBN),
	FOREIGN KEY (genre_name) REFERENCES genres(genre_name),
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
	on delete cascade,
	check(price >= 0)
);

create table book_author(
	ISBN int not null,
	author_id int not null,
  primary key (ISBN,author_id),
	FOREIGN KEY (ISBN) REFERENCES books(ISBN)
	on delete cascade,
	FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

create table suppliers(
	supplier_id int auto_increment,
	supplier_name varchar(100) not null,
	address varchar(150),
	PRIMARY KEY (supplier_id)
	/*check(supplier_id > 0)*/
);

create table supplier_book(
	ISBN int not null,
	supplier_id int not null,
	supplied_date date,
	FOREIGN KEY (ISBN) REFERENCES books(ISBN)
	on delete cascade,
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
	on delete cascade
);

create table magazines(
	magazine_id int auto_increment,
	magazine_name varchar(100) not null,
	publisher_id int not null,
	PRIMARY KEY (magazine_id),
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
	on delete cascade
);

create table funding(
	organization_id int not null,
	amount int DEFAULT 0,
	transfer_date date,
	FOREIGN KEY (organization_id) REFERENCES trusts(organization_id)
	on delete cascade
);

create or replace table employees(
  employee_id int auto_increment,
  employee_name varchar(100) not null,
  username varchar(50) unique not null,
  _password varchar(50) not null,
  designation enum('librarian','manager','janitor','assistant_librarian') not null,
  salary int default 0,
  PRIMARY KEY (employee_id),
  check(salary >=0)
);

create table users(
	user_id varchar(50) not null,
	_password varchar (50) not null,
	name varchar(100) not null,
	phone_no bigint default null,
	email_address varchar(100) default null,
	issued_books int default 0,
	PRIMARY KEY (user_id),
	check(issued_books >=0 and issued_books < 6)
);

create table issue_book(
	id int auto_increment,
	ISBN int not null,
	user_id varchar(50) not null,
	issue_date date not null,
	return_date date not null,
	status_return enum('Y','N','L') default 'N',
	foreign key (ISBN) references books(ISBN)
	on delete cascade,
	foreign key (user_id) references users(user_id)
	on delete cascade,
  primary key(id)
);

create table departments(
	department_id int auto_increment,
	department_name varchar (50) not null,
	primary key (department_id)
);

create table manages(
	employ_id int not null,
	department_id int not null,
	foreign key (employ_id) references employees(employee_id),
	foreign key (department_id) references departments(department_id)
);

create table return_book(
	id int unique not null,
	return_date date not null,
	foreign key (id) references issue_book(id)
);

create table check_fine (
	id int unique not null,
	fine int default 0,
  paid enum('Y','N') default 'N',
	foreign key (id) references issue_book(id)
);

create table request_book(
	user_id varchar(50) not null,
	book_name varchar(50) not null,
	corresponding_author varchar(50) not null,
	foreign key (user_id) references users(user_id),
	primary key (user_id,book_name,corresponding_author)
);

create table request_book_2(
  book_name varchar(100) not null,
  corresponding_author varchar(50) not null,
  publisher_name varchar(50) default null,
  _count int default 1,
  primary key (book_name,corresponding_author)
);

create table insurance_details(
	id int auto_increment,
	org_name varchar(50) not null,
	valid_till date not null,
	primary key(id)
);

create table library_committee(
  id int auto_increment,
	name varchar(100) not null,
	designation varchar(100),
	primary key(id)
);

create table lost_book(
  user_id varchar(50) not null,
  ISBN int not null,
  foreign key(ISBN) references books(ISBN),
  foreign key(user_id) references users(user_id)
);
