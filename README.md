***Question 1:*** 

ERD:

In the ERD, according to the given case study we have the following ENTITIES:

1\.	AIRPLANE

2\.	PILOT

3\.	HANGAR

4\.	SERVICE

5\.	EMPLOYEE

6\.	PLANE\_TYPE

7\.	OWNER

8\.	PERSON

9\.	CORPORATION

The relationships, FLIES, is\_of\_type, OWNS, Stored\_in, works\_on, maintain and plane\_service are all given in the case study. Plane\_service and Maintain are identifying relationships as they are between Airplane and Service entities and Employee and Service entities respectively, and the entity SERVICE is a weak entity because it depends on the existence of an airplane.

OWNER Is a union subclass of person and corporation because owner can be either of these, and since pilot and employees are person and not a corporation that is why they have a union relationship with PERSON entity.

1\.	AIRPLANE and PILOT have a 1 to many relationship

2\.	HANGAR and AIRPLANE have a 1 to many relationship too

3\.	AIRPLANE and PLANE\_TYPE have a 1 to many relationship too

4\.	AIRPLANE and OWNER have a many to many relationship

5\.	PLANE\_TYPE and PILOT have many to many relationship 

6\.	AIRPLANE and SERVICE have a 1 to many relationship 

7\.	PLANE\_TYPE and EMPLOYEE have a many to many relationship

8\.	EMPLOYEE and SERVICE have many to many relationship

***Question 2:***

Database tables created:

1. Airplane 
1. Plane\_type
1. Hangar 
1. Owner 
1. Owns 
1. Employee
1. Pilot 
1. Flies 
1. Service 
1. Plane\_service 
1. Maintain
1. Works\_on 

The Airplane table should have Reg# as the primary key and foreign keys referencing Plane\_type and Hangar tables. The Plane\_type table should have Model as the primary key and attributes including Capacity and Weight. The Hangar table should have Number as the primary key and attributes including Capacity and Location. The Owner table should have Owner\_id as the primary key and attributes including Type (person or corporation), Name, Address, and Phone. The Owns table should have foreign keys referencing Airplane and Owner tables and pdate attribute. The Employee table should have Ssn as the primary key and attributes including Name, Address, Phone, Salary (if employee), and Shift (if employee). The Pilot table should have Lic\_num as the primary key, a foreign key referencing the Employee table, and an attribute Restr. The Flies table should have foreign keys referencing Pilot and Plane\_type tables. The Service table should have Service\_id as the primary key and attributes including Date, Hours, and Work\_code. The Plane\_service table should have foreign keys referencing Airplane and Service tables. The Maintain table should have foreign keys referencing Employee and Service tables. The Works\_on table should have foreign keys referencing Employee and Plane\_type tables.

***Question 3:***

This query is used to find out the registration number of planes that are not present in the PLANE\_SERVICE table.

***Implementation:*** 

SELECT REGNO FROM AIRPLANE1

WHERE REGNO NOT IN (

`    `SELECT REGNO

`    `FROM PLANE\_SERVICE

);

***Question 4:***

The query retrieves the name and address of the owners of all hangars that have a capacity greater than 200. The INNER JOIN clause is used to combine two tables - OwnerP and Hangar1. The ON clause is used to specify the join condition, which is that the Hangar1.NUMBER column must match the OwnerP.ID column. The WHERE clause is used to specify the condition that the hangar capacity must be greater than 200.

***Implementation:*** 

SELECT O.ONAME, O.ADDRESS 

FROM OWNERP O 

INNER JOIN HANGAR1 H ON H.NUMBER=O.ID

WHERE H.CAPACITY>200;

***Question 5:***

The query retrieves the average salary of employees who work between 10 PM and 6 AM. The AVG() function is used to calculate the average salary. The WHERE clause is used to specify the condition that the ESHIFT\_START column must be greater than or equal to 10 PM (22:00:00) OR the ESHIFT\_END column must be less than or equal to 6 AM (06:00:00).

***Implementation:*** 

SELECT AVG(SALARY) AS AVERAGE\_SALARY FROM EMPLOYEE2

WHERE ESHIFT\_START>='22:00:00' OR ESHIFT\_END<='06:00:00';

***Question 6:***

This query is used to find the top 5 employees with the most service hours in maintaining planes.

***Implementation:*** 

