CREATE DATABASE Meghu_Seller;
use Meghu_Seller;  

CREATE TABLE contact_detail (
    user_id      VARCHAR(255) NOT NULL PRIMARY KEY,
    street1      VARCHAR(255) NOT NULL,
    city         VARCHAR(50) NOT NULL,
    state        VARCHAR(50) NOT NULL,
    country      VARCHAR(50) NOT NULL,
    zipcode      INT(6) NOT NULL,
    phone        BIGINT(10) NOT NULL 
);

CREATE TABLE p_user (
    email       VARCHAR(200) PRIMARY KEY,
    fname       VARCHAR(255) NOT NULL,
    lname       VARCHAR(255),
    password    VARCHAR(30) NOT NULL,
    user_type   VARCHAR(50) NOT NULL,
    user_id     VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES contact_detail(user_id)
  );


CREATE TABLE card_info (
    card_id       INTEGER PRIMARY KEY,
    card_number   BIGINT(16) NOT NULL,
    expiry_date   DATE NOT NULL,
    cvv           INT(3) NOT NULL,
    user_id      VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES p_user(user_id)
);

CREATE TABLE buyer (
    user_id  VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES p_user(user_id)
);

CREATE TABLE seller (
    seller_id        VARCHAR(255) PRIMARY KEY,
    company_name     VARCHAR(255) NOT NULL,
    url              VARCHAR(255),
    location      VARCHAR(255)
);

CREATE TABLE product (
    product_id         INTEGER PRIMARY KEY,
    brand_name         VARCHAR(255) NOT NULL,
    seller_id          VARCHAR(255) NOT NULL,
    price              INT NOT NULL,
    rating             DECIMAL(2,1),
    discount_percent   INT(2) default 0,
    available_units    INT,
    color              VARCHAR(30),
    weight             INT,
    FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);


CREATE TABLE p_order (
    order_id              INT PRIMARY KEY,
    user_id             VARCHAR(255) NOT NULL,
    card_id               INT NOT NULL,
    total_price           DECIMAL(10, 2),
    order_date            DATE,
    order_status          CHAR(20) NOT NULL,
    quantity              INT NOT NULL,
    FOREIGN KEY (card_id) REFERENCES card_info(card_id),
    FOREIGN KEY (user_id) REFERENCES p_user(user_id)
);

CREATE TABLE order_product (
    order_id     INT,
    product_id   INT,
    PRIMARY KEY ( order_id,
                  product_id ),
    FOREIGN KEY (order_id) REFERENCES p_order(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (1, "Flat No. 505, Sree Sai Residency, Kukatpally", "Hyderabad", "Telangana", "India", "500072", 8901234567);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (9, "House No. 303, 2nd Main Road, Indiranagar", "Bengaluru", "Karnataka", "India", "560038", 9012345678);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (2,  "Flat No. 102, Skyline Apartments, Koramangala", "Bengaluru", "Karnataka", "India", "560034", 9123456789);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (3,  "House No. 6, Park View Lane, HSR Layout", "Bengaluru", "Karnataka", "India", "560102", 9812345678);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (4,  "Flat No. 804, Sobha City, Electronic City", "Bengaluru", "Karnataka", "India", "560100", 7812345679);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (5, "House No. 25, Rose Garden Road, Jayanagar", "Bengaluru", "Karnataka", "India", "560011", 7912345678);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (6 ,"Flat No. 1003, L&T South City, Kanakapura Road", "Bengaluru", "Karnataka", "India", "560062", 7890123456);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (7, "House No. 18, Green Meadows, Whitefield", "Bengaluru", "Karnataka", "India", "560066", 9876543210);
INSERT INTO contact_detail (user_id, street1, city, state, country, zipcode, phone)
VALUES (8, "Flat No. 302, Prestige Sunrise Park, Marathahalli", "Bengaluru", "Karnataka", "India", "560037", 1234567890);


INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("sujalprakash33@gmail.com","sujal","singh","sujal1234","prime",1);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("abc@gamil.com","abc","alphabet","abc1234","non-prime",2);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("dbsc.com","xyz","tth","4454","not prime",9);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("qwe@gmail.com","jkl","opuieyr","iu128736sdn","non-prime",3);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("chit02@gmail.com","Chits","Seee","ASd22","prime",4);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("arunprakash@gmail.com","neymarda","junior","hello12","prime",5);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("dikhprakash33@gmail.com","mbappu","singh","byehello","non-prime",6);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("zameprakash33@gmail.com","Iamma","Good","jeazus","prime",8);
INSERT INTO p_user(email,fname,lname,password,user_type,user_id)
VALUES("messiram@gmail.com","Messi","RamGodsey","GundhiRoxx","Ultra_prime",7);


INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872313, "4985632413274712", "2025-07-15", 369, 1);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872314, "4236518271209841", "2027-03-31", 456, 2);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872315, "4978123958203476", "2028-11-15", 789, 3);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872316, "3948576925473812", "2024-08-30", 246, 4);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872317, "4125687439012746", "2026-01-15", 987, 5);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872318, "4795246834108671", "2025-06-30", 852, 6);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872319, "3984158204735276", "2024-12-31", 741, 7);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872320, "4712583820469327", "2027-04-15", 654, 8);
INSERT INTO card_info (card_id, card_number, expiry_date, cvv, user_id)
VALUES (872321, "4198632570274681", "2028-09-30", 537, 9);



