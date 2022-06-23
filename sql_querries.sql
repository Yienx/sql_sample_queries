use employees; 

-- using the IN operator to retrieve a set of names from the employees table. 

SELECT 
    *
FROM
    employees
WHERE
    first_name in ('Elvis', 'Denis'); -- returned 478 rows. 
    
-- The opposite can also be retrieved using the NOT IN operator

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Mark' , 'John', 'Jacob'); -- 1,000 rows returned. 
    
-- using wild cards LIKE - NOT LIKE
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%'); -- 690 rows contain names of employees who have the name mark in different variations ('mark', 'marko', etc)
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%'); -- 13 rows returned
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_'); -- Only 9 employees have 5 digits of employee_no.