SELECT TOP 5 EMPLOYEE2.SSN, ENAME, SERVICE2.SHOURS 

FROM EMPLOYEE2

INNER JOIN MAINTAIN

ON EMPLOYEE2.SSN = MAINTAIN.SSN

INNER JOIN SERVICE2

ON MAINTAIN.SERVICE\_ID = SERVICE2.SERVICE\_ID

ORDER BY SHOURS

DESC

***Question 7:***

This query is used to find the planes serviced in the last 7 days.

***Implementation:*** 

SELECT PLANETYPE2.MODEL, PLANETYPE2.REGNO

FROM PLANETYPE2

INNER JOIN PLANE\_SERVICE

ON PLANETYPE2.REGNO = PLANE\_SERVICE.REGNO

INNER JOIN SERVICE2

ON PLANE\_SERVICE.SERVICE\_ID=SERVICE2.SERVICE\_ID

WHERE SERVICE2.SDATE BETWEEN DATEADD(day, -7, GETDATE()) And GETDATE();



***Question 8:***

This query is used to find the owners and their phone numbers who have planes that were purchased in the last month.

***Implementation:*** 

SELECT OWNERP.ONAME, OWNERP.PHONENO

FROM OWNERP

INNER JOIN OWNS2

ON OWNERP.ID = OWNS2.ID

WHERE OWNS2.PDATE BETWEEN DATEADD(MONTH, -1, GETDATE()) And GETDATE();

***Question 9:***

This SQL query uses a LEFT JOIN to combine data from two tables PILOT1 and FLIES1 based on the LIC\_NUM field. It counts the number of authorized planes that each pilot has access to and groups the results by pilot's LIC\_NUM and NAMEP.

***Implementation:*** 

SELECT PILOT1.LIC\_NUM, PILOT1.NAMEP, COUNT(FLIES1.LIC\_NUM) AS AUTHORIZED\_PLANES

FROM PILOT1

LEFT JOIN FLIES1 ON PILOT1.LIC\_NUM = FLIES1.LIC\_NUM

GROUP BY PILOT1.LIC\_NUM, PILOT1.NAMEP;

***Question 10:***

This query is used to find the location and capacity of the hangar with the highest capacity.

***Implementation:*** 

SELECT top 1 LOCATIONS, CAPACITY

FROM HANGAR1

ORDER BY CAPACITY 

DESC

***Question 11:***

This query is used to find the number of planes owned by each corporation.

***Implementation:*** 

SELECT ONAME, COUNT(OTYPE) AS 'PLANENO'

FROM OWNERP

WHERE OTYPE='Corporation'

GROUP BY ONAME

ORDER BY [PLANENO]

DESC

***Question 12:***

This query is used to find the average service hours for each model of plane.

***Implementation:*** 

SELECT PLANETYPE2.MODEL, AVG(SERVICE2.SHOURS)

FROM PLANETYPE2, SERVICE2, PLANE\_SERVICE

WHERE PLANETYPE2.REGNO = PLANE\_SERVICE.REGNO AND SERVICE2.SERVICE\_ID = PLANE\_SERVICE.SERVICE\_ID

GROUP BY PLANETYPE2.MODEL

***Question 13:***

This query is retrieving the names of the owners of planes that were maintained by employees. The challenge in this query is that it involves multiple tables, and the condition for joining these tables is not straightforward. This query uses the JOIN operator to connect the tables together using the ID, REGNO, MODEL, and SSN columns. It then retrieves the DISTINCT ONAME from the OWNERP table where the MAINTAIN table's SERVICE\_ID matches the PLANETYPE2 table's REGNO.

***Implementation:*** 

SELECT DISTINCT ONAME

FROM OWNERP 

JOIN OWNS2 ON OWNERP.ID = OWNS2.ID 

JOIN PLANETYPE2 ON OWNS2.REGNO = PLANETYPE2.REGNO 

JOIN WORKS\_ON1 ON PLANETYPE2.MODEL = WORKS\_ON1.MODEL 

JOIN MAINTAIN ON WORKS\_ON1.SSN = MAINTAIN.SSN 

WHERE MAINTAIN.SERVICE\_ID = PLANETYPE2.REGNO;

***Question 14:***

This query is retrieving the names and phone numbers of the owners of planes that belong to corporations and are stored in hangars. The challenge in this query is to join the tables to retrieve the desired information

