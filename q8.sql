/* QUESTION 8 */
SELECT OWNERP1.ONAME, OWNERP1.PHONENO
FROM OWNERP1
INNER JOIN OWNS2
ON OWNERP1.ID = OWNS2.ID
WHERE OWNS2.PDATE BETWEEN DATEADD(MONTH, -1, GETDATE()) And GETDATE();