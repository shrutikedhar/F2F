-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database f2f_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on f2f_db.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use f2f_db;

-- Put your DDL 
CREATE TABLE customer (
    customerID VARCHAR(10) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(30),
    shipID VARCHAR(30),
    budgetID VARCHAR(10),
    storeID VARCHAR(10),
    priorityID VARCHAR(10)
);

INSERT INTO customer
(customerID, first_name, last_name, age, gender, email, shipID, budgetID, storeID, priorityID)
VALUES
('11234', 'Shruti', 'Kedharnath', 19, 'Female', 'shkedharnath@gmail.com', '345645', '2', '43456', '23453'),
('53526', 'Kirtana', 'Krishnan', 19, 'Female', 'kirtana.krishnan8@gmail.com', '26475', '3', '72829', '62711'),
('28902', 'Mary', 'Allen', 19, '20', 'mary8@gmail.com', '39023', '3', '34871', '12032'), 
('39021', 'John', 'Brown', 20, 'Male', 'john@gmail.com', '38902', '1', '20192', '12903'), 
('12094', 'Chris', 'Jay', 30, 'Male', 'chris@gmail.com', '20943', '2', '20193', '39402'), 
('29012', 'Bob', 'Dad', 50, 'Male', 'bob@gmail.com', '39054', '3', '49054', '89201'), 
('12904', 'Drake', 'Taylor', 25, 'Male', 'drake@gmail.com', '29404', '2', '59043', '28945'), 
('89493', 'Taylor', 'Swift', 33, 'Female', 'taylor@gmail.com', '48594', '3', '58932', '29043'), 
('28493', 'Harry', 'Styles', 28, 'Male', 'harry@gmail.com', '48575', '3', '48593', '78910'), 
('48990', 'Meha', 'Macwan', 19, 'Female', 'meha@gmail.com', '39040', '1', '38593', '48902'), 
('39400', 'Gary', 'Leo', 30, 'Male', 'gary@gmail.com', '38490', '2', '74022', '47489'), 
('19203', 'Rose', 'Potty', 66, 'Female', 'rose@gmail.com', '48590', '2', '10994', '09382'), 
('39040', 'Bea', 'Miller', 22, 'Female', 'bea@gmail.com', '49500', '2', '10923', '58930'), 
('29019', 'Matty', 'Smith', 30, 'Male', 'matty@gmail.com', '48993', '3', '10923', '38954'), 
('48599', 'Bary', 'Allen', 30, 'Male', 'barry@gmail.com', '38490', '1', '38490', '19200'), 
('29011', 'Patty', 'Smith', 38, 'Female', 'patth@gmail.com', '39012', '2', '39002', '47891'), 
('39001', 'Tree', 'Cone', 11, 'Female', 'tree@gmail.com', '29011', '1', '38940', '29012'), 
('09821', 'Lacy', 'Smith', 54, 'Female', 'lacy@gmail.com', '39033', '2', '29012', '39040'), 
('39092', 'Tracy', 'Gray', 30, 'Female', 'tracy@gmail.com', '38920', '2', '38904', '67830'), 
('89322', 'Garret', 'Prince', 43, 'Male', 'garret@gmail.com', '29010', '2', '38493', '98942'),
('12092', 'Bhris', 'Gay', 35, 'Male', 'bhris@gmail.com', '20192', '2', '48933', '29028');


CREATE TABLE budget (
    budgetID VARCHAR(10) primary key,
    highest INT,
    lowest INT,
    currency VARCHAR(20)
);

