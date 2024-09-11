-- 1
select u.user_id, fullname, email, ul.like_count from users as u
INNER JOIN  
(SELECT user_id,count(user_id) as like_count from like_res GROUP by user_id ORDER by count(user_id) DESC limit 5) as ul on u.user_id = ul.user_id

-- 2
select * from restarant as t1
left join
(SELECT res_id as _res, SUM(amount) as sum_amount from rate_res group by res_id ORDER by sum_amount DESC limit 2) as t2 on t1.res_id=t2._res
where t2._res is NOT NULL

-- 3
select u1.user_id, u1.email, u1.email, u2.total from users as u1
inner join (
SELECT user_id, sum(amount) as total from orders group by user_id limit 1
) as u2
on u1.user_id = u2.user_id

-- 4
SELECT B.* from users as B 
LEFT join (select distinct u.user_id, _like.res_id as _like_res, _rate.rate_res_id as _rate_res from users as u
INNER JOIN like_res as _like ON u.user_id = _like.user_id 
inner join rate_res as _rate on u.user_id = _rate.user_id) as A on A.user_id = B.user_id
WHERE A._like_res is NULL OR A._rate_res is NULL