***Implementation:*** 

SELECT OWNERP.ONAME, OWNERP.PHONENO

FROM OWNERP 

JOIN OWNS2 ON OWNERP.ID = OWNS2.ID 

JOIN HANGAR1 ON OWNS2.REGNO = HANGAR1.REGNO 

WHERE OWNERP.OTYPE = 'Corporation' 

AND HANGAR1.LOCATIONS = OWNERP.ADDRESS;

***Question 15:***

This SQL query retrieves the distinct names of pilots who have flown a plane that has undergone maintenance. It involves multiple joins to combine data from tables EMPLOYEE2, PILOT1, FLIES1, PLANETYPE2, AIRPLANE1, PLANE\_SERVICE, and MAINTAIN based on common fields. The main challenge faced in this query was to optimize the query as it involves multiple join statements.

***Implementation:*** 

SELECT DISTINCT PILOT1.NAMEP

FROM PILOT1

JOIN EMPLOYEE2 ON EMPLOYEE2.SSN = PILOT1.SSN

JOIN FLIES1 ON PILOT1.LIC\_NUM = FLIES1.LIC\_NUM

JOIN PLANETYPE2 ON FLIES1.MODEL = PLANETYPE2.MODEL

JOIN AIRPLANE1 ON PLANETYPE2.REGNO = AIRPLANE1.REGNO

JOIN PLANE\_SERVICE ON AIRPLANE1.REGNO = PLANE\_SERVICE.REGNO

JOIN MAINTAIN ON PLANE\_SERVICE.SERVICE\_ID = MAINTAIN.SERVICE\_ID

WHERE MAINTAIN.SSN = PILOT1.SSN;

***Question 16:***

This query is retrieving the names of employees who worked on planes owned by corporations and maintained by them for the longest time. The challenge in this query is to join the tables to retrieve the desired information and order the results based on the longest service hours.

***Implementation:*** 

SELECT EMPLOYEE2.ENAME

FROM EMPLOYEE2 

JOIN WORKS\_ON1 ON EMPLOYEE2.SSN = WORKS\_ON1.SSN 

JOIN PLANETYPE2 ON WORKS\_ON1.MODEL = PLANETYPE2.MODEL 

JOIN OWNS2 ON PLANETYPE2.REGNO = OWNS2.REGNO 

JOIN OWNERP ON OWNS2.ID = OWNERP.ID 

JOIN MAINTAIN ON EMPLOYEE2.SSN = MAINTAIN.SSN 

JOIN SERVICE2 ON SERVICE2.SERVICE\_ID = MAINTAIN.SERVICE\_ID

WHERE OWNERP.OTYPE = 'Corporation'

ORDER BY SERVICE2.SHOURS DESC;

***Question 17:***

This query is retrieving the model and registration number of the planes that were maintained by employees who do not work for corporations or work during the day. The challenge in this query is to join the tables to retrieve the desired information based on a set of complex conditions.

***Implementation:*** 

SELECT DISTINCT  PLANETYPE2.MODEL,PLANETYPE2.REGNO

FROM PLANETYPE2

INNER JOIN OWNS2 ON PLANETYPE2.REGNO = OWNS2.REGNO

INNER JOIN OWNERP ON OWNS2.ID = OWNERP.ID

INNER JOIN PLANE\_SERVICE ON OWNS2.REGNO = PLANE\_SERVICE.REGNO

INNER JOIN MAINTAIN ON PLANE\_SERVICE.SERVICE\_ID = MAINTAIN.SERVICE\_ID

INNER JOIN EMPLOYEE2 ON MAINTAIN.SSN = EMPLOYEE2.SSN

WHERE OWNERP.OTYPE != 'Corporation'

OR

(EMPLOYEE2.SSN=MAINTAIN.SSN AND EMPLOYEE2.SHIFTTYPE='Day')

***Question 18:***

This query retrieves the distinct names of the owners who have their planes maintained by an employee. This query joins six tables - OWNERP, OWNS2, WORKS\_ON1, PLANETYPE2, MAINTAIN, and EMPLOYEE2. It joins the tables using the common columns, and then applies the DISTINCT keyword to return only the unique values of the owner names.

***Implementation:*** 

SELECT DISTINCT ONAME

