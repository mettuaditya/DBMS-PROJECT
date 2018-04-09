/*delimiter :
create trigger check_employ before insert on issue_book
begin
  declare curr_user varchar(50);
  select substring_index(user(), '@', 1) into curr_user;
  if (curr_user not in (select username from employees where designation in ('assistant_librarian','librarian'))) then
    signal sqlstate '50000'
    set message_text = 'The current user is not allowed to issue a book';
  end if;
end;:
delimiter ;

delimiter :
create trigger book_iss before insert on issue_book
for each row
begin
  declare temp_count int;
  select _count into temp_count from books where ISBN = new.ISBN;
  if (temp_count > 0 ) then
    update books
    set _count = _count -1
    where ISBN = new.ISBN;
  else
    SIGNAL SQLSTATE "50000"
    SET message_text = "no books available";
  end if;
end;:
delimiter ;
*/

*/delimiter :
create  or replace trigger valid_issue before insert on issue_book
for each row
begin
  declare curr_user varchar(50);
  declare tot_fine int;
  declare book_count int;
  declare lost_books int;
  declare temp_count int;
  /*select * into tot_fine from (call total_fine(new.user_id))dt;
   */select _count into temp_count from books where ISBN = new.ISBN;
  /*select substring_index(user(), '@', 1) into curr_user;
  */select count(id) into lost_books from issue_book where user_id = new.user_id and status_return = 'L';

  call total_fine(new.user_id);
  select issued_books into book_count from users where user_id= new.user_id;
  /*if (curr_user not in (select username from employees where designation in ('assistant_librarian','librarian'))) then
    signal sqlstate '50000'
    set message_text = 'issue not valid';
  end if;
  */if ((book_count = 5) or (lost_book > 3) or (temp_count <=0)) then
    SIGNAL sqlstate "50000"
 	  set message_text = "issue not valid";
  /*elseif (book_count = 5) then
    signal sqlstate "50000"
    set message_text = "maximum book limit reached";
  elseif (lost_books > 3) then
    signal sqlstate '50000'
    set message_text = "user not eligible to issue a book";
  elseif (temp_count <= 0) then
    signal SQLSTATE "50000"
    set message_text = "no books available";
  */end if;
end;:
delimiter ;
*/

delimiter :
create or replace trigger valid_issue before insert on issue_book
for each row
begin
declare book_count int;
declare lost_books int;
declare temp_count int;
select _count into temp_count from books where ISBN = new.ISBN;
select count(id) into lost_books from issue_book where user_id =
new.user_id and status_return = 'L';
select issued_books into book_count from users where user_id= new.user_id;
if (book_count = 5) then
        signal sqlstate "50000"
            set message_text = "maximum book limit reached";
  elseif (lost_books > 3) then
            signal sqlstate '50000'
            set message_text = "user not eligible to issue a book";
        elseif (temp_count <= 0) then
            signal SQLSTATE "50000"
            set message_text = "no books available";
end if;
end;:
delimiter ;

delimiter :
create or replace trigger valid_iss_2 before insert on issue_book
for each row
begin
    declare curr_user varchar(50);

    declare _fine int;
    select substring_index(user(), '@', 1) into curr_user;
     if (curr_user not in (select username from employ_d where
designation in ('assistant_librarian','librarian'))) then
    signal sqlstate '50000'
    set message_text = 'The current user is not allowed to issue a book';
  end if;
  
  if(new.ISBN in (select ISBN from issue_book where user_id = new.user_id and status_return = 'N')) then 
  signal sqlstate '50000'
  set message_text = 'book already issued';
  end if;

    select SUM(fine) into _fine
    from check_fine
    where paid = 'N' and
    id in (select id from return_book where id in (select id from
issue_book where user_id = new.user_id));

    if (_fine > 500) then
       signal sqlstate '50000'
       set message_text = 'book cannot be issued';
    end if;
end;:
delimiter ;


delimiter :
create or replace trigger iss_book after insert on issue_book
for each row
begin
  update books
  set _count = _count -1
  where ISBN = new.ISBN;

  update users
  set issued_books = issued_books + 1
  where user_id = new.user_id;
end;:
delimiter ;

