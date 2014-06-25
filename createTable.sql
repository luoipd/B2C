create database b2c;
use b2c;
create table NBAdmin(username varchar(20) primary key ,password varchar(100)) DEFAULT CHARSET=utf8;
create table NBCategory (id int primary key auto_increment ,name varchar(50),fatherID int,description varchar(500),imagePath varchar(100))DEFAULT CHARSET=utf8;
create table NBUser(id int primary key auto_increment,email varchar(200) unique ,nickname varchar(200),password varchar(200),score int ,registerDate Date)DEFAULT CHARSET=utf8;
create table NBOrder(orderID int primary key auto_increment ,userID int ,orderDate date ,state int , scoreGet int,userAddressID int,foreign key (userID) REFERENCES NBUser (id))DEFAULT CHARSET=utf8;
create table NBOrderInfo(orderID int ,productID int ,number int ,foreign key (orderID) REFERENCES NBOrder (orderID))DEFAULT CHARSET=utf8;
create table NBProduct(id int primary key auto_increment,categoryID int ,name varchar(200),description varchar(2000),imagePath varchar(200),price float,discount float,numberLeft int ,foreign key(categoryID)REFERENCES NBCategory(id) )DEFAULT CHARSET=utf8;
create table NBProductComment(userID int ,productID int ,level int ,title varchar(200),content varchar(200),foreign key (userID) REFERENCES NBUser (id),foreign key (productID) REFERENCES NBProduct (id))DEFAULT CHARSET=utf8;
create table NBUserAddress(userAddressID int primary key auto_increment,userID int ,receiverName varchar(200),address varchar(200),postCode varchar(200),telephone varchar(20),mobilephone varchar(20),isActive int,foreign key (userID) REFERENCES NBUser (id) )DEFAULT CHARSET=utf8;
create table NBVIPCategory(ID int ,levelName varchar(200),leastScore int ,scorePercentage float)DEFAULT CHARSET=utf8;


