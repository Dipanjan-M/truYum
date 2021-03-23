CREATE DATABASE `truyum`;

CREATE TABLE `menu_item` (
    menu_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    price float(11,2) NOT NULL,
    status enum('Yes','No') NOT NULL,
    date_of_launch date NOT NULL DEFAULT CURRENT_DATE,
    category varchar(50) NOT NULL,
    free_delivery enum('Yes','No') NOT NULL
);

CREATE TABLE `admins` (
    admin_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    admin_user_name varchar(80) NOT NULL,
    admin_email varchar(80) NOT NULL UNIQUE,
    admin_password varchar(1000) NOT NULL
);

CREATE TABLE `users` (
    user_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name varchar(80) NOT NULL,
    user_email varchar(80) NOT NULL UNIQUE,
    user_password varchar(1000) NOT NULL,
    createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `cart` (
    cart_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,
    menu_id int NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (menu_id) REFERENCES menu_item(menu_id)
);