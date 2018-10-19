CREATE table users
(
user_id int PRIMARY KEY,
user_name varchar(50) NOT NULL,
user_email varchar(50) UNIQUE NOT NULL,
user_password varchar(50),
user_type int,
CONSTRAINT password_chk CHECK (LENGTH(user_password)>7),
CONSTRAINT username_chk CHECK (user_name ~ '^[a-zA-Z]*$'),
FOREIGN KEY (user_type) REFERENCES user_type(user_type_id)
);

CREATE TABLE user_type(user_type_id int PRIMARY KEY, user_type_name varchar(50) NOT NULL UNIQUE);

CONSTRAINT password_chk CHECK (LENGTH(user_password)>7),
CONSTRAINT username_chk CHECK (user_name ~ '^[a-zA-Z]*$'));


