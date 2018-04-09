insert into research_papers(paper_id, paper_name, corresponding_author, year) values (1,'Applied Sciences', 'Bruce Wayne', 2005);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (2,'Physical Sciences', 'Oliver Queen', 2012);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (3,'Sciences', 'Steve Rogers', 2005);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (4,'Biology', 'Peter Parker', 2006);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (5,'Robotics', 'Tony Stark', 2008);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (6,'Game Science', 'Hugh', 2004);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (7,'Human Computer Interaction', 'Jack', 2005);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (8,'Computer Architecture', 'James', 2007);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (9,'Artificial Intelligence', 'Ricky', 2008);
insert into research_papers(paper_id, paper_name, corresponding_author, year) values (10,'Sociology', 'Tim Cook', 2010);



insert into authors(author_id, author_name) values (2,'Bruce Wayne');
insert into authors(author_id, author_name) values (1,'Oliver Queen');
insert into authors(author_id, author_name) values (5,'Steve Rogers');
insert into authors(author_id, author_name) values (4,'Peter Parker');
insert into authors(author_id, author_name) values (3,'Tony Stark');
insert into authors(author_id, author_name) values (6,'Hugh');
insert into authors(author_id, author_name) values (8,'James');
insert into authors(author_id, author_name) values (7,'Jack');
insert into authors(author_id, author_name) values (10,'Ricky');
insert into authors(author_id, author_name) values (9,'Tim Cook');
insert into authors(author_id, author_name) values (11, 'Suzanne Collins');
insert into authors(author_id, author_name) values (12, 'Dan Brown');
insert into authors(author_id, author_name) values (13, 'George R.R. Martin');
insert into authors(author_id, author_name) values (14, 'William Godling');
insert into authors(author_id, author_name) values (15, 'J Tolkien');
insert into authors(author_id, author_name) values (16, 'Jane Austin');
insert into authors(author_id, author_name) values (17, 'Sebastian Thrun');
insert into authors(author_id, author_name) values (18, 'John Craig');
insert into authors(author_id, author_name) values (19, 'Isaac Asimov');
insert into authors(author_id, author_name) values (20, 'John Diggle');
insert into authors(author_id, author_name) values (21, 'Marylin Burns');
insert into authors(author_id, author_name) values (22, 'G Hardy');
insert into authors(author_id, author_name) values (23, 'David Beckam');
insert into authors(author_id, author_name) values (24, 'E Gombrich');
insert into authors(author_id, author_name) values (25, 'Bansky');
insert into authors(author_id, author_name) values (26, 'Phaidon Press');
insert into authors(author_id, author_name) values (27, 'Carl Segan');
insert into authors(author_id, author_name) values (28, 'Stephen Hawking');


insert into genres values ('Entertainment');
insert into genres values ('Fiction');
insert into genres values ('Robotics');
insert into genres values ('Mathematics');
insert into genres values ('Sciences');
insert into genres values ('Art');



insert into paper_author values (2,1);
insert into paper_author values (1,2);
insert into paper_author values (5,3);
insert into paper_author values (4,4);
insert into paper_author values (3,5);
insert into paper_author values (6,6);
insert into paper_author values (8,7);
insert into paper_author values (7,8);
insert into paper_author values (10,9);
insert into paper_author values (9,10);




insert into trusts values (1, 'AIWA');
insert into trusts values (2, 'NEF');	


insert into publishers values (1, 'Jaico Publishing House');
insert into publishers values (2, 'Westland Publications');
insert into publishers values (3, 'Rupa Publications');
insert into publishers values (4, 'Aleph Book Company');
insert into publishers values (5, 'Scholastic India');

insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (-1, 'The Hunger Games', 2005, 'Suzanne Collins', 3, 'Entertainment', 4500, 5);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (102, 'Catching Fire', 2004, 'Suzanne Collins', 4, 'Entertainment', 6500, 5);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (103, 'Angels & Demons', 2010, 'Dan Brown', 4, 'Entertainment', 4000, 6);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (104, 'A Game of Thrones', 2012, 'George R.R. Martin', 3, 'Entertainment', 4000, 6);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (201, 'Lord of the Rings', 2004, 'William Godling', 5, 'Fiction', 8000, 4);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (202, 'The Hobbit', 2004, 'J Tolkien', 5, 'Fiction', 5000, 8);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (203, 'Pride and Prejudice', 2006, 'Jane Austin', 1, 'Fiction', 9000, 9);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (204, 'The Mockingjay', 2005, 'Suzanne Collins', 1, 'Fiction', 4500, 3);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (301, 'Probabilistic Robotics', 2008, 'Sebastian Thrun', 2, 'Robotics', 2000, 3);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (302, 'Introduction to Robotics', 2009, 'John Craig', 2, 'Robotics', 5000, 3);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (303, 'The Positronic Man', 2011, 'Isaac Asimov', 4, 'Robotics', 4000, 3);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (304, 'I, Robot', 2010, 'Isaac Asimov', 4, 'Robotics', 7521, 6);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (401, 'Math Curse', 2005, 'John Diggle', 3, 'Mathematics', 6500, 8);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (402, 'The Greed Triangle', 2001, 'Marylin Burns', 1, 'Mathematics', 8500, 2);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (403, 'A Mathematician Apology', 2005, 'G Hardy', 3, 'Mathematics', 6500, 8);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (404, 'How Much is a Million', 2011, 'David Beckam', 2, 'Mathematics', 7500, 10);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (501, 'The Story of Art', 2017, 'E Gombrich', 1, 'Art', 9000, 15);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (502, 'Wall and Piece', 2016, 'Bansky', 1, 'Art', 4500, 20);	
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (503, 'The Art Book', 2012, 'Phaidon Press', 5, 'Art', 1000, 2);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (601, 'Cosmos', 2011, 'Carl Segan', 5, 'Sciences', 8500, 4);
insert into books(ISBN, book_name, year, corresponding_author, publisher_id, genre_name, price, _count) values (602, 'The Grand Design', 2012, 'Stephen Hawking', 5, 'Sciences', 500, 8);



insert into book_author values (101, 11);
insert into book_author values (102, 11);
insert into book_author values (103, 12);
insert into book_author values (104, 13);
insert into book_author values (201, 14);
insert into book_author values (202, 15);
insert into book_author values (203, 16);
insert into book_author values (204, 11);
insert into book_author values (301, 17);
insert into book_author values (302, 18);
insert into book_author values (303, 19);
insert into book_author values (304, 19);
insert into book_author values (401, 20);
insert into book_author values (402, 21);
insert into book_author values (403, 22);
insert into book_author values (404, 23);
insert into book_author values (501, 24);
insert into book_author values (502, 25);
insert into book_author values (503, 26);
insert into book_author values (601, 27);
insert into book_author values (602, 28);


insert into suppliers values (151, 'Bali & Sons', 'Khadki (E), Pune');
insert into suppliers values (152, 'Goel Book Agencies', 'Appa Balwant Chowk, Pune');
insert into suppliers values (153, 'The Tamsh Book Depot', 'Salatwada, Vadodara');
insert into suppliers values (154, 'Sai Ram Book Links', 'Kummari Street, Vijaywada');



insert into supplier_book values (101, 151, '2018-01-12');
insert into supplier_book values (102, 152, '2018-01-25');
insert into supplier_book values (103, 153, '2018-01-24');
insert into supplier_book values (104, 151, '2018-01-22');
insert into supplier_book values (201, 152, '2018-01-26');
insert into supplier_book values (202, 152, '2018-01-27');
insert into supplier_book values (203, 154, '2018-01-27');
insert into supplier_book values (204, 152, '2018-01-28');
insert into supplier_book values (301, 153, '2018-01-29');
insert into supplier_book values (302, 153, '2018-01-30');
insert into supplier_book values (303, 152, '2018-01-01');
insert into supplier_book values (304, 151, '2018-03-01');
insert into supplier_book values (401, 151, '2018-02-12');
insert into supplier_book values (402, 152, '2018-02-16');
insert into supplier_book values (403, 154, '2018-01-31');
insert into supplier_book values (404, 151, '2018-01-11');
insert into supplier_book values (501, 153, '2018-01-13');
insert into supplier_book values (502, 152, '2018-02-14');
insert into supplier_book values (503, 152, '2018-01-26');
insert into supplier_book values (601, 154, '2018-01-23');
insert into supplier_book values (602, 154, '2018-01-21');


