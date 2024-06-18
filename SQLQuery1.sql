use library;
GO

create table authentication_system
(
signup_id int primary key,
passwordd varchar(20)
);

create table author
(
author_id int primary key,
name varchar(30),
publication_year int,
signup_id int foreign key references  authentication_system(signup_id)
);

create  table reader
(
reader_id int primary key,

email varchar(30),
addres varchar(30),
firstname varchar(30),
lastname varchar(30),
signup_id  int foreign key references  authentication_system(signup_id)
);
create table book
(
book_id int not null primary key,
author_id int foreign key references author(author_id),
yearr int,
title varchar(30) not null,
price float(20),
category varchar(30),
reader_id int foreign key references reader(reader_id),
returndate date ,
reserve date,
duedate date

);


create  table reader_phonenum
(
reader_id int references reader(reader_id) ,
phone_num int, 
primary key(reader_id,phone_num),
);
create table buy_book(
reader_id int references reader(reader_id) ,
book_id int references book(book_id) ,
buying_date date,
primary key(reader_id,book_id),


);

create table reader_comments (
reader_id int references reader(reader_id) ,
book_id int references book(book_id),
comment varchar(1000),
comment_date date,
primary key(reader_id,book_id)
);


create table adminn(
admin_id int primary key,
name varchar(30)
);

create table keeps_track(
admin_id int references adminn(admin_id),
reader_id int references reader(reader_id) ,
signup_id int references  authentication_system(signup_id),
primary key(reader_id,admin_id)
);
create table report(
reg_no int primary key,
book_id int references book(book_id),
reader_id int references reader(reader_id),
offers varchar(1000),
sales varchar(1000),
admin_id int references adminn(admin_id)
);