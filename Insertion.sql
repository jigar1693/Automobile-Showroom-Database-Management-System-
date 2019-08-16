Create Table ShowRoom(ShowRoomID varchar(250) Not Null PRIMARY KEY, ShowRoomName varchar(250), ShowRoomAddress varchar(250), 
ShowRoomPhoneNo int, ShowRoomPincode varchar(250))
USE [AutomobileShowroom]
go
Select * from ShowRoom;

INSERT INTO ShowRoom VALUES
('SH1', 'Ford', 'Borivali', 899886191, 401)

INSERT INTO ShowRoom VALUES
('SH2', 'Suzuki', 'Kandivali', 289925544, 402),
('SH3', 'Tata', 'Andheri', 286608334, 403),
('SH4', 'Toyota', 'Santacruz', 456745789, 404),
('SH5', 'Honda', 'Churchgate', 567822457, 405),
('SH6', 'Skoda', 'Bandra', 678954245, 406);


Create Table Dealer(DealerID varchar(250) Not Null PRIMARY KEY, DealerName varchar(250), DealerAddress varchar(250), 
DealerPhoneNo int, DealerStatus varchar(250), ShowRoomID varchar(250), 
FOREIGN KEY (ShowRoomID) REFERENCES ShowRoom(ShowRoomID))

Select * from Dealer;

Insert into Dealer Values
('D1', 'Car West', 'Mulund', 54678954, 'Available', 'SH4')

Insert into Dealer Values
('D2', 'Road Link', 'Dadar', 754689877, 'Not Available', 'SH2')
Insert into Dealer Values
('D3', 'Pit Stop', 'Goregaon', 546754789, 'Available', 'SH1'),
('D4', 'Big Boy Toys', 'Goregaon East', 645782245, 'Not Available', 'SH4'),
('D5', 'Zig Wheels', 'Dahisar', 784562314, 'Available', 'SH6'),
('D6', 'First Choice', 'Grant Road', 457831245, 'Available', 'SH3'),
('D7', 'Gravity Motors', 'Thane', 124576894, 'Not Available', 'SH5')

Create Table Vehicle(VehicleID varchar(250) Not Null PRIMARY KEY, VehicleName varchar(250), 
VehicleModel varchar(250), VehiclePrice decimal(9,2), VehicleType varchar(250), VehicleChassisNo int, 
ShowRoomID varchar(250), FOREIGN KEY (ShowRoomID) REFERENCES ShowRoom(ShowRoomID))

Select * from Vehicle;

Insert into Vehicle Values
('V1', 'Mahindra Thar', 'DI-Turbo', 45000.80, '4 Wheeler', 11, 'SH5')

Insert into Vehicle Values
('V2', 'Mahindra TharXL', 'DI-Turbo2', 48000.80, '4 Wheeler', 11, 'SH2'),
('V3', 'Jeep Rubicon', '4*4', 52000.50, '4 Wheeler', 31, 'SH1'),
('V4', 'Hummer', 'All Wheel Drive', 98000.10, '4 Wheeler', 61, 'SH3'),
('V5', 'KTM Duke 390', 'Jet Intake', 39000.70, '2 Wheeler', 99, 'SH5'),
('V6', 'Royal Enfield', 'Titanium', 83000.30, '2 Wheeler', 16, 'SH4')


Create Table Employee(EmployeeID varchar(250) Not Null PRIMARY KEY, EmployeeFirstName varchar(250), 
EmployeeLastName varchar(250),EmployeePhoneNo int, EmployeeEmail varchar(250), EmployeeSalary decimal(9,2), 
EmployeeSaleDetail varchar(250),ShowRoomID varchar(250), FOREIGN KEY (ShowRoomID) REFERENCES ShowRoom(ShowRoomID))

USE [AutomobileShowroom]
go
Select * from Employee;

Insert into Employee Values
('E1', 'Jigar', 'Patel', 899887181, 'jigar@gmail.com', 30000.25, '6-Cars and 1-Motorcycle', 'SH6')

Insert into Employee Values
('E2', 'Raksha', 'Suresh', 899881181, 'raksha@gmail.com', 28000.20, '5-Cars and 2-Motorcycle', 'SH6'),
('E3', 'Dheeraj', 'John', 898887181, 'dheeraj@gmail.com', 21000.00, '2-Cars and 3-Motorcycle', 'SH1'),
('E4', 'Poojitha', 'Shyla', 999887181, 'pooh@gmail.com', 19000.80, '1-Cars and 2-Motorcycle', 'SH2'),
('E5', 'Suhas', 'Meda', 899667181, 'suhas@gmail.com', 11000.00, '0-Cars and 1-Motorcycle', 'SH2'),
('E6', 'Shubha', 'Ramgopal', 229887181, 'shubha@gmail.com', 15000.25, '3-Cars and 0-Motorcycle', 'SH3'),
('E7', 'Arpita', 'Kumar', 345896745, 'arpita@gmail.com', 9000.85, '0-Cars and 6-Motorcycle', 'SH4'),
('E8', 'Ganesh', 'Kumar', 345896746, 'ganesh@gmail.com', 9100.95, '1-Cars and 1-Motorcycle', 'SH4'),
('E9', 'Darpan', 'Ash', 784512369, 'darpan@gmail.com', 5000.00, '0-Cars and 0-Motorcycle', 'SH5')

