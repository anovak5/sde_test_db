select b.book_ref, count(1)
from bookings b
inner join tickets t on t.book_ref =b.book_ref 
where b.book_ref = '00000F'
group by b.book_ref 
order by 2 desc

2.	Вывести количество бронирований с количеством людей больше среднего значения людей на одно бронирование
select count(1) 
from ( 
select t.book_ref, count(1) cnt
from tickets t
group by t.book_ref
having count(1) >
(select avg(cnt) + 1
from
(
select t.book_ref, count(1) cnt
from tickets t
group by t.book_ref
--order by 2 desc
) t
)
) t

3.	Вывести количество бронирований, у которых состав пассажиров повторялся два и более раза, 
среди бронирований с максимальным количество людей (п.1)?

select t2.passenger_name, count(1), count(distinct t2.book_ref)
from tickets t2 
where t2.book_ref in 
(
select t.book_ref --, count(1) cnt
from tickets t
group by t.book_ref
having count(1) = 5
)
group by t2.passenger_name
having count(1)>=2
