/*QUESTION 24*/
SELECT PILOT1.LIC_NUM, PILOT1.NAMEP, COUNT(FLIES1.LIC_NUM) AS AUTHORIZED_PLANES
FROM PILOT1
LEFT JOIN FLIES1 ON PILOT1.LIC_NUM = FLIES1.LIC_NUM
GROUP BY PILOT1.LIC_NUM,PILOT1.NAMEP