INSERT INTO budget
(budgetID, highest, lowest, currency)
VALUES
('3', 150, 10, 'US Dollars'),
('2', 75, 5, 'US Dollars'), 
('2', 79, 1, 'Euros'),
('1', 20, 1, 'Pesos'),
('2', 80, 5, 'US Dollars'),
('3', 750, 50, 'Canadian Dollars'),
('3', 700, 15, 'US Dollars'),
('1', 5, 1, 'Yen'),
('2', 70, 2, 'Won'),
('3', 1000, 50, 'Rupees'),
('2', 75, 50, 'US Dollars'),
('1', 10, 5, 'Euros'),
('2', 68, 5, 'Euros'),
('3', 7500, 50, 'Pesos'),
('2', 100, 5, 'US Dollars'),
('3', 400, 20, 'Yen'),
('1', 300, 5, 'Won'),
('1', 50, 5, 'Rupees'),
('3', 300, 2, 'US Dollars'),
('1', 1000, 10, 'Pesos'),
('3', 200, 50, 'Euros'),
('2', 77, 5, 'Yen'),
('1', 20, 5, 'US Dollars'),
('1', 30, 1, 'Canadian Dollars');


CREATE TABLE ship_info (
    shipID VARCHAR(20) primary key,
    street_name VARCHAR(20),
    town VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    zipcode VARCHAR(15),
    invoiceID VARCHAR (10)
);

INSERT INTO ship_info
(street_name, town, state, country, zipcode, invoiceID)
VALUES
('40A Leon St', 'Boston', 'MA', 'USA', '02115', '64758'),
('250 Parker St', 'Boston', 'MA', 'USA', '02115', '63743'), 
('40A Bob St', 'Boston', 'MA', 'USA', '02111', '39022'),
('40 Mary St', 'Cambridge', 'MA', 'USA', '08911', '90211'),
('40A Leon Avenue', 'North Brunswick', 'NJ', 'USA', '08902', '29033'),
('38 Palmetto Way', 'North Brunswick', 'NJ', 'USA', '08902', '28932'),
('14 Forsyth St', 'Boston', 'MA', 'USA', '02115', '30293'),
('1 Baker Court', 'Princeton', 'NJ', 'USA', '08692', '47595'),
('4 Rose Blvd', 'Los Angeles', 'CA', 'USA', '29033', '39032'),
('89 Canvas St', 'Dallas', 'TX', 'USA', '39032', '10023'),
('2903 Blake St', 'Houston', 'TX', 'USA', '29002', '18932'),
('5893 Vase St', 'Los Vegas', 'NV', 'USA', '39282', '38933'),
('55 Base St', 'Boston', 'MA', 'USA', '02115', '38921'),
('15 Leon Court', 'San Diego', 'CA', 'USA', '29047', '98473'),
('100 Flower St', 'San Francisco', 'CA', 'USA', '38902', '09475'),
('14 Bridge Drive', 'Tampa', 'FL', 'USA', '10920', '00918'),
('33 Disney St', 'Tampa', 'FL', 'USA', '10920', '62758'),
('88 Leon St', 'Boston', 'MA', 'USA', '02115', '69058'),
('40 Parker St', 'Boston', 'MA', 'USA', '02115', '20900'),
('10 Leon Way', 'Austin', 'TX', 'USA', '39022', '89585');

CREATE TABLE ff_store (
    storeID VARCHAR(20) primary key,
    styleID VARCHAR(20),
    priorityID VARCHAR(20)
);

INSERT INTO ff_store
(storeID, styleID, priorityID)
VALUES
('23245', '72282', '33835'),
('36373', '27272', '25178'),
('23645', '22282', '31835'),
('25545', '72092', '11835'), 
('20045', '29082', '13835'),
('09845', '29082', '11835'),
('39245', '49282', '32035'),
('20245', '72082', '31935'),
('10245', '72012', '00835'),
('33245', '72182', '33205'),
('88245', '22282', '33225'),
('23945', '22282', '35835'),
('23241', '72222', '33805'),
('23145', '62282', '13835'),
('33245', '74282', '31835'),
('63245', '02282', '13835'),
('83245', '92282', '93835'),
('23215', '72232', '36835'),
('21245', '72682', '33875'),
('23215', '72252', '31135');


