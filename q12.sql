/* QUESTION 12 */

SELECT PLANETYPE2.MODEL, AVG(SERVICE2.SHOURS)
FROM PLANETYPE2, SERVICE2, PLANE_SERVICE
WHERE PLANETYPE2.REGNO = PLANE_SERVICE.REGNO AND SERVICE2.SERVICE_ID = PLANE_SERVICE.SERVICE_ID
GROUP BY PLANETYPE2.MODEL