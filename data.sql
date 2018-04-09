into insert authors(author_name) values ('Vanessa Moulton'), ('Eirini Flouri'),('Heather Joshi'), ('Alice Sullivan');
insert into research_papers(paper_name,corresponding_author,year) values ("Individual-level predictors of young children's aspirations",'Vanessa Moulton',2016);
insert into paper_author(author_id,paper_id) values (1,1),(2,1),(3,1),(4,1);
insert into genres(genre_name) values ('Crime'),('Fiction'),('Thriller');
insert into publishers(publisher_name) values ('Bloomsbury');
insert into authors(author_name) values ('Rowling');
insert into books(ISBN,book_name,year,corresponding_author,publisher_id,price,genre_name) values (1234,'Harry Potter and the Deathly Hallows',2007,'Rowling',1,570,'Fiction');
insert into magazines(magazine_name,publisher_id) values ('magazine movements',1);
insert into suppliers(supplier_name) values ('Flipkart');
insert into supplier_book(ISBN,supplier_id) values (1234,1);
insert into book_author(ISBN,author_id) values (1234,5);
insert into departments(department_name) values ('Technical');
insert into users(user_id,_password,name,phone_no,email_address) values ('aditya32','mettu','Aditya',9497140406,'adithya.may6@gmail.com');
insert into employees(employee_name,username,_password,designation) values ('Hemanth','hemanth56','kprl1234','librarian');
insert into issue_book(ISBN,user_id,issue_date,return_date) values (1234,'aditya32','2017-05-06','2017-06-06');
insert into employees(employee_name,username,_password,designation) values ('Hemanth','aditya32','kprl1234','librarian');
insert into users(user_id,_password,name,phone_no,email_address) values ('hemanth56','mettu','Aditya',9497140406,'adithya.may6@gmail.com');


select count(id) from issue_book where user_id = 'aditya32';

create role user;
create role librarian;
create role assistant_librarian;
create role manager;
create role janitor;

grant select on books to users;
grant select on research_papers to users;
grant select on publishers to users;
grant select on genres to users;
grant select on authors to users;	
grant select on magazines to users;	
grant execute on procedure users_details to users;
grant execute on procedure user_fine_details to users;
grant execute on procedure user_book_details to users;
grant execute on procedure publisher_books to users;
grant execute on procedure author_books to users;
grant execute on procedure book_genre to users;
grant execute on procedure req_book to users;
grant execute on procedure issue_details to users;


grant select,insert,update,delete on books to manager;
grant select, insert,update on authors to manager;
grant select,insert,update,delete on supplier_book to manager;
grant select ,insert, update,delete on genres to manager;
grant select ,insert, update,delete on publishers to manager;
grant select,insert,update,delete on suppliers to manager;
grant select,insert,update,delete on book_author to manager;
grant select,insert,update,delete on research_papers to manager;
grant select,insert,update,delete on magazines to manager;
grant execute on procedure employee_details to manager;
grant execute on procedure insert_book to manager;
grant execute on procedure publisher_books to manager;
grant execute on procedure author_books to manager;
grant execute on procedure book_genre to manager;

grant execute on procedure employee_details to assistant_librarian;
grant select,insert,update,delete on users to assistant_librarian;
grant select,insert,update,delete on issue_book to assistant_librarian;
grant select,insert,update,delete on return_book to assistant_librarian;
grant select,insert,update on check_fine to assistant_librarian;
grant execute on procedure return_bk to assistant_libraraian;
grant execute on procedure user_fine_details to assistant_librarian;
grant execute on procedure insert_book to assistant_librarian;
grant execute on procedure get_book_history to assistant_librarian;
grant execute on procedure total_fine to assistant_librarian;
// write a procedure for return book for librarian
//

grant select,insert,delete,update on * to librarian;
grant grant option on * to librarian;

drop user '5002'@'localhost';
call create_user('5002','Mettu');

drop user 'Sachin'@'localhost';
call create_user_employ('Sachin','Sachin10','assistant_librarian');


call return_bk('5002',104,'2018-08-10');

call total_fine ('5002');

call employee_details();

call user_details();

call user_fine_details();

call book_genre('Art');







