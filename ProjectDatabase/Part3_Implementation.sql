SET SERVEROUT ON;

--1
CREATE OR REPLACE FUNCTION f_print RETURN NVARCHAR2 AS
    v_print NVARCHAR2(50) NOT NULL DEFAULT 'Hello , Welcome to our Database';
BEGIN
    RETURN ( v_print );
END;

DECLARE
    v_display NVARCHAR2(50) := f_print;
BEGIN
    dbms_output.put_line(v_display);
END;

--2
--Procedure 1
create or replace  procedure P_increase_salaries as
    cursor c_Room is select * from Room where R_Cost = 420 for update;
    v_Cost_increase number := 2.00;
    v_old_Cost Nvarchar2(50);
begin
      for V_Room in c_Room loop 
      v_old_Cost := V_Room.R_Cost;
      V_Room.R_Cost := V_Room.R_Cost * v_Cost_increase;
      update Room set row = V_Room where current of c_Room; 
      dbms_output.put_line('The Cost of : '|| V_Room.R_ID
                            || ' is increased from '||v_old_Cost||' to '||V_Room.R_Cost);
    end loop;
END; 
Execute P_increase_salaries;

--Procedure 2
create or replace  procedure P_SelectHotelStars as
    cursor c_Hotel is select * from Hotel where H_stars= '5Stars' ;
   
begin
    for V_Hotel in c_Hotel loop 
      dbms_output.put_line('The Five Stars Hotel Name are : '|| V_Hotel.H_Name
                            || ' and the location '||V_Hotel.H_Location);
    end loop;
END; 
Execute P_SelectHotelStars;


--Procedure 3
create or replace  procedure P_SelectRoomID as
    cursor c_Room is select * from Room where R_type= 'SingleRoom' ;
   
begin
    for V_Room in c_Room loop 
      dbms_output.put_line('Room ID is '|| V_Room.R_ID
                            || ' And Room View '||V_Room.R_View);
    end loop;
END; 
Execute P_SelectRoomID;



--3
--Function 1
create or replace FUNCTION F_Get_Sum_Cost (V_Number Number) RETURN number AS 
    v_Sum_Cost number;
    BEGIN
      select sum(R_Cost) into v_Sum_Cost from Room ;
      RETURN v_Sum_Cost;
 END F_Get_Sum_Cost;


declare
      v_Sum_Cost number;
    begin
      v_Sum_Cost := F_Get_Sum_Cost(v_Sum_Cost);
      dbms_output.put_line('Sum is equal '||v_Sum_Cost);
    end; 


--Function 2
create or replace FUNCTION F_Get_AVG_Cost (V_Number Number) RETURN number AS 
    v_AVG_Cost number;
    BEGIN
      select AVG(R_Cost) into v_AVG_Cost from Room ;
      RETURN v_AVG_Cost;
    END F_Get_AVG_Cost;


declare
      v_AVG_Cost number;
    begin
      v_AVG_Cost := F_Get_AVG_Cost(v_AVG_Cost);
      dbms_output.put_line('Average is equal '||v_AVG_Cost);
    end; 


--Function 3
create or replace FUNCTION F_Get_MUL_Cost (V_Number Number) RETURN number AS 
    v_MUL_Cost number;
     V_total number;
    BEGIN
      select(R_Cost) into v_MUL_Cost from Room where R_ID = V_Number;
     V_total := v_MUL_Cost*2;
      RETURN V_total;
    END F_Get_MUL_Cost;

DECLARE
    v_total NUMBER := :inputuser;
BEGIN
    v_total := f_get_mul_cost(v_total);
    dbms_output.put_line('Multiplication is equal ' || v_total);
END; 




--4
--Cursor 1
declare
  cursor c_Visitor is select V_ID , V_Name from Visitor where V_Email is Null And V_Phone is Null;
  v_Visitor c_Visitor%rowtype;
