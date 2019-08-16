1.
create procedure GetEmployeeDetailbyID( @EmployeeID varchar(100))
as 
begin
select * from [AutomobileShowroom].[dbo].[Employee] where EmployeeID=@EmployeeID;
end;
;

exec GetEmployeeDetailbyID 'E5';

1.
create procedure GetEmployeeDetailfromShowRoom( @ShowRoomID varchar(100))
as 
begin
select * from [AutomobileShowroom].[dbo].[Employee] where ShowRoomID=@ShowRoomID;
end;
;
exec GetEmployeeDetailfromShowRoom 'SH1';

2.
create procedure getShowRoomAndVehicleDetails(@showRoomName varchar(100))
as
begin
SELECT [t1].ShowRoomName,[t1].ShowRoomAddress,[t1].ShowRoomPhoneNo,[t2].VehicleModel,[t2].VehicleName,[t2].VehicleType,[t2].VehiclePrice
FROM [AutomobileShowroom].[dbo].[ShowRoom] as t1
INNER JOIN [AutomobileShowroom].[dbo].[Vehicle] as t2
 ON [t1].ShowRoomID=[t2].ShowRoomID  and [t1].ShowRoomName=@showRoomName ;
 end;
 ;

exec getShowRoomAndVehicleDetails 'Honda';

VIEWS

1.
create view SalesDetail as 
select ShowRoomID,CONCAT(str(SUM(purchaseAmount)),' Rs') as SalesDone from Purchase  group by ShowRoomID;

select * from SalesDetail;

 

3.
  use AutomobileShowroom
  go
  create procedure GetNumberOfCustomerFromAddress(@cityName varchar(100),@count VARCHAR (20) OUT)
  as
  begin
  select @count = count(CustomerID) from Customer where
  Customer.CustomerAddress=@cityName;
  end;
  ;

  Declare @intial_count as VARCHAR(20);
  exec GetNumberOfCustomerFromAddress 'Dublin 1',@intial_count output;
  select @intial_count;

4.
 use AutomobileShowroom
  go
create procedure GetVehicles (@VehicleType varchar(250) )
as
IF EXISTS 
  (SELECT * FROM Vehicle WHERE VehicleType = @VehicleType)
begin
	Select VehicleID, VehicleName, VehicleModel,
          VehiclePrice, VehicleChassisNo
	FROM Vehicle WHERE VehicleType = @VehicleType
end
else 
begin 
	Print ('No such vehicle type exists')
end 
go

exec GetVehicles '3 wheeler'

5.
 use AutomobileShowroom
  go
create procedure CustomerXML 
as
Select * from Customer
for XML raw('Customer'), elements, root;
go

exec CustomerXML 

6.
create procedure CustomerMultipleDT
@CustomerAddress varchar(250)
as 
select CustomerFirstName,CustomerLastName, 
CustomerPreviousBuyingHistory.query('(/previousbuyinghistory/vehiclename)') AS VehicleName,
CustomerPreviousBuyingHistory.query('(/previousbuyinghistory/vehicleprice)') AS VehiclePrice
 from Customer
 where CustomerAddress = @CustomerAddress
 go

 exec CustomerMultipleDT  'Dublin 1';

7.
USE [AutomobileShowroom]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 07/12/2017 19:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER procedure [dbo].[UpdateCustomer]
@CustomerID varchar(50),
@vehicleprice varchar(50)
as
Update Customer
set CustomerPreviousBuyingHistory=('replace value of (/previousbuyinghistory/vehicleprice) with sql:variable'+(@vehicleprice))
where CustomerID = @CustomerID;

replace value of (/previousbuyinghistory/vehicleprice) with sql:variable20400

8.
create  procedure EmployeeSaleCount( @EmployeeID varchar(100))
as 
begin
select count(EmployeeId) as saleCount from [AutomobileShowroom].[dbo].[Purchase]where EmployeeID=@EmployeeID;
end;
;
exec EmployeeSaleCount 'E6'

TRIGGERS

Use AutomobileShowroom
go
insert into Vehicle(VehicleID,VehicleName,VehicleModel,VehiclePrice,VehicleType,VehicleChassisNo,ShowRoomID) values('V10','Mahindra Scorpio', '4*6 Turbo', 59000.24, '4 Wheeler', 41, 'SH1');

Use AutomobileShowroom
go
update Vehicle set PriceInEuro=VehiclePrice/80;

create  TRIGGER trgAfterInsert1 ON Vehicle 
FOR INSERT
AS
	
	declare @VehicleID varchar(250);
	
	declare @VehiclePrice decimal(9,2);
	

	select @VehiclePrice=i.VehiclePrice from inserted i;	
	select @VehicleID=i.VehicleID from inserted i;
	

	update Vehicle set PriceInEuro=@VehiclePrice/80 where VehicleID=@VehicleID;
       

	PRINT 'AFTER INSERT trigger fired.'
GO





Trigger2


USE [AutomobileShowroom]
GO
CREATE TRIGGER PurchaseAuditTrigger
ON Purchase
FOR INSERT
AS
declare @TransactionId varchar(250);
declare @VehicleId varchar(250);
declare @ShowroomId varchar(250);
select @TransactionId = i.TransactionId from inserted i;
select @VehicleId = i.VehicleId  from inserted i;
select @ShowroomId = i.ShowroomId from inserted i;
insert into PurchaseAudit
(TransactionId,VehicleId,ShowroomId,auditdate) values (@TransactionId,@VehicleId,@ShowroomId,getdate());
PRINT 'After Trigger Inserted'
GO


CREATE TABLE PurchaseAudit
(
TransactionId varchar(250),
VehicleId varchar(250),
ShowRoomID varchar(250),
auditdate datetime
)

INSERT INTO Purchase Values ('T7','2017-03-26','34354','V6','E7','C7','SH6')
INSERT INTO Purchase Values ('T8','2017-05-16','45678','V5','E6','C5','SH1')
select * from PurchaseAudit


VIEWS
1.
USE [AutomobileShowroom]
GO

create view SalesDetail as 
select ShowRoomID,CONCAT(str(SUM(purchaseAmount)),' Rs') as SalesDone from Purchase  group by ShowRoomID;

select * from SalesDetail;

2.
use AutomobileShowroom
go
create View VehicleAvailableInShowRoom as
select v.VehicleName,v.VehicleModel,v.VehicleType,v.VehiclePrice ,s.ShowRoomName,s.ShowRoomAddress,s.ShowRoomPhoneNo
from Vehicle  as v inner join ShowRoom  as s on v.ShowRoomID=s.ShowRoomID;

select * from VehicleAvailableInShowRoom;