INSERT INTO seller (seller_id, company_name, url, location)
VALUES (102, "Apple India Pvt. Ltd.", "www.appleindia.com", "Delhi");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (103, "Samsung India Electronics Pvt. Ltd.", "www.samsungindia.com", "Mumbai");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (104, "Xiaomi India Pvt. Ltd.", "www.xiaomiindia.com", "Bengaluru");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (105, "Oppo India Pvt. Ltd.", "www.oppoindia.com", "Hyderabad");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (106, "Vivo India Pvt. Ltd.", "www.vivoindia.com", "Kolkata");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (107, "Realme India Pvt. Ltd.", "www.realmeindia.com", "Chennai");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (108, "Motorola Mobility India Pvt. Ltd.", "www.motorolaindia.com", "Delhi");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (109, "Google India Pvt. Ltd.", "www.googleindia.com", "Mumbai");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (110, "Asus India Pvt. Ltd.", "www.asusindia.com", "Bengaluru");

INSERT INTO seller (seller_id, company_name, url, location)
VALUES (111, "Huawei India Pvt. Ltd.", "www.huaweiindia.com", "Hyderabad");



INSERT INTO product (product_id,brand_name,seller_id,price,rating,discount_percent,available_units,color,weight)
VALUES (14192, "OnePlus",101,34000,4.3,13,400,"Black",700);
INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14193, "Apple iPhone 12", 102, 69999, 4.7, 7, 200, "White", 500);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14194, "Samsung Galaxy S21", 103, 59999, 4.6, 10, 300, "Gray", 700);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14195, "Xiaomi Redmi Note 10S", 104, 9999, 4.4, 15, 500, "Green", 450);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14196, "Oppo A53", 105, 12999, 4.5, 10, 400, "Blue", 500);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14197, "Vivo Y51", 106, 14999, 4.2, 5, 300, "Purple", 600);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14198, "Realme Narzo 30 Pro", 107, 14999, 4.6, 15, 500, "Black", 700);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14199, "Motorola Moto G9 Power", 108, 9999, 4.4, 10, 400, "White", 450);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14200, "Google Pixel 4a", 109, 21999, 4.8, 5, 300, "Gray", 600);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14201, "Asus Zenfone 7", 110, 34999, 4.5, 15, 500, "Blue", 700);

INSERT INTO product (product_id, brand_name, seller_id, price, rating, discount_percent, available_units, color, weight)
VALUES (14202, "Huawei P40 Pro", 111, 54999, 4.7, 10, 400, "Purple", 600);


INSERT INTO p_order(order_id,user_id,card_id,total_price,order_date,order_status,quantity) 
values(101,1,872313,599990,"2003-11-23","in Transit",10);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (102, 2, 872314, 89999, "2021-05-01", "Delivered", 5);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (103, 3, 872315, 69999, "2021-12-08", "In Process", 7);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (104, 4, 872316, 49999, "2021-01-11", "Cancelled", 2);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (105, 5, 872317, 639992, "2021-03-30", "Delivered", 8);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (106, 6, 872318, 999990, "2019-06-15", "In Process", 10);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (107, 7, 872319, 299995, "2019-09-23", "Cancelled", 5);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (108, 8, 872320, 479994, "2020-07-19", "Delivered", 6);

INSERT INTO p_order (order_id, user_id, card_id, total_price, order_date, order_status, quantity)
VALUES (109, 9, 872321, 559992, "2020-02-21", "In Process", 8);



INSERT INTO buyer values(1);
INSERT INTO buyer values(2);
INSERT INTO buyer values(3);
INSERT INTO buyer values(4);
INSERT INTO buyer values(5);
INSERT INTO buyer values(6);
INSERT INTO buyer values(7);
INSERT INTO buyer values(8);
INSERT INTO buyer values(9);


 
INSERT INTO order_product (order_id,product_id)
VALUES(101,14192);
INSERT INTO order_product (order_id, product_id)
VALUES (102, 14193);

INSERT INTO order_product (order_id, product_id)
VALUES (103, 14194);

INSERT INTO order_product (order_id, product_id)
VALUES (104, 14195);

INSERT INTO order_product (order_id, product_id)
VALUES (105, 14196);

INSERT INTO order_product (order_id, product_id)
VALUES (106, 14197);

INSERT INTO order_product (order_id, product_id)
VALUES (107, 14198);

INSERT INTO order_product (order_id, product_id)
VALUES (108, 14199);

INSERT INTO order_product (order_id, product_id)
VALUES (109, 14200);



