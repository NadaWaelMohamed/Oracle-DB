SET SERVEROUT ON;
CREATE TABLE Visitor
(
	V_ID INT NOT NULL PRIMARY KEY, 
    V_Name  NVARCHAR2(50) NULL, 
    V_Email NVARCHAR2(50) NULL, 
    V_Phone NVARCHAR2(50) NULL
);


CREATE TABLE Payment
(
	P_ID INT NOT NULL PRIMARY KEY, 
    P_Amount NVARCHAR2(50) NULL, 
    P_Type NVARCHAR2(50) NULL, 
    P_Date NVARCHAR2(50) NULL,
    V_ID INT ,
    R_ID INT
);

Alter Table Payment Add constraint Payment_V_ID_FK foreign key(V_ID) References Visitor(V_ID);
Alter Table Payment Add constraint Payment_Room_ID_FK foreign key(R_ID) References Room(R_ID);


CREATE TABLE Room
(
	R_ID INT NOT NULL PRIMARY KEY, 
    R_Cost  NVARCHAR2(50) NULL, 
    R_Type NVARCHAR2(50) NULL, 
    R_View NVARCHAR2(50) NULL,
    Reservation_ID INT
);

Alter Table Room Add constraint Room_Reservation_ID_FK foreign key(Reservation_ID) References Reservation(R_ID);



CREATE TABLE Reservation
(
	R_ID INT NOT NULL PRIMARY KEY, 
    R_Period  NVARCHAR2(50) NULL, 
    R_Start_Date NVARCHAR2(50) NULL, 
    R_End_Date NVARCHAR2(50) NULL,
    H_ID INT,
    V_ID INT
);

