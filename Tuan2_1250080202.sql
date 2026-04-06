CREATE TABLE REGIONS (
  region_id   NUMBER PRIMARY KEY,
  region_name VARCHAR2(25)
);

CREATE TABLE COUNTRIES (
  country_id   CHAR(2) PRIMARY KEY,
  country_name VARCHAR2(40),
  region_id    NUMBER REFERENCES REGIONS(region_id)
);

CREATE TABLE LOCATIONS (
  location_id    NUMBER(4) PRIMARY KEY,
  street_address VARCHAR2(40),
  postal_code    VARCHAR2(12),
  city           VARCHAR2(30),
  state_province VARCHAR2(25),
  country_id     CHAR(2) REFERENCES COUNTRIES(country_id)
);

CREATE TABLE DEPARTMENTS (
  department_id   NUMBER(4) PRIMARY KEY,
  department_name VARCHAR2(30),
  manager_id      NUMBER(6),
  location_id     NUMBER(4) REFERENCES LOCATIONS(location_id)
);

CREATE TABLE JOBS (
  job_id     VARCHAR2(10) PRIMARY KEY,
  job_title  VARCHAR2(35),
  min_salary NUMBER(6),
  max_salary NUMBER(6)
);

CREATE TABLE EMPLOYEES (
  employee_id    NUMBER(6) PRIMARY KEY,
  first_name     VARCHAR2(20),
  last_name      VARCHAR2(25),
  email          VARCHAR2(25),
  phone_number   VARCHAR2(20),
  hire_date      DATE,
  job_id         VARCHAR2(10) REFERENCES JOBS(job_id),
  salary         NUMBER(8,2),
  commission_pct NUMBER(2,2),
  manager_id     NUMBER(6),
  department_id  NUMBER(4) REFERENCES DEPARTMENTS(department_id)
);

CREATE TABLE JOB_HISTORY (
  employee_id   NUMBER(6),
  start_date    DATE,
  end_date      DATE,
  job_id        VARCHAR2(10) REFERENCES JOBS(job_id),
  department_id NUMBER(4) REFERENCES DEPARTMENTS(department_id),
  PRIMARY KEY (employee_id, start_date)
);


-- REGIONS
INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asia');
INSERT INTO regions VALUES (4, 'Middle East and Africa');
COMMIT;

-- COUNTRIES
INSERT INTO countries VALUES ('US', 'United States of America', 2);
INSERT INTO countries VALUES ('UK', 'United Kingdom', 1);
INSERT INTO countries VALUES ('CA', 'Canada', 2);
INSERT INTO countries VALUES ('DE', 'Germany', 1);
INSERT INTO countries VALUES ('FR', 'France', 1);
INSERT INTO countries VALUES ('AU', 'Australia', 3);
INSERT INTO countries VALUES ('JP', 'Japan', 3);
INSERT INTO countries VALUES ('IN', 'India', 3);
INSERT INTO countries VALUES ('CN', 'China', 3);
INSERT INTO countries VALUES ('BR', 'Brazil', 2);
COMMIT;

