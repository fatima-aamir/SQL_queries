# i200654_i210739_Assignment_2_DB
## Question 1
In the ERD, according to the given case study we have the following ENTITIES:
1.	AIRPLANE
2.	PILOT
3.	HANGAR
4.	SERVICE
5.	EMPLOYEE
6.	PLANE_TYPE
7.	OWNER
8.	PERSON
9.	CORPORATION
The relationships, FLIES, is_of_type, OWNS, Stored_in, works_on, maintain and plane_service are all given in the case study. Plane_service and Maintain are identifying relationships as they are between Airplane and Service entities and Employee and Service entities respectively, and the entity SERVICE is a weak entity because it depends on the exitance of an airplane.
OWNER Is a union subclass of person and corporation because owner can be either of these, and since pilot and employees are person and not a corporation that is why they have a union relationship with PERSON entity.
1.	AIRPLANE and PILOT have a 1 to many relationship
2.	HANGAR and AIRPLANE have a 1 to many relationship too
3.	AIRPLANE and PLANE_TYPE have a 1 to many relationship too
4.	AIRPLANE and OWNER have a many to many relationship
5.	PLANE_TYPE and PILOT have many to many relationship 
6.	AIRPLANE and SERVICE have a 1 to many relationship 
7.	PLANE_TYPE and EMPLOYEE have a many to many relationship
8.	EMPLOYEE and SERVICE have many to many relationship