begin
  open c_Visitor;
  --Before we did the loop we check the number of visitors that don't have phone and email by select statement
  for i in 1..3 loop
  --We did the fetch in the for loop as without the for loop only one record will appear
    fetch c_Visitor into v_Visitor;
    dbms_output.put_line('Visitor ID is '||v_Visitor.V_id||' Visitor Name is ' ||v_Visitor.V_name);
  end loop;
  close c_Visitor;
END; 


--Cursor 2
declare
  cursor c_Administrator is select A_ID  from Administrator where A_Name ='Ahmed';
  v_Administrator c_Administrator%rowtype;
begin
  open c_Administrator;
  --Before we did the loop we check the number of visitors that don't have phone and email by select statement
  for i in 1..2 loop
    fetch c_Administrator into v_Administrator;
    dbms_output.put_line('Administrator ID is '||v_Administrator.A_id);
  end loop;
  close c_Administrator;
END; 


--Exception 5
--Predefined 1
declare	
 v_temp varchar(50);
 V_idd Visitor.V_id%type := :InputUser; 
begin
    select V_Name into v_temp from Visitor where V_ID=V_idd;
    dbms_output.put_line(v_temp);
    Exception
    when no_data_found then
    dbms_output.put_line('We Are sorry but there is no Visitor with ID = '|| V_idd);

END; 



--Predefined 2
Declare
V_idd Visitor.V_id%type := :InputUser; 
Begin
Insert into Visitor(V_ID , V_Name , V_Email , V_Phone) values(V_idd, 'Nada' ,'nada@gmail.com' , Null );
Exception
--Handling PK
when DUP_VAL_ON_INDEX then
dbms_output.put_line('ID '|| V_idd || ' is unavailable please choose another one');
End;


-- Exception User 1 
DECLARE 
   V_idd visitor.v_id%type := :visitor_id; 
   V_namee visitor.v_name%type; 
   V_emaill visitor.v_email%type;  

  ex_invalid_id  EXCEPTION; 
BEGIN 
   IF V_idd <= 0 THEN 
      RAISE ex_invalid_id; 
   ELSE 
      SELECT  v_name, v_email INTO  V_namee, V_emaill 
      FROM visitor
      WHERE v_id = v_idd;
      DBMS_OUTPUT.PUT_LINE ('Name: '||  v_namee);  
      DBMS_OUTPUT.PUT_LINE ('email: ' || v_emaill); 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_id THEN 
      dbms_output.put_line('ID must be greater than zero!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such visitor!'); 
 
END;





--User 2
DECLARE 
   V_idd Administrator.A_id%type := :Administrator_ID; 
   V_namee Administrator.A_name%type; 
   V_emaill Administrator.A_email%type;  
   V_salary  Administrator.A_Salary%type;

   ex_invalid_Salary  EXCEPTION; 
  
BEGIN 
 Select A_Salary into V_salary from Administrator where A_ID = V_idd;
   IF V_salary > 2000 THEN 
      RAISE ex_invalid_Salary; 
   ELSE 
      SELECT  A_name, A_email INTO  V_namee, V_emaill 
      FROM Administrator
      WHERE A_id = v_idd;
      DBMS_OUTPUT.PUT_LINE ('Name: '||  v_namee);  
      DBMS_OUTPUT.PUT_LINE ('email: ' || v_emaill); 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_Salary THEN 
      dbms_output.put_line('Salary too much!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Administrator!'); 
 
END;


--3
DECLARE 
   V_idd Payment.P_id%type := :Payment_ID; 
  -- V_namee Payment.P_name%type; 
   V_Type Payment.P_Type%type;  
   V_Amount  Payment.P_Amount%type;
   
   ex_invalid_Amount  EXCEPTION; 
  
BEGIN 
 Select P_Amount into V_Amount from Payment where P_ID = V_idd;
   IF V_Amount > 2000 THEN 
      RAISE ex_invalid_Amount; 
   ELSE 
      SELECT  P_Type INTO  V_Type
      FROM Payment
      WHERE P_id = v_idd;
      DBMS_OUTPUT.PUT_LINE ('Type : '||  V_Type);  
 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_Amount THEN 
      dbms_output.put_line('Amount too much!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No ID Like This!'); 
 
