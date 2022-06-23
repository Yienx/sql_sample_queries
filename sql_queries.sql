/* The database used here was gotten from The Business Intelligence Analyst Course 2022 on UDEMY 

This Employee Database contains Seven (7) tables: 
- Departments
- Departments_dup
- Dept_emp
- Dept_manager
- Employees
- Salaries
- Titles
*/


use employees; 

-- using the IN operator to retrieve a set of names from the employees table. 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Elvis', 'Denis'); -- returned 478 rows. 
    
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
    
-- TASK 
/* Extract the information about all department managers who were hired 
between the 1st of January 1990 and the 1st of January 1995. */

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

SELECT * FROM employees.dept_emp;

/*Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. */

SELECT 
    e.first_name, e.last_name, e.hire_date, d.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager d ON e.emp_no = d.emp_no;
    
    
-- JOINING THREE TABLES FROM THE EMPLOYEES DATABASE
-- TASK: 
/* Select all MANAGERS’ first and last name, hire date, job title, start date, and department name.*/

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON d.dept_no = dm.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;  -- 24 ROWS OF MANAGERS RETRIEVED.


-- TASK:
/* How many male and how many female managers do we have in the ‘employees’ database? */
SELECT 
    e.gender, COUNT(e.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender; -- THERE ARE 11 MALE MANAGERS AND 13 FEMALE MANAGERS.