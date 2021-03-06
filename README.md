<h1 style="color:blue"> Use Case 1 Customer Loyalty Program</h1>

<h4>Introduction:</h4> 
<p>Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a 
risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry 
and ramen. 
Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant 
has captured some very basic data from their few months of operation but have no idea how 
to use their data to help them run the business. </p>

<h4>Problem Statement: </h4>
<p>Danny wants to use the data to answer a few simple questions about his customers, especially 
about their visiting patterns, how much money they’ve spent and also which menu items are 
their favourite. Having this deeper connection with his customers will help him deliver a better 
and more personalised experience for his loyal customers. 
He plans on using these insights to help him decide whether he should expand the existing 
customer loyalty program - additionally he needs help to generate some basic datasets so his 
team can easily inspect the data without needing to use SQL. 
Danny has provided you with a sample of his overall customer data due to privacy issues - but 
he hopes that these examples are enough for you to write fully functioning SQL queries to help 
him answer his questions! </p>
Danny has shared with you 3 key datasets for this case study: 
<ul>
<li><b>sales</b> </li>
<li><b>menu</b> </li>
<li><b>members</b> </li>
</ul>

<h4>Tables Desciption -</h4>
<p><b>Table 1: sales </b>
- The sales table captures all customer_id level purchases with a corresponding order date 
and product_id information for when and what menu items were ordered.</p>

<table>
  <tr>
  <th>customer_id</th>
  <th>order_date<t/h>
  <th>product_id<t/th>
  </tr>
  <tr>
  <td>A</td><td>01/01/2021</td><td>1</td></tr>
  <td>A</td><td>01/01/2021</td><td>2</td></tr>
  <td>A</td><td>07/01/2021</td><td>2</td></tr>
  <td>A</td><td>10/01/2021</td><td>3</td></tr>
  <td>A</td><td>11/01/2021</td><td>3</td></tr>
  <td>A</td><td>11/01/2021</td><td>3</td></tr>
  <td>B</td><td>01/01/2021</td><td>2</td></tr>
  <td>B</td><td>02/01/2021</td><td>2</td></tr>
  <td>B</td><td>04/01/2021</td><td>1</td></tr>
  <td>B</td><td>11/01/2021</td><td>1</td></tr>
  <td>B</td><td>16/01/2021</td><td>3</td></tr>
  <td>B</td><td>01/02/2021</td><td>3</td></tr>
  <td>C</td><td>01/01/2021</td><td>3</td></tr>
  <td>C</td><td>01/01/2021</td><td>3</td></tr>
  <td>C</td><td>07/01/2021</td><td>3</td></tr>
  
</table>

<p><b>Table 2: menu </b>
- The menu table maps the product_id to the actual product_name and price of each menu 
item. </b>
<table>
  <tr>
  <th>product_id</th>
  <th>product_name<t/h>
  <th>price<t/th>
  </tr>
  <tr>
  <td>1</td><td>sushi</td><td>10</td></tr>
  <td>2</td><td>curry</td><td>15</td></tr>
  <td>3</td><td>ramen</td><td>12</td></tr>
</table>

<p>
<b>Table 3: members </b>
- The final members table captures the join_date when a customer_id joined the beta version of
the Danny’s Diner loyalty program. </p>
<table>
  <tr>
  <th>customer_id</th>
  <th>join_date<t/h>

  </tr>
  <tr>
  <td>A</td><td>07/01/2021</td></tr>
  <td>B</td><td>09/01/2021</td></tr>
  <td>C</td><td>12/01/2021</td></tr>
</table>

<h4 ><center>Case Study Questions: </center></h4>

<ol>
<li> What is the total amount each customer spent at the restaurant? </li>
<li> How many days has each customer visited the restaurant?  </li>
<li> What was the first item from the menu purchased by each customer?  </li>
<li> What is the most purchased item on the menu and how many times was it purchased by all customers?  </li>
<li> Which item was the most popular for each customer?  </li>
<li> Which item was purchased first by the customer after they became a member?  </li>
<li> Which item was purchased just before the customer became a member?  </li>
<li> What is the total items and amount spent for each member before they became a member?  </li>
<li> If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?  </li>
<li> In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?  </li>
</ol>