insert into magazines values (251, 'Business India', 2);
insert into magazines values (252, 'Business Today', 3);
insert into magazines values (253, 'Champak', 1);
insert into magazines values (254, 'The Caravan', 4);
insert into magazines values (255, 'Data Quest', 5);
insert into magazines values (256, 'India Today', 1);
insert into magazines values (257, 'Forbes India', 1);
insert into magazines values (258, 'Organiser', 3);
insert into magazines values (259, 'Sportstar', 4);
insert into magazines values (260, 'Vogue', 5);


insert into funding values (1, 200000, '2017-11-25');
insert into funding values (2, 100000, '2017-08-23');
insert into funding values (1, 200000, '2017-06-24');
insert into funding values (2, 10000000, '2018-03-03');


insert into employees values (1001, 'Ram', 'Ram11', 'qwerty', 'janitor', 7500);
insert into employees values (1002, 'Krishna', 'Krish11', 'abcd', 'janitor', 6500);
insert into employees values (1003, 'Ravi', 'Ravi123', 'Ravi123', 'janitor', 8500);
insert into employees values (1004, 'Shankar', 'Shankar31', 'zxcvb', 'janitor', 5000);
insert into employees values (1005, 'Lakshmi', 'Lakshmi', 'goddess', 'janitor', 6000);
insert into employees values (2001, 'Sachin', 'Sachin10', 'master', 'assistant_librarian', 45000);
insert into employees values (2002, 'Shiva', 'Shiv', 'ashjklh', 'assistant_librarian', 25000);
insert into employees values (3001, 'Adittya', 'Adi1', 'adsfada', 'manager', 50000);
insert into employees values (3002, 'Lokesh', 'loki', 'asxaa', 'manager', 40000);
insert into employees values (3003, 'Samm', 'sammm', 'ratawdfsaass', 'manager', 45000);
insert into employees values (3004, 'Mrinal', 'mrin1', 'adsgve', 'manager', 35000);
insert into employees values (3005, 'rohi', 'roh1', 'bbbb', 'manager', 30000);
insert into employees values (4001, 'Tinku Reddy', 'detective_dp', 'billionairePlayboy', 'librarian', 150000);




insert into users values ('5001', 'reddy', 'Durga Prasad Reddy', 9447709835, 'dp.kasireddy@gmail.com', 0);
insert into users values ('5002', 'Mettu', 'Adithya Mettu', 9876543210, 'adithya@yahoo.in', 0);
insert into users values ('5003', 'asdgadhaha', 'Prathyush', 9565452354, 'prat1@gmail.com', 0);
insert into users values ('5004', 'asdfabff', 'Hemanth', 8956238956, 'hem2@gmail.com', 0);
insert into users values ('5005', 'uyfhg', 'Nikhil', 7894563574, 'nikk3@gmail.com', 0);
insert into users values ('5006', 'haljdf', 'Samuel', 6895321470, 'sam4@gmail.com', 0);
insert into users values ('5007', 'adshjdsb', 'Rohith', 5558889979, 'rohith@gmail.com', 0);
insert into users values ('5008', 'adsgae', 'Shyam', 9988776655, 'shyam@gmail.com', 0);
insert into users values ('5009', 'qehdsjb', 'Sundar', 9663369662, 'sundar@gmail.com', 0);
insert into users values ('5010', 'yirshd', 'Pichai', 9889988998, 'Pichai@gmail.com', 0);
insert into users values ('5011', 'bvmxb', 'Rick', 7877887788, 'rick@gmail.com', 0);
insert into users values ('5012', 'zczvcb', 'Gonzalez', 9633699669, 'gon@gmail.com', 0);
insert into users values ('5013', 'jghfdslj', 'Yagami', 7884557855, 'light@gmail.com', 0);
insert into users values ('5014', 'adsfu', 'Killua', 5566556565, 'kill@gmail.com', 0);
insert into users values ('5015', 'hjngf', 'Zoldyk', 202022002, 'zoldyk@gmail.com', 0);
insert into users values ('5016', 'zcvbujf', 'Kite', 3663552411, 'kite@gmail.com', 0);
insert into users values ('5017', 'adsgvsx', 'Sasuke', 7897897897, 'sasuke@gmail.com', 0);
insert into users values ('5018', 'adsgvdsfg', 'Uchiha', 7854785478, 'uchiha@gmail.com', 0);
insert into users values ('5019', 'adsuaoot', 'Charlie', 9123650986, 'char@gmail.com', 0);
insert into users values ('5020', 'uowreyij', 'Amell', 9636963696, 'step@gmail.com', 0);