CREATE TABLE seller (
    sellerID VARCHAR(5) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    business_name VARCHAR(20),
    business_age INT,
    reviewID VARCHAR(5),
    priceID VARCHAR(1),
    shipID VARCHAR(5),
    invoiceID VARCHAR(5),
    currency VARCHAR(20),
    styleID VARCHAR(5),
    ratingID VARCHAR(5),
    priorityID VARCHAR(5)

);


INSERT INTO seller
(sellerID, first_name, last_name, business_name, business_age, reviewID, priceID,
shipID, invoiceID, currency, styleID, ratingID, priorityID)
VALUES
('12345', 'Manasvini', 'Anjaria', 'GreenClothing', 10, '54321', '2', '12098', '5678', 'dollars', '45676', '3453', '1212'),
('09876', 'Nandini', 'Goyal', 'NandiniFashions', 4, '6784', '3', '12345', '0672', 'euros', '34565', '1298', '4782'), 
('12145', 'Manawvini', 'Anjfria', 'GrewnClothing', 40, '54321', '7', '12598', '5478', 'dollars', '46676', '3253', '1242'),
('29022', 'Bob', 'Anjaria', 'Breeze', 10, '38032', '5', '20033', '20222', 'euros', '10922', '2019', '0292'),
('11345', 'Grace', 'Gold', 'GoldCo', 20, '51321', '3', '12228', '5178', 'dollars', '49976', '9953', '1202'),
('22345', 'Anisha', 'Sin', 'SinCity', 11, '52021', '1', '22098', '9078', 'pesos', '29022', '2253', '9812'),
('10045', 'Ashley', 'Brad', 'Buddy', 20, '49032', '21', '00098', '2902', 'euros', '42276', '5453', '1210'),
('33345', 'Grab', 'By', 'Grabby', 30, '58821', '8', '18098', '8678', 'dollars', '48676', '8453', '1812'),
('12775', 'Pom', 'Pous', 'Pompous', 15, '54321', '5', '15098', '5578', 'dollars', '46556', '3553', '1552'),
('77345', 'Water', 'Bottle', 'WaterBottle', 17, '77321', '3', '12097', '5778', 'rupees', '47776', '3773', '1772'),
('12445', 'Can', 'Opener', 'CanOpener', 40, '44321', '3', '42098', '4478', 'dollars', '44676', '4453', '4212'),
('55545', 'Christmas', 'Tree', 'ChristmasTree', 20, '55521', '5', '12558', '5578', 'dollars', '45576', '5553', '1112'),
('21245', 'Speaker', 'Mike', 'SpeakerMIke', 80, '84321', '8', '82098', '8678', 'dollars', '85676', '8453', '8212'),
('90345', 'Pay', 'Phone', 'PayPhone', 33, '33321', '3', '33098', '3378', 'euros', '33676', '3353', '3312'),
('89345', 'Wallet', 'Purse', 'WallerPursr', 10, '52221', '3', '3098', '1678', 'dollars', '15676', '6453', '9212'),
('77745', 'Rose', 'Clay', 'RoseClay', 10, '53321', '7', '12998', '9078', 'euros', '11676', '3253', '9212'),
('19945', 'Post', 'It', 'PostIt', 18, '50321', '1', '18898', '8878', 'dollars', '88676', '8453', '8812'),
('12665', 'Six', 'Ty', 'SixTy', 10, '99321', '4', '19098', '9678', 'pesos', '49676', '9453', '9212'),
('52345', 'Seven', 'Ty', 'SevenTy', 30, '51321', '1', '11098', '5178', 'dollars', '145676', '1453', '1112'),
('88345', 'Eight', 'Ty', 'EightTy', 80, '84321', '3', '82098', '8678', 'euros', '85676', '8453', '8212');


CREATE TABLE issue_info (
    priorityID VARCHAR(5) primary key,
    length INT,
    severity VARCHAR(10),
    contributors VARCHAR(20)

);


