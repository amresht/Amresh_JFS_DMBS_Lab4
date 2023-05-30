--4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

select cus_gender, count(cus_name)  
from `customer` 
where cus_name in (
	SELECT  cus_name FROM `customer` LEFT JOIN ecommerce.`order` USING ( cus_id ) 
	where ord_amount > 3000)
group by cus_gender;

--5) Display all the orders along with product name ordered by a customer having Customer_Id=2
select ord_id as orders, pro_name as product 
from `customer` join `order` using (cus_id)
join `supplier_pricing` using(pricing_id) join product using(pro_id)
where cus_id=2;


--6) Display the Supplier details who can supply more than one product.
SELECT s.*, count(pro_id) FROM ecommerce.supplier_pricing sp join ecommerce.supplier s using (supp_id)
group by sp.supp_id;

---ALTERNATE METHOD


select s.*, count(distinct pr.pro_id) as products from
supplier s join supplier_pricing sp using(supp_id) 
join product pr using(pro_id) 
group by s.SUPP_ID having count(distinct pr.PRO_ID)>1;



--7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product

select c.cat_id as category_id, c.cat_name as category, p.pro_name as product,
sp.supp_price as price from category c
join product p using(cat_id)
join supplier_pricing sp using(pro_id)
join (
    select c.cat_id, min(sp.supp_price) as min_price
    from category c join product p using(cat_id)
	join supplier_pricing sp using(pro_id)
    group by c.cat_id
  ) subq on c.cat_id = subq.cat_id and sp.supp_price = subq.min_price
order by
  c.cat_id;


--8) Display the Id and Name of the Product ordered after “2021-10-05”.
select pro_id as ID, pro_name as product from product 
join supplier_pricing using(pro_id) 
join `order` using(pricing_id) where ord_date>'2021-10-05'; 


--9) Display customer name and gender whose names start or end with character 'A'.
select cus_name,cus_gender from customer 
where 
cus_name like 'A%' or cus_name like '%A';



--10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
--    Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
--    Service” else print “Poor Service”. Note that there should be one rating per supplier.

DELIMITER //
create procedure SupplierRatings()
begin
	select s.supp_id, s.supp_name, avg(r.rat_ratstars) as AVERAGE_RATING,
		case 
			when avg(r.rat_ratstars) = 5 then 'Excellent Service'
			when avg(r.rat_ratstars) > 4 then 'Good Service'
			when avg(r.rat_ratstars) > 2 then 'Average Service'
			else 'Poor Service'
		end as Type_of_Service
	from supplier as s
    join supplier_pricing using(supp_id)
    join `order` using(pricing_id)
    join rating as r using(ord_id)
    group by s.supp_id, s.supp_name order by s.supp_id;
end //
DELIMITER ;

call SupplierRatings();