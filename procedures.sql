/* publisher_books takes name of publisher and shows all details of books he published and count else error */

delimiter :
create or replace  procedure publisher_books (_publisher_name varchar(50))
  begin
  declare temp_id int;
  if (_publisher_name in (select publisher_name from publishers)) then
    select P.publisher_id into temp_id
    from publishers as P
    where P.publisher_name = _publisher_name;

    select ISBN, book_name as title, _count as count
    from books
    where publisher_id = temp_id ;
  else
    signal sqlstate '50000'
    set MESSAGE_TEXT = 'error: invalid publisher name';
  end if;
end;:
delimiter ;

/* author_books takes name of author and shows details of books he wrote and count  else error */

delimiter :
create or replace  procedure author_books (_author_name varchar(50))
begin
  declare temp_id int;
  if (_author_name in (select author_name from authors)) then

    select A.author_id into temp_id
    from authors as A
    where A.author_name = _author_name;

    select book_name as title, _count as count
    from books
    where ISBN in (select ISBN from book_author where author_id = temp_id);

  else
    signal sqlstate  '50000'
    set MESSAGE_TEXT = 'error: invalid author name';
  end if;

end;:
delimiter ;

/*  book_genre takes genre as input and shows all books of that genre  else error */


delimiter :
create or replace  procedure book_genre (genre varchar(50))
begin
  if (genre in (select * from genres)) then
    select book_name as title , _count as count
    from books
    where genre_name = genre;
  else
    signal sqlstate  '50000'
    set MESSAGE_TEXT = 'error: no such genre';
  end if;
end;:
delimiter ;

/*  insert_book takes  */


delimiter :
create or replace procedure insert_book (isbn int, _book_name varchar(100), _year int, _corresponding_author varchar(50), _publisher_id int,n int)
begin
  if isbn not in (select ISBN from books) then
    insert into books(ISBN,book_name,year,corresponding_author,publisher_id,_count)
    values (isbn, _book_name, _year, _corresponding_author, _publisher_id,n);
  else
    update books
    set _count = _count + n
    where ISBN = isbn;
  end if;
end;:
delimiter ;


/* return_bk     */
delimiter :
create or replace procedure return_bk(user varchar(50),_isbn int,returndate date)
  begin
    declare iss_id int;
    select id into iss_id from issue_book where user_id = user and ISBN = _isbn and status_return = 'N';
    if (iss_id is not NULL) then
      insert into return_book(id,return_date) values (iss_id,returndate);
    else
      signal sqlstate '50000'
      set message_text = "the user haven't issued the book";
    end if;
  end;:
delimiter ;

delimiter :
create or replace procedure get_book_history (isbn int)
begin
  declare id int;
    if(isbn in (select ISBN from books)) then
      select ISBN into id from books
      where ISBN = isbn;

      select name from users
      where user_id in (select user_id from issue_book where ISBN = id and status_return = 'N');
    else
      signal sqlstate '50000'
      set MESSAGE_TEXT = 'error: no books with such id';
    end if;
end;:
delimiter ;

delimiter :
create or replace procedure total_fine (userid varchar(50))
begin
  declare _fine int;
  if (userid in (select user_id from users)) then
    select SUM(fine) into _fine
    from check_fine
    where paid = 'N' and
    id in (select id from return_book where id in (select id from issue_book where user_id = userid));

    select _fine;
  else
    signal sqlstate  '50000'
    set MESSAGE_TEXT = 'error: no such user';
  end if;
end;:
delimiter ;

delimiter :
create or replace procedure req_book(id varchar(50),bk_name varchar(50), corr_author varchar(50))
begin

  insert into request_book(user_id, book_name,corresponding_author) values (id, bk_name, corr_author);
  if (bk_name in (select book_name from request_book_2 where corresponding_author = corr_author)) then
     update request_book_2 set _count = _count + 1
     where book_name = bk_name and corresponding_author = corr_author;
  else
     insert into request_book_2(book_name,corresponding_author) values (bk_name,corr_author);
  end if;
end;:
delimiter ;

delimiter :
create or replace procedure users_details()
  begin
    select * from users where name = substring_index(user(),'@',1);
  end;:
delimiter ;

delimiter :
create or replace procedure user_book_details()
  begin
    select * from issue_book where user_id = substring_index(user(),'@',1);
  end;:
delimiter ;

delimiter :
create or replace procedure user_fine_details()
  begin
    select C.id,I.ISBN,I.user_id,I.issue_date,C.fine,C.paid
    from check_fine as C inner join issue_book as I
    on C.id = I.id;
  end;:
delimiter ;

delimiter :
create or replace procedure employee_details()
begin
  select * from employees where username = substring_index(user(),'@',1);
end;:
delimiter ;

delimiter :
create or replace procedure create_user (user_id varchar(50),_password varchar(50))
  begin
    set @type = 'user';
    set @query = CONCAT('create user "', user_id,'"@"localhost" identified by "',_password,'"');
    prepare stmt from @query;
    Execute stmt;
    deallocate prepare stmt;

    set @query2 = CONCAT('grant users to "',user_id,'"@"localhost"');
    prepare stmt from @query2;
    EXECUTE stmt;
    DEALLOCATE prepare stmt;
  end;:
delimiter ;

delimiter :
create or replace procedure create_user_employ(username varchar(50), _password varchar(50),designation enum('librarian','manager','janitor','assistant_librarian'))
begin

  set @query = CONCAT('create user ', username,'@"localhost" identified by "',_password,'"');
  prepare stmt from @query;
  Execute stmt;
  deallocate prepare stmt;

  if designation = 'manager' then
    set @query2 = CONCAT('grant manager to ',username,'@"localhost"');
    prepare stmt from @query2;
    EXECUTE stmt;
    DEALLOCATE prepare stmt;
  elseif designation = 'assistant_librarian' then
    set @type = 'assistant_librarian';
    set @query2 = CONCAT('grant assistant_librarian to ',username,'@"localhost"');
    prepare stmt from @query2;
    EXECUTE stmt;
    DEALLOCATE prepare stmt;
  elseif designation = 'librarian' then
    set @query2 = CONCAT('grant librarian to ',username,'@"localhost"');
    prepare stmt from @query2;
    EXECUTE stmt;
    DEALLOCATE prepare stmt;
  end if;
end;:
delimiter ;