INSERT INTO issue_info
(priorityID, length, severity, contributors)
VALUES
('6574', 50, 'moderate', 'CO2 Emissions'),
('4591', 10, 'minor', 'Labor Rights Violations'), 
('1591', 10, 'major', 'Water Pollution'),
('2591', 20, 'minor', 'CO2 Emissions'),
('3591', 30, 'moderate', 'Child Labor'),
('4491', 40, 'minor', 'Labor Rights Violations'),
('5591', 50, 'major', 'Labor Rights Violations'),
('6591', 60, 'minor', 'CO2 Emissions'),
('7591', 70, 'moderate', 'Child Labor'),
('8591', 80, 'minor', 'Labor Rights Violations'),
('9591', 90, 'major', 'Water Pollution'),
('0591', 100, 'major', 'CO2 Emissions'),
('4592', 102, 'moderate', 'Child Labor'),
('4593', 103, 'minor', 'CO2 Emissions'),
('4594', 104, 'major', 'Labor Rights Violations'),
('4595', 105, 'minor', 'Water Pollution'),
('4596', 106, 'minor', 'CO2 Emissions'),
('4597', 107, 'moderate', 'Water Pollution'),
('4598', 108, 'minor', 'CO2 Emissions'),
('4599', 109, 'major', 'Child Labor');


CREATE TABLE reviews (
    reviewID VARCHAR(5) primary key,
    rating INT,
    comment VARCHAR(100)

);


INSERT INTO reviews (reviewID, rating, comment)
VALUES
('5123', 5, 'Great clothing!'),
('6781', 2, 'Clothing came with a hole.'), 
('1781', 1, 'Bad.'), 
('2781', 2, 'Good.'), 
('3781', 3, 'Great!'), 
('4781', 4, 'Bad.'), 
('5781', 5, 'Great clothing!'), 
('7781', 1, 'Bad.'), 
('8781', 2, 'Good.'), 
('9781', 3, 'Great clothing!'), 
('0781', 4, 'Bad.'), 
('6181', 5, 'Clothing came with a hole.'), 
('6281', 1, 'Good.'), 
('6381', 2, 'Clothing came with a hole.'), 
('6481', 3, 'Bad.'), 
('6581', 4, 'Great clothing!'), 
('6681', 5, 'Bad.'), 
('6711', 1, 'Clothing came with a hole.'), 
('6721', 2, 'Bad.'), 
('6731', 3, 'Good.'), 
('6741', 4, 'Great clothing!'), 
('6751', 5, 'Bad.');



CREATE TABLE environmentalist (
    environmentalistID VARCHAR(5) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    educationID VARCHAR(5),
    years_of_workExperience INT,
    regionID VARCHAR(5),
    issue_of_interest VARCHAR(100)
);


INSERT INTO environmentalist (
    environmentalistID,
    first_name,
    last_name,
    age,
    educationID,
    years_of_workExperience,
    regionID,
    issue_of_interest)
