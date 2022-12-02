CREATE SCHEMA `ictergurudb-dev` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;


create database IF NOT EXISTS sales_inventory;

create table IF NOT EXISTS  sales_inventory.dateLog(
date_id VARCHAR(6) NOT NULL,
date_log_day VARCHAR(20) NOT NULL,
day_of_week VARCHAR(15) NOT NULL,
date_log_month VARCHAR(15) NOT NULL,
date_log_year VARCHAR(15) NOT NULL,
constraint dateLogPK primary key(date_id)
);



create table IF NOT EXISTS  sales_inventory.productLog(
prod_id VARCHAR(6) NOT NULL,
earn_code VARCHAR(20) NOT NULL,
prod_Name VARCHAR(15) NOT NULL,
prod_category VARCHAR(15) NOT NULL,
constraint productLogPK primary key(prod_id)
);



create table IF NOT EXISTS  sales_inventory.itemLog(
item_id VARCHAR(6) NOT NULL,
item_name VARCHAR(16) NOT NULL,
constraint ItemPK primary key(item_id)
);




create table IF NOT EXISTS  sales_inventory.storeLog(
store_id VARCHAR(6) NOT NULL,
store_Number VARCHAR(10) NOT NULL,
Store_State VARCHAR(15) NOT NULL,
store_country VARCHAR(15) NOT NULL,
constraint storeLogPK primary key(store_id)
);






select * from sales_inventory.salesData ;



create table IF NOT EXISTS  sales_inventory.salesData(
sale_id VARCHAR(6) NOT NULL,
date_id VARCHAR(20) NOT NULL,
store_id VARCHAR(15) NOT NULL,
prod_id VARCHAR(15) NOT NULL,
item_id VARCHAR(6) NOT NULL,
unit_sold VARCHAR(15) NOT NULL,
constraint salesDataFK1 foreign key(date_id) references sales_inventory.dateLog(date_id),
constraint salesDataFK2 foreign key(prod_id) references sales_inventory.productLog(prod_id),
constraint salesDataFK3 foreign key(store_id) references sales_inventory.storeLog(store_id),
constraint salesDataFK4 foreign key(item_id) references sales_inventory.itemLog(item_id)
);


INSERT INTO sales_inventory.salesData 
VALUES ('101', '11', 'ga101', 'pa101', '20');



create database IF NOT EXISTS CustOrderItem;



create table IF NOT EXISTS  CustOrderItem.customer(
cust_id VARCHAR(6) NOT NULL,
cust_fName VARCHAR(20) NOT NULL,
cust_lName VARCHAR(20) NOT NULL,
cust_address VARCHAR(50) NOT NULL,
cust_city VARCHAR(15) NOT NULL,
cust_state VARCHAR(2) NOT NULL,
cust_zip VARCHAR(5) NOT NULL,
constraint CustomerPK primary key(cust_id)
);


Select * from  CustOrderItem.customer;

INSERT INTO CustOrderItem.customer VALUES('000123', 'Alice', 'Smith', '123 Chestain Road', 'Kennesaw', 'GA', '30144');
INSERT INTO CustOrderItem.customer VALUES('003521', 'Bob', 'Anderson', '123 Marietta Drive', 'Kennesaw', 'GA', '30144');
INSERT INTO CustOrderItem.customer VALUES('000235', 'Chelsea', 'Johnson', '123 Roswell Road', 'Marietta', 'GA', '30062');
INSERT INTO CustOrderItem.customer VALUES('000623', 'Daniel', 'Thomas', '123 Marietta Parkway', 'Marietta', 'GA', '30066');



create table IF NOT EXISTS  CustOrderItem.item(
item_id VARCHAR(6) NOT NULL,
item_name VARCHAR(16) NOT NULL,
constraint ItemPK primary key(item_id)
);



select * from CustOrderItem.item;