-- LOCATIONS
INSERT INTO locations VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO locations VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO locations VALUES (1800, '460 Bloor St W', 'M4W 3L4', 'Toronto', 'Ontario', 'CA');
INSERT INTO locations VALUES (2400, '8204 Arthur St', NULL, 'London', NULL, 'UK');
INSERT INTO locations VALUES (2500, 'Magdalen Centre', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
INSERT INTO locations VALUES (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
COMMIT;

-- DEPARTMENTS
INSERT INTO departments VALUES (10,  'Administration',      200, 1700);
INSERT INTO departments VALUES (20,  'Marketing',           201, 1800);
INSERT INTO departments VALUES (50,  'Shipping',            124, 1500);
INSERT INTO departments VALUES (60,  'IT',                  103, 1400);
INSERT INTO departments VALUES (80,  'Sales',               145, 2500);
INSERT INTO departments VALUES (90,  'Executive',           100, 1700);
INSERT INTO departments VALUES (100, 'Finance',             108, 1700);
INSERT INTO departments VALUES (110, 'Accounting',          205, 1700);
INSERT INTO departments VALUES (120, 'Treasury',            NULL, 1700);
INSERT INTO departments VALUES (130, 'Corporate Tax',       NULL, 1700);
INSERT INTO departments VALUES (500, 'Temp Department',     NULL, 1700);
COMMIT;

-- JOBS
INSERT INTO jobs VALUES ('AD_PRES',  'President',               20000, 40000);
INSERT INTO jobs VALUES ('AD_VP',    'Administration Vice President', 15000, 30000);
INSERT INTO jobs VALUES ('IT_PROG',  'Programmer',               4000,  10000);
INSERT INTO jobs VALUES ('ST_MAN',   'Stock Manager',            5500,  8500);
INSERT INTO jobs VALUES ('ST_CLERK', 'Stock Clerk',              2000,  5000);
INSERT INTO jobs VALUES ('SA_REP',   'Sales Representative',     6000,  12000);
INSERT INTO jobs VALUES ('SA_MAN',   'Sales Manager',            10000, 20000);
INSERT INTO jobs VALUES ('FI_ACCOUNT','Finance Account',         4200,  9000);
INSERT INTO jobs VALUES ('AC_MGR',   'Accounting Manager',       8200,  16000);
INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',       4200,  9000);
COMMIT;

-- EMPLOYEES
INSERT INTO employees VALUES (3,'John','Smith','JSMITH3','515.123.0003',
TO_DATE('01/01/2000','DD/MM/YYYY'),'ST_CLERK',3000,NULL,124,50);
INSERT INTO employees VALUES (100,'Steven','King','SKING','515.123.4567',TO_DATE('17/06/1987','DD/MM/YYYY'),'AD_PRES',24000,NULL,NULL,90);
INSERT INTO employees VALUES (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',TO_DATE('21/09/1989','DD/MM/YYYY'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES (102,'Lex','De Haan','LDEHAAN','515.123.4569',TO_DATE('13/01/1993','DD/MM/YYYY'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES (103,'Alexander','Hunold','AHUNOLD','590.423.4567',TO_DATE('03/01/1990','DD/MM/YYYY'),'IT_PROG',9000,NULL,102,60);
INSERT INTO employees VALUES (104,'Bruce','Ernst','BERNST','590.423.4568',TO_DATE('21/05/1991','DD/MM/YYYY'),'IT_PROG',6000,NULL,103,60);
INSERT INTO employees VALUES (105,'David','Austin','DAUSTIN','590.423.4569',TO_DATE('25/06/1997','DD/MM/YYYY'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES (106,'Valli','Pataballa','VPATABAL','590.423.4560',TO_DATE('05/02/1998','DD/MM/YYYY'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES (107,'Diana','Lorentz','DLORENTZ','590.423.5567',TO_DATE('07/02/1999','DD/MM/YYYY'),'IT_PROG',4200,NULL,103,60);
INSERT INTO employees VALUES (108,'Nancy','Greenberg','NGREENBE','515.124.4569',TO_DATE('17/08/1994','DD/MM/YYYY'),'FI_ACCOUNT',12000,NULL,101,100);
INSERT INTO employees VALUES (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',TO_DATE('16/11/1999','DD/MM/YYYY'),'ST_MAN',5800,NULL,100,50);
INSERT INTO employees VALUES (125,'Julia','Nayer','JNAYER','650.124.1214',TO_DATE('16/07/1997','DD/MM/YYYY'),'ST_CLERK',3200,NULL,124,50);
INSERT INTO employees VALUES (126,'Irene','Mikkileni','IMIKKILE','650.124.1224',TO_DATE('28/09/1998','DD/MM/YYYY'),'ST_CLERK',2700,NULL,124,50);
INSERT INTO employees VALUES (145,'John','Russell','JRUSSEL','011.44.1344.429268',TO_DATE('01/10/1996','DD/MM/YYYY'),'SA_MAN',14000,0.4,100,80);
INSERT INTO employees VALUES (146,'Karen','Partners','KPARTNER','011.44.1344.467268',TO_DATE('05/01/1997','DD/MM/YYYY'),'SA_MAN',13500,0.3,100,80);
INSERT INTO employees VALUES (150,'Peter','Tucker','PTUCKER','011.44.1344.129268',TO_DATE('30/01/1997','DD/MM/YYYY'),'SA_REP',10000,0.3,145,80);
INSERT INTO employees VALUES (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',TO_DATE('24/03/1997','DD/MM/YYYY'),'SA_REP',9500,0.25,145,80);
INSERT INTO employees VALUES (200,'Jennifer','Whalen','JWHALEN','515.123.4444',TO_DATE('17/09/1987','DD/MM/YYYY'),'ST_CLERK',4400,NULL,101,10);
INSERT INTO employees VALUES (201,'Michael','Hartstein','MHARTSTE','515.123.5555',TO_DATE('17/02/1996','DD/MM/YYYY'),'SA_MAN',13000,NULL,100,20);
INSERT INTO employees VALUES (205,'Shelley','Higgins','SHIGGINS','515.123.8080',TO_DATE('07/06/1994','DD/MM/YYYY'),'AC_MGR',12000,NULL,101,110);
INSERT INTO employees VALUES (206,'William','Gietz','WGIETZ','515.123.8181',TO_DATE('07/06/1994','DD/MM/YYYY'),'AC_ACCOUNT',8300,NULL,205,110);
INSERT INTO employees VALUES (207,'John','Davies','JDAVIES','515.123.9999',
TO_DATE('15/03/1998','DD/MM/YYYY'),'ST_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES (208,'Smith','Anna','ASMITH','515.123.1111',
TO_DATE('20/04/1998','DD/MM/YYYY'),'ST_CLERK',3000,NULL,124,50);
INSERT INTO employees VALUES (209,'Brown','James','JBROWN','515.123.2222',
TO_DATE('10/06/1999','DD/MM/YYYY'),'IT_PROG',5000,NULL,103,60);
INSERT INTO employees VALUES (211,'John','Zlotkey','JZLOTKEY','515.123.3333',
TO_DATE('29/01/2000','DD/MM/YYYY'),'SA_REP',10500,0.2,145,80);
INSERT INTO employees VALUES (212,'Peter','Rosales','PROSALES','515.123.4444',
TO_DATE('15/03/2000','DD/MM/YYYY'),'SA_REP',9000,0.15,145,80);
INSERT INTO employees VALUES (213,'Tom','Brown','TBROWN','515.123.5551',
TO_DATE('01/01/2001','DD/MM/YYYY'),'ST_CLERK',800,NULL,124,50);
INSERT INTO employees VALUES (214,'Anna','White','AWHITE','515.123.5552',
TO_DATE('01/01/2001','DD/MM/YYYY'),'ST_CLERK',850,NULL,124,50);
INSERT INTO employees VALUES (215,'Peter','Black','PBLACK','515.123.5553',
TO_DATE('01/01/2001','DD/MM/YYYY'),'ST_CLERK',750,NULL,124,50);
COMMIT;



-- JOB_HISTORY
INSERT INTO job_history VALUES (101,TO_DATE('21/09/1989','DD/MM/YYYY'),TO_DATE('27/10/1993','DD/MM/YYYY'),'AC_ACCOUNT',110);
INSERT INTO job_history VALUES (101,TO_DATE('28/10/1993','DD/MM/YYYY'),TO_DATE('15/03/1997','DD/MM/YYYY'),'AC_MGR',110);
INSERT INTO job_history VALUES (102,TO_DATE('13/01/1993','DD/MM/YYYY'),TO_DATE('24/07/1998','DD/MM/YYYY'),'IT_PROG',60);
INSERT INTO job_history VALUES (103,TO_DATE('28/09/1993','DD/MM/YYYY'),TO_DATE('19/02/1999','DD/MM/YYYY'),'AD_VP',90);
INSERT INTO job_history VALUES (200,TO_DATE('17/09/1987','DD/MM/YYYY'),TO_DATE('17/06/1993','DD/MM/YYYY'),'AC_ACCOUNT',90);
COMMIT;

-- câu 1
SELECT last_name, salary
FROM employees
WHERE salary > 12000;
--câu 2
SELECT last_name, salary
FROM employees
WHERE salary < 5000 OR salary > 12000;
--câu 3
SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('20/02/1998','DD/MM/YYYY')
AND TO_DATE('01/05/1998','DD/MM/YYYY')
ORDER BY hire_date ASC;
--câu 4
SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name ASC;
--câu 5
SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1994';
-- câu 6
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;
-- câu 7
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;
--câu 8
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';
--câu 9 
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';
--câu 10 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);
--câu 11
SELECT employee_id,
last_name,
ROUND(salary * 1.15, 0) AS "New Salary"
FROM employees;
--câu 12
SELECT INITCAP(last_name) AS "Ten Nhan Vien",
LENGTH(last_name) AS "Chieu Dai"
FROM employees
WHERE SUBSTR(last_name, 1, 1) IN ('J','A','L','M')
ORDER BY last_name ASC;
--câu 13
SELECT last_name,
TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "So Thang Lam Viec"
FROM employees
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date) ASC;
--câu 14
SELECT last_name || ' earns '
|| TO_CHAR(salary, '$99,999') || ' monthly but wants '
|| TO_CHAR(salary*3, '$99,999') AS "Dream Salaries"
FROM employees;
--câu 15
SELECT last_name,
NVL(TO_CHAR(commission_pct), 'No commission') AS "Commission"
FROM employees;
--câu 16
SELECT job_id,
DECODE(job_id,
'AD_PRES',  'A',
'ST_MAN',   'B',
'IT_PROG',  'C',
'SA_REP',   'D',
'ST_CLERK', 'E',
'0') AS "GRADE"
FROM employees;
--câu 17
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND UPPER(l.city) = 'TORONTO';
--câu 18
SELECT e.employee_id AS "Ma NV",
e.last_name   AS "Ten NV",
m.employee_id AS "Ma Quan Ly",
m.last_name   AS "Ten Quan Ly"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;
--câu 19
SELECT e1.last_name AS "Nhan Vien 1",
e2.last_name AS "Nhan Vien 2",
e1.department_id  AS "Phong Ban"
FROM employees e1, employees e2
WHERE e1.department_id = e2.department_id
AND e1.employee_id < e2.employee_id
ORDER BY e1.department_id, e1.last_name;
--câu 20
SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
 FROM employees
WHERE last_name = 'Davies');
--câu 21
SELECT e.last_name AS "Nhan Vien",
       e.hire_date AS "Ngay Vao",
       m.last_name AS "Quan Ly",
       m.hire_date AS "Quan Ly Vao"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;
--câu 22
SELECT job_id,
       MIN(salary)          AS "Luong Thap Nhat",
       MAX(salary)          AS "Luong Cao Nhat",
       ROUND(AVG(salary),2) AS "Luong Trung Binh",
       SUM(salary)          AS "Tong Luong"
FROM employees
GROUP BY job_id
ORDER BY job_id;
--câu 23 A
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS "So Nhan Vien"
FROM departments d LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;
--câu 23B
SELECT COUNT(*) AS "Tong NV",
  SUM(CASE WHEN TO_CHAR(hire_date,'YYYY')='1995' THEN 1 ELSE 0 END) AS "Nam 1995",
  SUM(CASE WHEN TO_CHAR(hire_date,'YYYY')='1996' THEN 1 ELSE 0 END) AS "Nam 1996",
  SUM(CASE WHEN TO_CHAR(hire_date,'YYYY')='1997' THEN 1 ELSE 0 END) AS "Nam 1997",
  SUM(CASE WHEN TO_CHAR(hire_date,'YYYY')='1998' THEN 1 ELSE 0 END) AS "Nam 1998"
FROM employees;
--câu 24
SELECT MAX(MIN(salary)) AS "Luong cao nhat trong cac luong thap nhat"
FROM employees
GROUP BY department_id;
--câu 25
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
                       FROM employees
                       WHERE last_name = 'Zlotkey')
AND last_name <> 'Zlotkey';
--câu 26
SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id = 1700);
--câu 27
SELECT last_name, manager_id
FROM employees
WHERE manager_id IN (SELECT employee_id
                     FROM employees
                     WHERE last_name = 'King');
--câu 28
SELECT last_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id
                      FROM employees
                      WHERE last_name LIKE '%n');
--câu 29
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS "So NV"
FROM departments d LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3
ORDER BY d.department_id;
--câu 30
SELECT department_id, COUNT(*) AS "So Nhan Vien", 'Dong nhat' AS "Loai"
FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees GROUP BY department_id)
UNION ALL
SELECT department_id, COUNT(*), 'It nhat'
FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM employees GROUP BY department_id);
--câu 31
SELECT last_name, hire_date,
       TO_CHAR(hire_date,'Day') AS "Thu trong tuan"
FROM employees
WHERE TO_CHAR(hire_date,'Day') = (
  SELECT TO_CHAR(hire_date,'Day')
  FROM employees
  GROUP BY TO_CHAR(hire_date,'Day')
  HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM employees
    GROUP BY TO_CHAR(hire_date,'Day')
  )
);
--câu 32
SELECT last_name, salary
FROM (
  SELECT last_name, salary
  FROM employees
  ORDER BY salary DESC
)
WHERE ROWNUM <= 3;
--câu 33
SELECT e.last_name, e.department_id
FROM employees e,
     departments d,
     locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND UPPER(l.state_province) = 'CALIFORNIA';

