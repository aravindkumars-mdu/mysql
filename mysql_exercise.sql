select u.User_id,u.Name,u.Email_id,u.Password,u.Address,u.Phone,f.friend_id,w.posting_date,w.post 
from tUser u left join tFriends f on u.User_id=f.user_id left join tWall w on u.User_id=w.user_id 
where u.Name='aravind';


select post 
from tWall w inner join tUser u 
on w.user_id=u.User_id 
where u.Name='vikram';


select post 
from tUser u inner join tFriends f 
on u.User_id=f.user_id inner join tUser fr 
on fr.User_id=f.friend_id inner join tWall w 
on fr.User_id=w.user_id 
where u.Name='aravind' and fr.Name='vikram';

select f3.Name,f3.User_id from tUser u inner join tFriends f 
on u.User_id=f.user_id inner join tUser f1 
on f1.User_id=f.friend_id inner join tFriends f2 
on f2.user_id=f1.User_id inner join tUser f3 
on f3.User_id=f2.friend_id 
where u.Name='aravind' and f1.Name='vikram';

delete f 
from tFriends f inner join tUser u 
on f.user_id=u.User_id inner join tUser u1 
on u1.User_id=f.friend_id 
where u.Name='aravind' and u1.Name='vikram';




insert into tWall (user_id,post) values(1,'hello ,this is my first post!');