INSERT IGNORE INTO CustOrderItem.item VALUES('00231','Armchair');
INSERT IGNORE INTO CustOrderItem.item VALUES('00232','Ottoman');
INSERT IGNORE INTO CustOrderItem.item VALUES('00233','Coffee Table');
INSERT IGNORE INTO CustOrderItem.item VALUES('00234','L_Shape Desk');
INSERT IGNORE INTO CustOrderItem.item VALUES('00235','Office Chair');
INSERT IGNORE INTO CustOrderItem.item VALUES('00236','3_Shelf Storage');
INSERT IGNORE INTO CustOrderItem.item VALUES('00237','Floating Shelf');



create table IF NOT EXISTS  CustOrderItem.order(
order_id VARCHAR(6) NOT NULL,
cust_id VARCHAR(6) NOT NULL,
constraint orderPK primary key(order_id),
constraint orderFK foreign key(cust_id) references CustOrderItem.customer(cust_id)
);


select * from CustOrderItem.order;


INSERT INTO CustOrderItem.order VALUES('112354', '000123');
INSERT INTO CustOrderItem.order VALUES('143424', '003521');
INSERT INTO CustOrderItem.order VALUES('153453', '000235');
INSERT INTO CustOrderItem.order VALUES('193512', '000123');
INSERT INTO CustOrderItem.order VALUES('123654', '000623');
INSERT INTO CustOrderItem.order VALUES('132568', '000235');










Select * from CustOrderItem.orderDetails;


create table IF NOT EXISTS  CustOrderItem.orderDetails(
cust_id VARCHAR(6) NOT NULL,
order_id VARCHAR(6) NOT NULL,
item_id VARCHAR(6) NOT NULL,
order_date VARCHAR(15) NOT NULL,
item_price FLOAT(7) NOT NULL,
item_quan INTEGER NOT NULL,
item_orderstatus VARCHAR(8) NOT NULL,
constraint orderDetailsFK1 foreign key(order_id) references CustOrderItem.order(order_id),
constraint orderDetailsFK2 foreign key(item_id) references CustOrderItem.item(item_id)
);











INSERT INTO CustOrderItem.orderDetails VALUES('000123', '112354', '00231','02/02/2020', 100, 1,'Paid');
INSERT INTO CustOrderItem.orderDetails VALUES('000123', '112354', '00232', '02/02/2020', 30, 2,'Paid'); 
INSERT INTO CustOrderItem.orderDetails VALUES('000123', '112354', '00233', '02/02/2020', 120, 1, 'Paid');

INSERT INTO CustOrderItem.orderDetails VALUES('003521', '143424', '00234','02/03/2020', 150, 2,'Paid');
INSERT INTO CustOrderItem.orderDetails VALUES('003521', '143424', '00235','02/03/2020', 120, 2,'Paid');

INSERT INTO CustOrderItem.orderDetails VALUES('000235', '153453', '00231','02/04/2020', 100, 2,'Paid');

INSERT INTO CustOrderItem.orderDetails VALUES('000123', '193512', '00236','02/04/2020', 120, 1,'Paid');
INSERT INTO CustOrderItem.orderDetails VALUES('000123', '193512', '00237','02/04/2020', 50, 3,'Paid');

INSERT INTO CustOrderItem.orderDetails VALUES('000623', '123654', '00234','02/06/2020', 150, 2,'Pending');
INSERT INTO CustOrderItem.orderDetails VALUES('000623', '123654', '00235','02/06/2020', 120, 3,'Pending');

INSERT INTO CustOrderItem.orderDetails VALUES('000235', '132568', '00233','02/06/2020', 120, 1, 'Paid');
INSERT INTO CustOrderItem.orderDetails VALUES('000235', '132568', '00237','02/06/2020', 50, 2, 'Paid');

select * from CustOrderItem.orderDetails;




SELECT  CustOrderItem.customer.cust_id, cust_fName, cust_lName,  COUNT( CustOrderItem.orderDetails.item_id)
FROM  CustOrderItem.customer, CustOrderItem.orderDetails
WHERE CustOrderItem.customer.cust_id = CustOrderItem.orderDetails.cust_id
GROUP BY CustOrderItem.orderDetails.cust_id ;


