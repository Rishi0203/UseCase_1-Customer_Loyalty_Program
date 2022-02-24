


CREATE TABLE menu
(
product_id int PRIMARY KEY,
product_name varchar(5),
price int
);

CREATE TABLE members
(
customer_id varchar(1) PRIMARY KEY,
join_date timestamp
);

CREATE TABLE sales
(
customer_id varchar(1) REFERENCES members(customer_id),
order_date date,
product_id int REFERENCES menu(product_id)
);


insert into menu values (1,'sushi',10);
insert into menu values (2,'curry',15);
insert into menu values (3,'ramen',12);

insert into members values ('A','07/01/2021');
insert into members values ('B','09/01/2021');
insert into members values ('C','12/01/2021');


insert into sales values ('A','01/01/2021',1);
insert into sales values ('A','01/01/2021',2);
insert into sales values ('A','07/01/2021',2);
insert into sales values ('A','10/01/2021',3);
insert into sales values ('A','11/01/2021',3);
insert into sales values ('A','11/01/2021',3);
insert into sales values ('B','01/01/2021',2);
insert into sales values ('B','02/01/2021',2);
insert into sales values ('B','04/01/2021',1);
insert into sales values ('B','11/01/2021',1);
insert into sales values ('B','16/01/2021',3);
insert into sales values ('B','01/02/2021',3);
insert into sales values ('C','01/01/2021',3);
insert into sales values ('C','01/01/2021',3);
insert into sales values ('C','07/01/2021',3);

--truncate table sales
SELECT * FROM sales
SELECT * FROM Members
SELECT * FROM menu

--Answer 1
select me.customer_id,sum(m1.Price) TotalAmt from Members me join sales s  
                                  on me.customer_id = s.customer_id 
                                  join menu m1 on s.product_id = m1.product_id 
                                  group by me.customer_id
--Answer 2
select me.customer_id, count(1) TotalAmt from Members me right join  sales s  
                                  on me.customer_id = s.customer_id                                  
                                  group by me.customer_id
                                  
--Answer 3           
SELECT customer_id,Product_Name FROM (
SELECT M.customer_id,Order_Date,Product_Name, ROW_NUMBER() over(PARTITION BY Order_Date,M.customer_id order by Order_Date) rnk, 
DENSE_RANK() over(order by Order_Date) d_rnk
FROM Members M JOIN Sales S ON M.customer_id = S.customer_id JOIN Menu ME ON ME.Product_ID = S.Product_ID ) WHERE rnk=1  AND d_rnk =1

SELECT customer_id,Product_Name FROM (
SELECT tbl.*,DENSE_RANK() over(order by Order_Date) d_rnk FROM (
SELECT M.customer_id,Order_Date,Product_Name, ROW_NUMBER() over(PARTITION BY Order_Date,M.customer_id order by Order_Date) rnk 
FROM Members M JOIN Sales S ON M.customer_id = S.customer_id JOIN Menu ME ON ME.Product_ID = S.Product_ID ) tbl WHERE rnk=1 )  where d_rnk =1

                                 
/*select distinct t.customer_id, m.product_name from 
(select s.*, Dense_rank() over(order by s.Order_date) as k from   sales s) t  ,menu m
where t.product_id=m.product_id and k=1 order by t.customer_id */
          
--Answer 4                                                                 
SELECT tbl.* FROM (
SELECT M.customer_id,Product_Name, count(Product_Name) OVER(PARTITION BY Product_Name,M.customer_id ORDER BY Product_Name) AS cnt
FROM Members M JOIN Sales S ON M.customer_id = S.customer_id JOIN Menu ME ON ME.Product_ID = S.Product_ID ) tbl group by customer_id,Product_Name,cnt 
order by customer_id,cnt desc,Product_Name


/*select customer_id,product_id,cnt from (
select t1.*, rank() over(partition by customer_id order by customer_id,CNT desc )  rnk from (
select me.customer_id,m1.product_id,count(1) cnt from Members me join sales s  
                                  on me.customer_id = s.customer_id 
                                  join menu m1 on s.product_id = m1.product_id
                                  group by me.customer_id,m1.product_id ) t1
                                  ) where rnk=1*/
                                  
--Answer 5                         
SELECT Customer_id,Product_Name,Cnt FROM (
SELECT customer_id,Product_Name,Cnt,Row_number() OVER(PARTITION BY customer_id ORDER BY customer_id,cnt desc,Product_Name) rnk1 FROM (
SELECT customer_id,Product_Name,Cnt,Cnt as Cnt1,Row_number() OVER(PARTITION BY CNT,Product_Name,customer_id ORDER BY Product_Name) rnk FROM (
SELECT M.customer_id,Product_Name, count(Product_Name) OVER(PARTITION BY Product_Name,M.customer_id ORDER BY Product_Name) AS cnt
FROM Members M JOIN Sales S ON M.customer_id = S.customer_id JOIN Menu ME ON ME.Product_ID = S.Product_ID ) tbl
order by customer_id,cnt desc,Product_Name) where rnk = 1 order by customer_id,cnt desc,Product_Name ) WHERE  rnk1 =1

