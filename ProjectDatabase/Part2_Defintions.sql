SET SERVEROUT ON;

--Database Name
Declare
 v_name  VARCHAR2(50) NOT NULL DEFAULT 'Hotel Management System';
BEGIN
dbms_output.put_line('Welome Our Database Name is : '
                         || v_name);
END;


--2

DECLARE
    v_name  VARCHAR2(50) NOT NULL DEFAULT 'Hotel Management System';
    v_firstname  VARCHAR2(50) NOT NULL DEFAULT 'Nada Wael Mohamed';
    v_secondname  VARCHAR2(50) NOT NULL DEFAULT 'Alaa Gamal';
    v_thirdname  VARCHAR2(50) NOT NULL DEFAULT 'Mohamed Abdelgelil';
    v_GroupNumber NUMBER NOT NULL DEFAULT '8';
    v_IDFirst NUMBER NOT NULL DEFAULT '20181435';
    v_IDSecond NUMBER NOT NULL DEFAULT '20184859';
    v_IDthird NUMBER NOT NULL DEFAULT '20184997';
    v_CURRENT_DATE DATE := SYSDATE;
    
BEGIN
     dbms_output.put_line('Hello We Are Group Number : '  || v_GroupNumber || ' And Our Database is : ' || v_name || ' And Our Members Are : ');
     dbms_output.put_line('');
     dbms_output.put_line('First Member Name ' || v_firstname || ' ID: ' || v_IDFirst);
     dbms_output.put_line('Second Member Name ' || v_secondname || ' ID: ' || v_IDSecond);
     dbms_output.put_line('Third Member Name ' || v_thirdname || ' ID: ' || v_IDthird); 
     dbms_output.put_line('Current System Data  ' || v_CURRENT_DATE); 

END;

