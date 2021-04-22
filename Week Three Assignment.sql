CREATE SCHEMA FakeBook;
USE FakeBook;
CREATE TABLE USER (
user_ID Int NOT NULL AUTO_INCREMENT,
firstName VARCHAR(50) NULL,
lastName VARCHAR(50) NULL,
userName VARCHAR(50)NOT NULL,
email VARCHAR(128) NOT NULL,
password VARCHAR(12) NOT NULL,
createDtTm DATETIME NOT NULL,
PRIMARY KEY(user_ID)
);
CREATE TABLE POST (
post_ID int NOT NULL AUTO_INCREMENT,
user_ID int NOT NULL,
title Varchar(100) NOT NULL,
body text NOT NULL,
createDtTm DATETIME NOT NULL,
Primary key (post_ID),
Constraint FK_post_user
Foreign Key(user_ID)
References User(user_ID)
);
Create table COMMENT (
comment_ID int NOT NULL AUTO_INCREMENT,
post_ID int NOT NULL,
User_ID int NOT NULL,
Body Text NOT NULL,
CreateDtTm DATETIME NOT NULL,
Primary key (Comment_ID),
Constraint FK_comment_post 
Foreign key (Post_ID)
References POST(post_ID),
Constraint FK_comment_user
Foreign key (user_ID)
References USER(user_ID)
); 
INSERT into USER(firstName, lastName, userName, email, password, createDtTm)
VALUES ('Elizabeth', 'Rossi', 'LizRossi', 'elizabethbrossi@yahoo.com', 'password', now());

INSERT into POST(user_ID, title, body, createDtTm)
VALUES('1', 'Hello', 'Hello, local database, it is lovely to meet you!', now());

INSERT into COMMENT(post_ID, user_ID, BODY, createDtTm)
VALUES ('1', '1', 'I feel I should add that this is the realm of my existence, impossible as it is.', now());
SELECT*FROM USER u JOIN POST p on u.user_ID = p.user_ID;
SELECT*FROM USER u JOIN COMMENT c on u.user_ID = c.user_ID; 
SELECT*FROM USER u JOIN POST p on u.user_ID = p.user_ID JOIN COMMENT c on p.post_ID = c.post_ID;