/*select customer_id,CNT,product_id from (
select t.*, rank() over(partition by customer_id order by customer_id,CNT desc ) as rnk from (
select me.customer_id,m1.product_id,count(1) cnt from Members me join sales s  
                                  on me.customer_id = s.customer_id 
                                  join menu m1 on s.product_id = m1.product_id
                                  group by me.customer_id,m1.product_id
                                  order by customer_id,CNT desc ) t                                 
                                  )
                                  where rnk=1*/
                                  
                                  
                                  
--Answer 6                
SELECT customer_id,Product_Name,Order_date FROM (
SELECT me.customer_id,Product_Name,Join_date,Order_date
,ROW_NUMBER() OVER (PARTITION BY me.customer_id,Join_date ORDER BY Join_date) rnk 
                                  FROM Members me 
                                  JOIN sales s ON me.customer_id = s.customer_id 
                                  JOIN menu m1 ON s.product_id = m1.product_id 
                                  WHERE me.join_date < TO_CHAR(s.Order_date, 'DD-MM-YYYY') 
                                  ) WHERE rnk=1
                                  
/*select customer_id,product_name,Order_date from (
select distinct t.customer_id, m.product_name,Order_date,rownum rn from 
(select s.*, Dense_rank() over(order by s.Order_date) as k from   sales s) t  ,menu m
where t.product_id=m.product_id and k=1 order by t.customer_id ,Order_date,product_name
)
where rn in (1,2,5)*/

--Answer 7  here A  has both sushi and curry             
SELECT customer_id,Product_Name,Order_date FROM (
SELECT me.customer_id,Product_Name,TO_CHAR(Join_date, 'DD-MM-YYYY') Join_date ,Order_date
,ROW_NUMBER() OVER (PARTITION BY Join_date,me.customer_id ORDER BY Order_date desc) rnk 
                                  FROM Members me 
                                  JOIN sales s ON me.customer_id = s.customer_id 
                                  JOIN menu m1 ON s.product_id = m1.product_id 
                                  WHERE me.join_date > TO_CHAR(s.Order_date, 'DD-MM-YYYY') 
                                  ) WHERE rnk=1


-- Answer 8

SELECT me.customer_id,Product_Name,SUM(Price)
                                  FROM Members me 
                                  JOIN sales s ON me.customer_id = s.customer_id 
                                  AND  me.join_date > TO_CHAR(s.Order_date, 'DD-MM-YYYY') 
                                  JOIN menu m1 ON s.product_id = m1.product_id                                   
                                  GROUP BY  me.customer_id,Product_Name
                                  ORDER BY me.customer_id,Product_Name
                                  



/*select me.customer_id,sum(m1.Price) TotalAmt from Members me join sales s  
                                  on me.customer_id = s.customer_id 
                                  join menu m1 on s.product_id = m1.product_id
                                  where me.join_date > TO_CHAR(s.Order_date, 'DD-MM-YYYY') 
                                  group by me.customer_id*/

--Answer 9
SELECT customer_id, SUM(TotalAmt) 
FROM (
SELECT me.customer_id,m1.Product_Name, SUM(CASE WHEN Product_Name='suchi' THEN m1.Price*20 ELSE m1.Price*10  END) TotalAmt from Members me 
                                  JOIN sales s ON me.customer_id = s.customer_id 
                                  JOIN menu m1 ON s.product_id = m1.product_id                                   
                                  GROUP BY me.customer_id,m1.Product_Name  ORDER BY customer_id,Product_Name )                                  
                                  GROUP BY customer_id ORDER BY customer_id
                                  
                                  
--Answer 10
SELECT customer_id,SUM((CASE WHEN Product_Name='sushi' THEN Price ELSE Price*20 END )) Points FROM (
SELECT me.customer_id,m1.Product_Name, m1.Price,Order_date,join_date
                                  FROM Members me 
                                  JOIN sales s ON me.customer_id = s.customer_id 
                                  AND  me.join_date < TO_CHAR(s.Order_date, 'DD-MM-YYYY')  
                                  AND Order_date BETWEEN join_date AND join_date+7
                                  JOIN menu m1 ON s.product_id = m1.product_id                                   
                                  ORDER BY customer_id,Product_Name)
                                  GROUP BY customer_id
                                  
