/*QUESTION 25*/
/*This query will return all the owners whose names 
start with the letter 'B'. It is useful when we want to filter out a 
specific group of owners based on their name patterns. For instance, we can use 
this query to find out all the owners whose names start with a 
particular alphabet or group of alphabets.*/
SELECT * FROM OWNERP1 WHERE ONAME LIKE 'B%';

/*This query will return all the hangars whose capacity 
is greater than 50. It is useful when we want to find out all the hangars that have enough 
space to accommodate large airplanes. It can also be used to filter out hangars based on their 
capacity, making it easier to allocate them to specific types of planes.*/
SELECT * FROM HANGAR1 WHERE CAPACITY > 50;

/*This query will return the count of airplanes for each model 
along with their capacity and weight. It is useful when we want to analyze
the fleet of airplanes and their specifications. By grouping them based on their model, 
capacity, and weight, we can get a clearer picture of the planes owned by the company.*/
SELECT MODEL, CAPACITY, WEIGHT, COUNT(REGNO) AS NO_OF_PLANES FROM PLANETYPE2 GROUP BY MODEL, CAPACITY, WEIGHT;

/*This query returns a list of airplane owners and the models of 
airplanes they own. It is important because it allows for a better understanding of
ownership patterns and can be used for targeted marketing or sales efforts.*/
SELECT OWNERP.ONAME, PLANETYPE2.MODEL FROM OWNERP INNER JOIN OWNS ON OWNERP.ID = OWNS.ID INNER JOIN PLANETYPE2 ON OWNS.REGNO = PLANETYPE2.REGNO;