VALUES
('27282', 'Anisha', 'Singh', 35, '2341', 12, '12398', 'CO2 Emissions'),
('456754','Meha', 'Macwan', 50, '5690', 30, '14298', 'Child Labor'), 
('156754','Neha', 'Macwan', 50, '1690', 40, '24298', 'Water Pollution'),
('256754','Teha', 'Pat', 50, '2690', 50, '44298', 'Labor Rights Violations'),
('356754','Beha', 'Cat', 50, '3690', 60, '54298', 'CO2 Emissions'),
('556754','Peha', 'Bold', 50, '4690', 70, '64298', 'Water Pollution'),
('656754','John', 'Grab', 50, '6690', 80, '74298', 'Labor Rights Violations'),
('756754','Muha', 'Star', 50, '7690', 35, '84298', 'Child Labor'),
('856754','Mark', 'Sit', 50, '8690', 71, '94298', 'CO2 Emissions'),
('956754','Mepa', 'Flower', 50, '9690', 38, '31298', 'Child Labor'),
('056754','Nela', 'Tabb', 50, '5190', 20, '32298', 'Child Labor'),
('416754','Chris', 'Brown', 50, '5290', 34, '33298', 'Labor Rights Violations'),
('426754','Smith', 'Coley', 50, '5390', 55, '35298', 'Child Labor'),
('436754','Bob', 'Drew', 50, '5490', 60, '36298', 'CO2 Emissions'),
('446754','Patty', 'Dylan', 50, '5590', 81, '37298', 'Labor Rights Violations'),
('466754','Cate', 'Brain', 50, '5790', 45, '38298', 'Water Pollution'),
('476754','Leha', 'Lane', 50, '5890', 54, '39298', 'Labor Rights Violations'),
('486754','Jake', 'Jakey', 50, '5990', 61, '34198', 'CO2 Emissions'),
('496754','Wisa', 'Wias', 50, '5610', 60, '34398', 'Labor Rights Violations'),
('450754','Nancy', 'Jape', 50, '5620', 37, '34498', 'CO2 Emissions');



CREATE TABLE education (
    educationID VARCHAR(5) primary key,
    length INT,
    school VARCHAR(100),
    degree VARCHAR(100)

);


INSERT INTO education (educationID,
    length,
    school,
    degree)
VALUES
('12903', 4, 'Northeastern University', 'Bachelors in Environmental Science'),
('24591', 8, 'Harvard University', 'Phd in Environmental Science'), 
('34591', 1, 'Barvard University', 'Bachelors in Environmental Science'),
('44591', 2, 'Carvarr University', 'Masters in Environmental Science'),
('54591', 3, 'Darvary University', 'Phd in Environmental Science'),
('64591', 4, 'Princeton University', 'Masters in Environmental Science'),
('74591', 5, 'Brown University', 'Bachelors in Environmental Science'),
('84591', 6, 'Rutgers University', 'Masters in Environmental Science'),
('94591', 7, 'Cal University', 'Phd in Environmental Science'),
('31591', 8, 'Penn University', 'Masters in Environmental Science'),
('32591', 1, 'Harvard College', 'Phd in Environmental Science'),
('33591', 2, 'Rose College', 'Bachelors in Environmental Science'),
('35591', 3, 'Flower University', 'Masters in Environmental Science'),
('36591', 30, 'Moon University', 'Phd in Environmental Science'),
('37591', 15, 'Star University', 'Masters in Environmental Science'),
('38591', 20, 'Tree University', 'Phd in Environmental Science'),
('39591', 5, 'Arizona University', 'Masters in Environmental Science'),
('34191', 9, 'Poppy University', 'Bachelors in Environmental Science'),
('34291', 10, 'Stem University', 'Masters in Environmental Science'),
('34391', 13, 'Harvard Education', 'Phd in Environmental Science');



CREATE TABLE ratings (
    regionID VARCHAR(5) primary key,
    sustainabilityID VARCHAR(5),
    affordabilityID VARCHAR(5)
);

INSERT INTO ratings (regionID, sustainabilityID, affordabilityID)
VALUES
('45902', '34098', '46721'),
('45025', '39155', '56782'), 
('15025', '31155', '16782'),
('25025', '32155', '26782'),
('35025', '33155', '36782'),
('55025', '34155', '46782'),
('65025', '19155', '66782'),
('75025', '29155', '76782'),
('85025', '49155', '86782'),
('95025', '59155', '96782'),
('21025', '69155', '51782'),
('41025', '79155', '26782'),
('42025', '89155', '53782'),
('43025', '89155', '54782'),
('44025', '37155', '55782'),
('46025', '38155', '57782'),
('47025', '39155', '58782'),
('48025', '39255', '59782'),
('49025', '39455', '50782'),
('40025', '39655', '11782');