END;



--6
--For Loop 
DECLARE 
V_ID Number;
V_Flag BOOLEAN := FALSE;
V_Found VARCHAR2(50);
begin
  for i in (select * from Visitor where V_ID =1 ) loop
  if i.V_ID = 1 THEN
    V_Flag := TRUE;
    V_Found := i.v_name;
    else
    V_Flag := False;
    end if;
  end loop;
  if v_flag = TRUE THEN
  dbms_output.put_line('ID is found And Name is '|| V_Found);
  else
   dbms_output.put_line('No one has ID = '|| V_ID);
  end if;
END;





Create Table Room_Copy As Select * From Room;
select * from Room_Copy;
drop table Room_copy;


--7
--Assosiative Array 1
 declare
  type e_list is table of Room_Copy%rowtype index by pls_integer;
  Room e_list;
  idx pls_integer;
begin
    for x in 1..15 loop
    select * into Room(x) from Room_Copy 
       where R_ID = x;
  end loop;
  idx := Room.first;
  while idx is not null loop
    Room(idx).R_cost := Room(idx).R_Cost + Room(idx).R_Cost*0.2;
    insert into Room_Copy values Room(idx);
    dbms_output.put_line('The Type of Room '|| Room(idx).R_Type || 'And its cost is '|| Room(idx).R_Cost);
    idx := Room.next(idx);
  end loop;
end;


--2
Create Table Payment_Copy As Select * From Payment;
Select * from Payment_Copy;
Drop table Payment_copy;

declare
  type e_list is table of Payment_Copy%rowtype index by pls_integer;
  Payment e_list;
  idx pls_integer;
begin
    for x in 1..16 loop
    select * into Payment(x) from Payment_Copy 
       where P_ID = x;
  end loop;
  idx := Payment.first;
  while idx is not null loop
    Payment(idx).P_Amount := Payment(idx).P_Amount + Payment(idx).P_Amount*0.2;
    insert into Payment_Copy values Payment(idx);
    dbms_output.put_line('The Type of Payment '|| Payment(idx).P_Type || ' And its cost '|| Payment(idx).P_Amount);
    idx := Payment.next(idx);
  end loop;
end;




--3
Create Table Administrator_Copy As Select * From Administrator;
Select * from Administrator_Copy;
Drop table Administrator_copy;

declare
  type e_list is table of Administrator_Copy%rowtype index by pls_integer;
  Administrator e_list;
  idx pls_integer;
begin
    for x in 1..16 loop
    select * into Administrator(x) from Administrator_Copy 
       where A_ID = x;
  end loop;
  idx := Administrator.first;
  while idx is not null loop
    Administrator(idx).A_Salary := Administrator(idx).A_Salary + Administrator(idx).A_Salary*0.2;
    insert into Administrator_Copy values Administrator(idx);
    dbms_output.put_line('The Type of Administrator '|| Administrator(idx).A_Name|| ' And its cost '|| Administrator(idx).A_Salary);
    idx := Administrator.next(idx);
  end loop;
end;























-- Ask
DECLARE 
   V_idd Payment.P_id%type := &Payment_ID; 
  -- V_namee Payment.P_name%type; 
   V_Type Payment.P_Type%type;  
   V_Amount  Payment.P_Amount%type;
   
   ex_invalid_Amount  EXCEPTION; 
  
BEGIN 
 Select P_Amount into V_Amount from Payment where P_ID = V_idd;
   IF V_Amount > 2000 THEN 
      RAISE ex_invalid_Amount; 
   ELSE 
      SELECT  P_Type INTO  V_Type
      FROM Payment
      WHERE P_id = v_idd;
      DBMS_OUTPUT.PUT_LINE ('Type : '||  V_Type);  
 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_Amount THEN 
      dbms_output.put_line('Amount too much!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No ID Like This!'); 
 
END;

















































