FROM OWNERP, OWNS2, WORKS\_ON1, PLANETYPE2, MAINTAIN, EMPLOYEE2

WHERE OWNERP.ID = OWNS2.ID 

AND OWNS2.REGNO = PLANETYPE2.REGNO 

AND PLANETYPE2.MODEL = WORKS\_ON1.MODEL

AND WORKS\_ON1.SSN = EMPLOYEE2.SSN 

AND MAINTAIN.SSN = WORKS\_ON1.SSN 

AND MAINTAIN.SERVICE\_ID = PLANETYPE2.REGNO;

***Question 19:***

This SQL query retrieves the count of total planes available in each hangar location. It involves an INNER JOIN to combine data from tables HANGAR1 and AIRPLANE1 based on the REGNO field. The results are grouped by hangar location. The main challenge faced in this query was to ensure that the correct join condition is used to avoid missing data.

***Implementation:*** 

SELECT HANGAR1.LOCATIONS, COUNT(DISTINCT AIRPLANE1.REGNO) AS TOTAL\_PLANES

FROM HANGAR1 

INNER JOIN AIRPLANE1 ON HANGAR1.REGNO = AIRPLANE1.REGNO

GROUP BY HANGAR1.LOCATIONS;

***Question 20:*** 

This SQL query retrieves the count of planes for each model available in table PLANETYPE2. It involves a GROUP BY clause to group the results based on the model field.

***Implementation:*** 

SELECT MODEL, COUNT(\*) AS TOTAL\_PLANES FROM PLANETYPE2 

GROUP BY MODEL;

***Question 21:***

This SQL query retrieves the count of services for each plane available in table PLANE\_SERVICE. It involves an INNER JOIN to combine data from tables PLANE\_SERVICE and AIRPLANE1 based on the REGNO field. The results are grouped by plane REGNO.

***Implementation:*** 

SELECT PLANE\_SERVICE.REGNO, COUNT(\*) AS TOTAL\_SERVICES

FROM PLANE\_SERVICE INNER JOIN AIRPLANE1 

ON PLANE\_SERVICE.REGNO=AIRPLANE1.REGNO

GROUP BY PLANE\_SERVICE.REGNO;

***Question 22:***

This query selects the shift type and the average salary for each shift type from the EMPLOYEE2 table. The AVG() function is used to calculate the average salary for each shift type. The GROUP BY clause is used to group the results by shift type. There might be cases where some employees have a NULL value for their salary, which can cause incorrect results in the calculation of the average salary. Additionally, if there are multiple employees with the same name in the table, this could also lead to incorrect results.

***Implementation:*** 

SELECT SHIFTTYPE, AVG(SALARY) AS AVERAGE\_SALARY 

FROM EMPLOYEE2

GROUP BY SHIFTTYPE;

***Question 23:***

This query selects the ID of each owner and the total number of planes owned by that owner from the OWNS table. The INNER JOIN clause is used to join the OWNS table with the AIRPLANE1 table on the REGNO column, and the COUNT() function is used to count the number of planes owned by each owner. The GROUP BY clause is used to group the results by owner ID.

***Implementation:*** 

SELECT O.ID, COUNT(A.REGNO) AS TOTAL\_PLANES FROM OWNS O 

INNER JOIN AIRPLANE1 A ON A.REGNO=O.REGNO

GROUP BY O.ID;

***Question 24:***

This SQL query selects the license number and name of pilots from the PILOT1 table, and the count of authorized planes from the FLIES1 table, where each pilot's license number is matched with the corresponding pilot's license number in the FLIES1 table using a LEFT JOIN. The LEFT JOIN ensures that all pilots are included in the results, even if they don't have any authorized planes. The results are grouped by license number and name. No significant challenges are expected in executing this query as it is relatively simple.

***Implementation:***

SELECT PILOT1.LIC\_NUM, PILOT1.NAMEP, COUNT(FLIES1.LIC\_NUM) AS AUTHORIZED\_PLANES

FROM PILOT1

LEFT JOIN FLIES1 ON PILOT1.LIC\_NUM = FLIES1.LIC\_NUM

GROUP BY PILOT1.LIC\_NUM, PILOT1.NAMEP;

***Outputs:*** 

![](Aspose.Words.124f1b71-252b-4269-acd0-a964ec44cbbf.001.png)