--câu 34
-- Kiem tra truoc
SELECT employee_id, last_name FROM employees WHERE employee_id = 3;

-- Cap nhat
UPDATE employees
SET last_name = 'Drexler'
WHERE employee_id = 3;
COMMIT;

-- Xac nhan sau khi cap nhat
SELECT employee_id, last_name FROM employees WHERE employee_id = 3;
--câu 35
SELECT e1.last_name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary < (SELECT AVG(e2.salary)
                   FROM employees e2
                   WHERE e2.department_id = e1.department_id)
ORDER BY e1.department_id;
--câu 36
-- Kiem tra truoc
SELECT employee_id, last_name, salary
FROM employees
WHERE salary < 900;

-- Tang luong
UPDATE employees
SET salary = salary + 100
WHERE salary < 900;
COMMIT;
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id IN (213, 214, 215);

--câu 37
-- Kiem tra truoc
SELECT COUNT(*) FROM employees WHERE department_id = 500;

-- Khong co nhan vien thi xoa luon
DELETE FROM departments WHERE department_id = 500;
COMMIT;

-- Xac nhan
SELECT * FROM departments WHERE department_id = 500;

-- câu 38
-- Kiem tra truoc
SELECT department_id, department_name FROM departments
WHERE department_id NOT IN (
  SELECT DISTINCT department_id FROM employees
  WHERE department_id IS NOT NULL
);

-- Thuc hien xoa
DELETE FROM departments d
WHERE NOT EXISTS (
  SELECT 1 FROM employees e
  WHERE e.department_id = d.department_id
);
COMMIT;
SELECT department_id, department_name
FROM departments
ORDER BY department_id;