insert into issue_book(ISBN, user_id, issue_date, return_date) values (101, '5001', '2017-12-12', '2018-01-12');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (102, '5001', '2017-12-12', '2018-01-12');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (103, '5002', '2017-11-11', '2017-12-11');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (103, '5003', '2017-11-13', '2017-12-13');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (104, '5002', '2017-10-10', '2017-11-10');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (201, '5004', '2017-09-09', '2017-10-09');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (202, '5004', '2017-08-23', '2017-08-23');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (203, '5005', '2017-11-30', '2017-12-30');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (204, '5006', '2017-12-31', '2018-01-31');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (301, '5007', '2017-06-06', '2017-07-06');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (302, '5008', '2017-09-15', '2017-10-15');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (401, '5010', '2018-02-02', '2018-03-02');
insert into issue_book(ISBN, user_id, issue_date, return_date) values (404, '5015', '2018-03-03', '2018-04-03');	



insert into departments(department_name) values ('Acquisition');
insert into departments(department_name) values ('Technical');
insert into departments(department_name) values ('Circulation');
insert into departments(department_name) values ('Reference');
insert into departments(department_name) values ('Finance');


insert into manages values (3001,1);
insert into manages values (3002,2);
insert into manages values (3003,3);
insert into manages values (3004,4);
insert into manages values (3005,5);


call req_book ('5001', 'Fire Catch', 'Suzanne Collins');
call req_book ('5015', 'Fire Catch', 'Suzanne Collins');
call req_book ('5002', 'Grand Design', 'Stephen Hawking');
call req_book ('5004', 'Mathematics Apology', 'G Hardy');
call req_book ('5010', 'The Cosmos', 'Carl Segan');
call req_book ('5014', 'Art Book', 'Phaidon Press');

insert into request_book values ('5001', 'Catching Fire', 'Suzanne Collins');
insert into request_book values ('5015', 'Catching Fire', 'Suzanne Collins');
insert into request_book values ('5002', 'The Grand Design', 'Stephen Hawking');
insert into request_book values ('5004', 'A Mathematics Apology', 'G Hardy');
insert into request_book values ('5010', 'Cosmos', 'Carl Segan');
insert into request_book values ('5014', 'The Art Book', 'Phaidon Press');


insert into insurance_details(org_name, valid_till) values ('Tata', '2024-12-12');
insert into insurance_details(org_name, valid_till) values ('Bajaj', '2025-12-12');

insert into library_committee(name, designation) values ('Tinku Reddy', 'Director');
insert into library_committee(name, designation) values ('Ritesh', 'Asst. Director');
insert into library_committee(name, designation) values ('Srikar', 'M.D');
insert into library_committee(name, designation) values ('Sanhith', 'Head Of All Departments');

insert into lost_book values ('5002', 103);
insert into lost_book values ('5008', 302);
insert into lost_book values ('5010', 401);
insert into lost_book values ('5015', 404);



call return_bk(user_id, ISBN, return_date)
call return_bk ('5015', 404, '2018-04-02');
call return_bk ('5010', 401, '2018-04-02');
call return_bk ('5008', 302, '2017-10-15');







