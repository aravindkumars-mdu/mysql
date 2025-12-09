--Create parent table tUser
create table tUser (user_id int(11) ,name varchar(50) not null,email_id varchar(50) not null ,password varchar(50) not null,address varchar(100) null,phone bigint(18) null, primary key (user_id));

--Create tFriends table with two foreign keys
create table tFriends (user_id int,friend_id int ,constraint fk_user foreign key (user_id) references tUser(user_id),constraint fk_friend foreign key (friend_id) references tUser(user_id));	

--Create tWall table with foreign key to tUser
create table tWall (user_id int ,posting_date datetime default current_timestamp ,post varchar(200) not null ,constraint fk_user_wall foreign key(user_id) references tUser(user_id));

--Get all information about the user name including name,email,password,address,phone,their friends,their posts
select u.user_id,u.name,u.email_id,u.password,u.address,u.phone,f.friend_id,w.posting_date,w.post 
from tUser u left join tFriends f on u.user_id=f.user_id left join tWall w on u.user_id=w.user_id 
where u.name='aravind';

--Get all posts written by the user whose name is 'vikram'
select post 
from tWall w inner join tUser u 
on w.user_id=u.user_id 
where u.name='vikram';

--Fetch posts of friend 'vikram' who is connected to user 'aravind'
select post 
from tUser u inner join tFriends f 
on u.user_id=f.user_id inner join tUser fr 
on fr.user_id=f.friend_id inner join tWall w 
on fr.user_id=w.user_id 
where u.name='aravind' and fr.name='vikram';

--Get the friends of 'vikram' who is a friend of 'aravind' and Returns the friend's name and user_id
select f3.name,f3.user_id from tUser u inner join tFriends f 
on u.user_id=f.user_id inner join tUser f1 
on f1.user_id=f.friend_id inner join tFriends f2 
on f2.user_id=f1.user_id inner join tUser f3 
on f3.user_id=f2.friend_id 
where u.name='aravind' and f1.name='vikram';

--Delete the friendship record where 'aravind' is the user and 'vikram' is the friend
delete f 
from tFriends f inner join tUser u 
on f.user_id=u.user_id inner join tUser u1 
on u1.user_id=f.friend_id 
where u.name='aravind' and u1.name='vikram';

--Insert a post for the user name using INSERT ... SELECT
INSERT INTO tWall (user_id, post)
SELECT user_id, 'Hello, this is my first post!' 
FROM tUser 
WHERE name = 'aravind';

