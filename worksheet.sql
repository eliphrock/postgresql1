CREATE TABLE companies
(
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);


INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;
--Find the employee and company names whose company has more than 15000 employees
CREATE TABLE employees
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees;

--find the company name, number of employee and average salary for every company

SELECT company, number_of_employees, (SELECT AVG (salary) FROM employees WHERE companies.company=employees.company) 
FROM companies;

--find the name of the companies,company ids,maximum and minimum salaries per company

SELECT company_id,company,(SELECT MAX(salary) FROM employees WHERE companies.company=employees.company ) AS max_salary,
                          (SELECT MIN(salary) FROM employees WHERE companies.company=employees.company ) AS min_salary
FROM companies;

-- select employee names which start with 'E'

SELECT name 
FROM employees
WHERE name LIKE 'E%';

--select employee names which end with "e"
SELECT name
FROM employees
WHERE name LIKE '%e';

--select employee names which start with "B" and with t
SELECT name
FROM employees
WHERE name LIKE 'B%t';

--select employee names which has 'a' in any position

SELECT name
FROM employees
WHERE name LIKE '%a%';

--select employee names which has 'e' and ' r' in any condition

SELECT name
FROM employees
WHERE name LIKE '%r%e%' OR name LIKE '%e%r%';


--Select state whose second character is 'e' and forth character is 'n'

SELECT state
FROM employees
WHERE state LIKE '_e_n%';

--select state whose last second character is 'i'

SELECT state
FROM employees
WHERE state LIKE '%i_';

--select states whose second character is 'e' and it has at least 6 characters

SELECT state
FROM employees
WHERE state LIKE '_e____%';

--select states which has "i" in any position after second character
SELECT state
FROM employees
WHERE state LIKE '__%i%';

--REGEXP_LIKE Condition ; You can use REgular Expressions with REGEXP_LIKE

CREATE TABLE words
(
word_id SMALLINT UNIQUE,
word varchar(50) NOT NULL,
number_of_letters SMALLINT
);
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
SELECT * FROM words;

--select words whose first character is 'h' last character 't' and second character is 'o' or 'a' or 'i'

SELECT word
FROM words 
WHERE word LIKE 'hot' OR word LIKE 'hat' OR word LIKE 'hit';


--2nd way
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'h[oai]t');

SELECT word
FROM words
WHERE REGEXP_LIKE(word,'hot|hat|hit');

-- select words whose first character is 'h' ,last character is 't' and second character is from 'a' to 'e'
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'h[a-e]t');


-- select words whose first character is 's' or 'a' or 'y'
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'^s|^a|^y');

SELECT word
FROM words
WHERE REGEXP_LIKE(word,'^[say]');