Create Table Customer(CustomerID varchar(250) Not Null PRIMARY KEY, CustomerFirstName varchar(250), 
CustomerLastName varchar(250), CustomerPhoneNo int, CustomerAddress varchar(250), CustomerEmail varchar(250), 
CustomerPreviousBuyingHistory xml, ShowRoomID varchar(250), 
FOREIGN KEY (ShowRoomID) REFERENCES ShowRoom(ShowRoomID))

Select * from Customer;

Insert into Customer Values
('C1', 'Tanmay', 'Salunkhe', 976989295, '12 21st Street, Dublin 2.', 'tanmay@gmail.com', 
'<previousbuyinghistory>
<vehiclecategory>4-Wheeler</vehiclecategory>
<vehiclename>Toyota Innova</vehiclename>
<chassisnumber>66</chassisnumber>
<vehicleprice>51000</vehicleprice>
<showroomID>SH4</showroomID>
</previousbuyinghistory>', 'SH1')

Insert into Customer Values
('C2', 'Shreyas', 'CN', 976989294, '13 Aungier, Dublin 8.', 'shreyas@hotmail.com', 
'<previousbuyinghistory>
<vehiclecategory>4-Wheeler</vehiclecategory>
<vehiclename>Ford Eco-Sport</vehiclename>
<chassisnumber>12</chassisnumber>
<vehicleprice>46000</vehicleprice>
<showroomID>SH1</showroomID>
</previousbuyinghistory>', 'SH1'),
Insert into Customer Values
('C3', 'Mittal', 'Suru', 976989274, '1 Henry Street, Dublin 7.', 'mittal@yahoo.com', 
'<previousbuyinghistory>
<vehiclecategory>2-Wheeler</vehiclecategory>
<vehiclename>Honda Activa</vehiclename>
<chassisnumber>14</chassisnumber>
<vehicleprice>35000</vehicleprice>
<showroomID>SH5</showroomID>
</previousbuyinghistory>', 'SH5'),
Insert into Customer Values
('C4', 'Kanak', 'Sharma', 566989294, '9 Queen Street, Dublin 1.', 'kanak@rediff.com', 
'<previousbuyinghistory>
<vehiclecategory>4-Wheeler</vehiclecategory>
<vehiclename>Skoda Rapid</vehiclename>
<chassisnumber>09</chassisnumber>
<vehicleprice>62000</vehicleprice>
<showroomID>SH6</showroomID>
</previousbuyinghistory>', 'SH6'),
Insert into Customer Values
('C5', 'Saumya', 'Lahera', 976119294, '4 Camden Street, Dublin 3.', 'saumya@hotmail.com', 
'<previousbuyinghistory>
<vehiclecategory>4-Wheeler</vehiclecategory>
<vehiclename>Suzuki Swift</vehiclename>
<chassisnumber>04</chassisnumber>
<vehicleprice>42000</vehicleprice>
<showroomID>SH2</showroomID>
</previousbuyinghistory>', 'SH2'),
Insert into Customer Values
('C6', 'Dwij', 'Bhatt', 977777294, '4 Grafton Street, Dublin 6.', 'dwij@hotmail.com', 
'<previousbuyinghistory>
<vehiclecategory>4-Wheeler</vehiclecategory>
<vehiclename>Tata Safari</vehiclename>
<chassisnumber>86</chassisnumber>
<vehicleprice>68000</vehicleprice>
<showroomID>SH3</showroomID>
</previousbuyinghistory>', 'SH3'),
Insert into Customer Values
('C7', 'Nirav', 'Shah', 702155333, '12 Exchequer Street, Dublin 4.', 'nirav@gmail.com', 
'<previousbuyinghistory>
<vehiclecategory>No Vehicle</vehiclecategory>
<vehiclename>--</vehiclename>
<chassisnumber>--</chassisnumber>
<vehicleprice>--</vehicleprice>
<showroomID>--</showroomID>
</previousbuyinghistory>', 'SH5'),
Insert into Customer Values
('C8', 'Varun', 'Maru', 976989294, 'Smiths Field, Dublin 5.', 'varun@gmail.com', 
'<previousbuyinghistory>
<vehiclecategory>No Vehicle</vehiclecategory>
<vehiclename>--</vehiclename>
<chassisnumber>--</chassisnumber>
<vehicleprice>--</vehicleprice>
<showroomID>--</showroomID>
</previousbuyinghistory>', 'SH2')

Select * from Customer;

Create Table Purchase(TransactionID varchar(250) Not Null PRIMARY KEY, PurchaseDate date, PurchaseAmount decimal(9,2), 
VehicleId varchar(250), FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID), 
EmployeeID varchar(250), FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
CustomerID varchar(250), FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
ShowRoomID varchar(250), FOREIGN KEY (ShowRoomID) REFERENCES ShowRoom(ShowRoomID))

Select * from Purchase;

Insert into Purchase Values
('T1', '2017-02-25', 48000.80, 'V2', 'E1', 'C1', 'SH1')

Insert into Purchase Values
('T2', '2017-06-25', 45000.80, 'V1', 'E2', 'C2', 'SH5'),
('T3', '2016-12-16', 45000.80, 'V6', 'E3', 'C3', 'SH4'),
('T4', '2017-08-01', 98000.10, 'V4', 'E4', 'C4', 'SH3'),
('T5', '2017-05-13', 39000.70, 'V5', 'E8', 'C5', 'SH5'),
('T6', '2017-12-01', 45000.80, 'V6', 'E6', 'C6', 'SH4')