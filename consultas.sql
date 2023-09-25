/*3*/
SELECT dept_name , COUNT(*) as num_repeticiones FROM instructor GROUP BY dept_name ORDER BY num_repeticiones DESC LIMIT 1;
/*4*/
SELECT room_number , COUNT(*) as num_repeticiones FROM section WHERE year=2018 GROUP BY room_number ORDER BY num_repeticiones DESC LIMIT 1;
/*5*/
SELECT course.course_id, title, dept_name FROM course LEFT JOIN section ON section.course_id=course.course_id WHERE sec_id IS NULL;
SELECT room_number , COUNT(*) as num_repeticiones FROM section WHERE year=2018 GROUP BY room_number ORDER BY num_repeticiones ASC LIMIT 1;
/*6*/
SELECT i.name, COUNT(t.id) as num_asignaturas FROM teaches t , instructor i WHERE t.id = i.id GROUP BY t.id ORDER BY num_asignaturas DESC;
/*7*/
SELECT CONCAT(e1.firstName, ' ', e1.lastName) as nombre_empleado, CONCAT(e2.firstName, ' ', e2.lastName) as nombre_jefe FROM employees e1 RIGHT JOIN employees e2 ON e1.reportsTo=e2.employeeNumber WHERE e1.firstName IS NOT NULL;
/*9*/
SELECT c.customerNumber, customerName, count(*) as num_pagos FROM customers c, payments p WHERE c.customerNumber = p.customerNumber GROUP BY c.customerNumber ORDER BY num_pagos DESC LIMIT 5;
/*10*/
SELECT productName, productLine, CASE WHEN productLine='Planes' THEN '2%' WHEN productLine='Classic Cars' THEN '5%' WHEN productLine='Motorcycles' THEN '4%' WHEN productLine='Ships' THEN '3%' ELSE '6%' END AS descuento FROM products;