Alter Table Reservation Add constraint Reservation_H_ID_FK foreign key(H_ID) References Hotel(H_ID);
Alter Table Reservation Add constraint Reservation_V_ID_FK foreign key(V_ID) References Visitor(V_ID);
CREATE TABLE Visitor
(
	V_ID INT NOT NULL PRIMARY KEY, 
    V_Name  NVARCHAR2(50) NULL, 
    V_Email NVARCHAR2(50) NULL, 
    V_Phone NVARCHAR2(50) NULL
);

Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(1, 'Nada' ,'nada@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(2, 'Alaa' ,Null , '0011' );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(3, 'Mohamed' ,'mohamed@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(4, 'Samar' ,'samar@gmail.com' , '0015' );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(5, 'Rana' ,Null , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(6, 'Yassin' ,'yasssin@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(7, 'Zein' ,'zein@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(8, 'Dalida' ,Null , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(9, 'Ahmed' ,'ahmed21@gmail.com' , '0017' );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(10, 'Galal' ,'galal17@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(11, 'Ziad' ,Null , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(12, 'Ranem' ,'ranem77@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(13, 'Reem' ,'reem2000@gmail.com' , '0021' );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(14, 'Esraa' ,'esraa33@gmail.com' , Null );
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(15, 'Selim' ,Null , '0055' );






CREATE TABLE Payment
(
	P_ID INT NOT NULL PRIMARY KEY, 
    P_Amount NVARCHAR2(50) NULL, 
    P_Type NVARCHAR2(50) NULL, 
    P_Date NVARCHAR2(50) NULL,
    V_ID INT ,
    R_ID INT
);


Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(1, '10' ,'Cash','1/1/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(2, '20' ,'Visa',Null);
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(3, '30' ,'Cash','17/9/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(4, '40' ,'Cash','1/8/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(5, '10' ,'Cash','4/1/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(6, '40' ,'Cash','1/1/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(7, '20' ,'Cash',Null);
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(8, '10' ,'visa','3/3/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(9, '80' ,'Cash',Null);
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(10, '10' ,'Cash','1/4/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(11, '60' ,'Cash','1/3/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(12, '10' ,'Visa','7/7/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(13, '10' ,'Visa',Null);
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(14, '30' ,'Visa','1/1/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(15, '10' ,'Cash','15/6/2000');
Insert into Payment(P_ID , P_Amount , P_Type , P_date) values(16, '3000' ,'Cash','15/6/2000');







Alter Table Payment Add constraint Payment_V_ID_FK foreign key(V_ID) References Visitor(V_ID);
Alter Table Payment Add constraint Payment_Room_ID_FK foreign key(R_ID) References Room(R_ID);


CREATE TABLE Room
(
	R_ID INT NOT NULL PRIMARY KEY, 
    R_Cost  NVARCHAR2(50) NULL, 
    R_Type NVARCHAR2(50) NULL, 
    R_View NVARCHAR2(50) NULL,
    Reservation_ID INT
);


Insert into Room(R_ID , R_Cost , R_Type , R_View) values(1, '10' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(2, '10' ,'DoubleRoom','Garden');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(3, '20' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(4, '10' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(5, '50' ,'SingleRoom','Sea');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(6, '10' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(7, '10' ,'DoubleRoom','Garden');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(8, '50' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(9, '10' ,'DoubleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(10, '10' ,'SingleRoom','Sea');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(11, '20' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(12, '10' ,'DoubleRoom','Garden');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(13, '10' ,'SingleRoom','Pool');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(14, '10' ,'SingleRoom','Garden');
Insert into Room(R_ID , R_Cost , R_Type , R_View) values(15, '50' ,'DoubleRoom','Sea');




Create Table Room_Copy As Select * From Room;


Select * from Room_Copy;



Alter Table Room Add constraint Room_Reservation_ID_FK foreign key(Reservation_ID) References Reservation(R_ID);



CREATE TABLE Reservation
(
	R_ID INT NOT NULL PRIMARY KEY, 
    R_Period  NVARCHAR2(50) NULL, 
    R_Start_Date NVARCHAR2(50) NULL, 
    R_End_Date NVARCHAR2(50) NULL,
    H_ID INT,
    V_ID INT
);

Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(1, '5Days' ,'1/1/2000','6/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(2, '4Days' ,'5/1/2000','9/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(3, '5Days' ,'1/1/2000','6/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(4, '6Days' ,'4/1/2000','10/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(5, '6Days' ,'17/1/2000','22/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(6, '5Days' ,'1/1/2000','6/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(7, '5Days' ,'1/1/2000','6/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(8, '5Days' ,'18/1/2000','23/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(9, '17Days' ,'1/1/2000','18/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(10, '5Days' ,'1/1/2000','6/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(11, '5Days' ,'20/1/2000','25/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(12, '6Days' ,'1/1/2000','7/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(13, '5Days' ,'6/1/2000','11/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(14, '5Days' ,'15/1/2000','20/1/2000');
Insert into Reservation(R_ID , R_Period , R_Start_Date , R_End_Date) values(15, '4Days' ,'1/1/2000','5/1/2000');



Alter Table Reservation Add constraint Reservation_H_ID_FK foreign key(H_ID) References Hotel(H_ID);
Alter Table Reservation Add constraint Reservation_V_ID_FK foreign key(V_ID) References Visitor(V_ID);




CREATE TABLE Administrator
(
	A_ID INT NOT NULL PRIMARY KEY, 
    A_Name  NVARCHAR2(50) NULL, 
    A_Email NVARCHAR2(50) NULL, 
    A_Phone NVARCHAR2(50) NULL
);
Alter table Administrator add A_Salary nvarchar2(50)Null;


Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(1, 'Ahmed' ,'ahmed@gmail.com','1122','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(2, 'Mohamed' ,'mohamed@gmail.com',Null,'20');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(3, 'Ziad' ,'ziad@gmail.com','1150','30');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(4, 'Yassin' ,'yassin@gmail.com','1173','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(5, 'Alaa' ,'alaa@gmail.com','1160','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(6, 'Nada' ,'nada@gmail.com','1172','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(7, 'Dalia' ,'dalia@gmail.com',Null,'30');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(8, 'Yaser' ,'yaser@gmail.com','1133','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(9, 'Dalida' ,'dalida@gmail.com',Null,'10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(10, 'Salma' ,'salma@gmail.com',Null,'10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(11, 'Hamza' ,'hamza@gmail.com','1177','20');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(12, 'Rana' ,'rana@gmail.com','1137','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(13, 'Mahmoud' ,'mahmoud@gmail.com',Null,'10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(14, 'Maha' ,'maha@gmail.com','1199','10');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(15, 'Ahmed' ,'ahmed@gmail.com',Null,'20');
Insert into Administrator(A_ID , A_Name , A_Email , A_Phone,A_Salary) values(16, 'Ahmed' ,'ahmed@gmail.com',Null,'3000');





CREATE TABLE Hotel
(
	H_ID INT NOT NULL PRIMARY KEY, 
    H_Name  NVARCHAR2(50) NULL, 
    H_Location NVARCHAR2(50) NULL, 
    H_Stars NVARCHAR2(50) NULL
);

Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(1, 'Fairmont' ,'SharmElSheikh','5Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(2, 'Kempenski' ,'FifthSettelment','7Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(3, 'Concord' ,'Nozha','3Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(4, 'ConcordElSalam' ,'AinElSokhna','2Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(5, 'Badr' ,'Gharda2a','1Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(6, 'Akhnaton' ,'ElSalam','5Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(7, 'Tulip' ,'Giza','4Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(8, 'Marriot' ,'El3asher','3Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(9, 'FourSesion' ,'Mokatam','7Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(10, 'Royal' ,'Madi','5Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(11, 'Dusit' ,'MarsaAlam','4Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(12, 'PortoCairo' ,'MohamedNageb','5Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(13, 'Rose' ,'ElRehab','3Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(14, 'Santorni' ,'ElSwes','3Stars');
Insert into Hotel(H_ID , H_Name , H_Location , H_Stars) values(15, 'Reem' ,'Assiut','2Stars');




CREATE TABLE Administrator_Reservation
(
	R_ID INT NOT NULL , 
    A_ID INT NOT NULL, 
    PRIMARY KEY (A_ID, R_ID)
);

Alter Table Administrator_Reservation Add constraint Admin_Res_R_ID_FK foreign key(R_ID) References Reservation(R_ID);
Alter Table Administrator_Reservation Add constraint Admin_Res_A_ID_FK foreign key(A_ID) References Administrator(A_ID);