delimiter :
create trigger check_username before insert on users
for each row
begin
  if new.user_id in (select username from employees) then
    signal sqlstate "50000"
    set message_text = "username already taken";
  end if;
end;:
delimiter ;

delimiter :
create trigger check_user_id before insert on employees
for each row
begin
  if new.username in (select user_id from users) then
    signal sqlstate "50000"
    set message_text = "username already taken";
  end if;
end;:
delimiter ;

/*delimiter :
create trigger check_employ_2 before insert on return_book
for each row
begin
  declare curr_user varchar(50);
  select substring_index(user(), '@', 1) into curr_user;
  if (curr_user not in (select username from employees where designation in ('assistant_librarian','librarian'))) then
    signal sqlstate '50000'
    set message_text = 'The current user is not allowed to issue a book';
  end if;

  if (new.id <=0) then
    signal sqlstate '50000'
    set message_text = 'The current user is not allowed to issue a book';
  end if;
end;:
delimiter ;
*/
delimiter :
create or replace trigger ret_book  before insert on return_book
for each row
begin
  declare curr_user varchar(50);
  select substring_index(user(), '@', 1) into curr_user;
  if (curr_user not in (select username from employ_d where designation in ('assistant_librarian','librarian'))) then
    signal sqlstate '50000'
    set message_text = '1--The current user is not allowed to issue a book';
  end if;

  if (new.id <=0) then
    signal sqlstate '50000'
    set message_text = "2--The current user is not allowed to issue a book";
  else
    update books set _count = _count + 1
    where ISBN in (select ISBN from issue_book where id = new.id);

    update users set issued_books = issued_books - 1
    where user_id in (select user_id from issue_book where id = new.id);

    update issue_book set status_return = 'Y'
    where id = new.id;
  end if;
end;:
delimiter ;

delimiter :
create or replace trigger check_issued_books before update on users
for each row
begin
  declare book_iss int;
  declare book_iss_count int;

  select issued_books into book_iss from users where user_id = new.user_id;
  select count(id) into book_iss_count from issue_book where user_id = new.user_id and status_return = 'N';

  /*if (new.issued_books <> (book_iss_count -1)) then
    signal sqlstate '50000'
    set message_text = "invalid count on books issued to user";
  end if;*/
end;:
delimiter ;

delimiter :
create or replace trigger fine_cal after insert on return_book
for each row
begin
  declare temp_days int;
  declare penalty int;
  declare ret_date date;
  select return_date into ret_date from issue_book where id = new.id;
  select datediff(new.return_date, ret_date) as days into temp_days;
  if (temp_days > 0) then
    insert into check_fine (id,fine,paid) values (new.id,0,'N');
    update check_fine set fine = temp_days * 10 where id = new.id;
    
  else
    insert into check_fine (id,fine,paid) values (new.id,0,'Y');
  end if;
end;:
delimiter ;

delimiter :
create trigger check_isbn before insert on books
for each row
begin
  if (new.ISBN <= 0) then
    signal sqlstate '50000'
    set message_text = 'invalid ISBN number';

  end if;
end;:
delimiter ;
/*signal sqlstate '50000'
  set message_text = 'The current user is not allowed to issue a book'
*/
/*delimiter :
create trigger check_magazine_id before insert on magazines
for each row
begin
  if (new.magazine_id <= 0 ) then
  signal sqlstate '50000'
  set message_text = 'invalid magazine_id';
end if;
end;:
delimiter ;
*/

delimiter :
create or replace trigger book_lost before insert on lost_book
for each row
begin
  declare cost int;
  declare i_id int;
  declare curr_user varchar(50);
  select price into cost from books where ISBN = new.ISBN;
  select substring_index(user(), '@', 1) into curr_user;
  if (curr_user in (select username from employ_d where designation in ('assistant_librarian','librarian'))) then
    select id into i_id from issued_books where status_return = 'N' and ISBN = new.ISBN and user_id = new.ISBN;
    if (i_id not in (select id from issued_books)) then
      signal sqlstate '50000'
      set message_text = "no such entry";
    else
      insert into check_fine values(i_id,cost,'N');
      update issued_books set status_return = 'L' where id = i_id;
    end if;
    
  else
   signal sqlstate '50000'
    set message_text = "The current user is not allowed to issue a book";
    
  end if;
end;:
delimiter ;
