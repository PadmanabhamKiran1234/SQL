Create database InventoryManagement_Db;
use InventoryManagement_Db;
Create Table Users
(
UserID int primary key identity(1,1),
UserName varchar(50),
Password varchar(25),
FullName varchar(255),
IsActive BIT,
Category varchar(50)
);
 

Create Table ProductMaster
(
Productid int primary key identity(1,1),
 ProductName varchar(50),
 AvailableQty bigint
 );

Create Table [Transaction]
(
TransactionID int primary key identity(1,1),
TransactionDate Date,
ProductID int,
constraint FK_productionID
FOREIGN KEY(ProductID) References ProductMaster(Productid),
TransactionType varchar(5),
Qty int,
UpdatedBy int
);

--Make the updatedBy column in [Transaction] as a foreign key relating with the Userid of  Users table
alter table [Transaction] add foreign key(updatedBy) references Users(userid);

--Make the productID column as Not Null column in [Transaction].
alter table [Transaction] alter column productId int not null;

--Make the updatedBy,TransactionType column of [Transaction] as Not Null.
Alter table [Transaction] alter column updatedBy int Not Null;
Alter table [Transaction] alter column TransactionType varchar(5) Not Null;


--Make the ProductName, AvailableQty columns ProductMaster as Not Null.
Alter table ProductMaster alter column ProductName varchar(50) Not Null;
Alter table ProductMaster alter column AvailableQty bigint Not Null;


--Droping a foreign key
Alter table [Transaction] drop FK__Transacti__Updat__33D4B598;

Create table Dummy(id int);

Drop table Dummy;

--DML INSERT , UPDATE,DELETE

--Data Manipulation Language
--INSERT -Add new Row
--UPDATE --Modify the available data
--Delete --Delete the row(s) from the table

INSERT into ProductMaster values('TubeLight',500);
INSERT into ProductMaster values('Switch',1000),('Screws',2000),('Nails',500);

Insert into Users(UserName,Password,FullName,IsActive) values
('Mathew','Mathew@111','John Mathew',1);

Insert into Users(UserName,Password,FullName,IsActive) values
('Dhivya','Dhivya@111','Dhivya Rajendran',1);

Insert into Users(UserName,Password,FullName,IsActive) values
('Kiran','Kiran@2132','Kiran padmanabham',1);

SELECT * from ProductMaster;

SELECT * from Users;

--Update

Update Users set Category='Admin';
Update Users set Category='Staff' where UserID in (2,6);



--Delete 
Delete from Users where UserID>2;

Delete from ProductMaster where Productid=6;

Insert into [Transaction] ( TransactionDate,ProductID,TransactionType,Qty,UpdatedBy) values
('2022-09-11',3,'IN',12,1),('2022-10-11',4,'IN',10,2),('2023-01-11',5,'OUT',4,3);

SELECT * from ProductMaster;

SELECT * from Users;

SELECT * from [Transaction];
Truncate table [Transaction];
Delete from [Transaction] where TransactionID in (2,4,5);


Truncate table Users;
Truncate table [Transaction];


Select UserName,FUllName,Category from Users;

--Filter the data where clause

Select * from ProductMaster where AvailableQty>500;

Select * from ProductMaster where AvailableQty=500;

Select ProductName from ProductMaster where AvailableQty<2000;

--between >= and <=

Select * from ProductMaster where AvailableQty between 1000 and 2000;

Select * from ProductMaster where AvailableQty  not between 1000 and 2000;


--Select All the Users FullName and Category
Select FullName ,Category from Users;


--Select ProductName  where the AvailableQty is less than 500
Select ProductName from ProductMaster where AvailableQty<500;


--Select Transactions details which is done by the User Mathew
Select * from [Transaction] where UpdatedBy IN
(Select UserID from Users where UserName='Mathew');

--Select the transactionDate and TransactionType from the transaction table
Select  TransactionDate,TransactionType from [Transaction];


--Fetch only the Inward Transaction details
Select * from [Transaction] where TransactionType='IN';


--Fetch the prodcut details of Nails;
Select * from ProductMaster where ProductName='Nails';


INSERT into ProductMaster values('Nails',500);

Alter table [Transaction] drop FK_productionID;


