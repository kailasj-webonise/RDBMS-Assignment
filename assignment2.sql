
CREATE TABLE emp(emp_id int,emp_name char(20),emp_age int,emp_salary maxint,primary key(emp_id));

CREATE TABLE dept(dept_id int,dept_name char(20),budget maxint,manager_id int,primary key(dept_id),FOREIGN KEY (manager_id) REFRENCES emp(emp_id));




CREATE TABLE works (emp_id int,dept_id int,pct_time int,PRIMARY KEY(emp_id,dept_id),FOREIGN KEY (dept_id) REFRENCES dept(dept_id);

1.select e.emp_name,e.age from emp e,works w,dept d where e.emp_id=w.emp_id and w.dept_id=d.dept_id and d.dept_name='hardware'
union
 select e1.emp_name,e1.age from emp e1,works w1,dept d1 where e1.emp_id=w1.emp_id and w1.dept_id=d1.dept_id and d1.dept_name='software';

2.select dept.manager_id , GROUP_CONCAT(emp.name)from emp,works,dept WHERE emp.id=works.emp_id and works.dept_id= dept.id GROUP BY dept.manager_id;

4.select e.emp_name from emp e,works w,dept d where e.emp_id=w.emp_id and w.dept_id=d.dept_id and e.salary > all(select max (d2.budget) from dept d2 where d2.dept_id=d.dept_id);


5.select distinct d.manager_id from dept d where 100000 < all (select d2.budget from dept d2 where d2.manager_id=d.manager_id);

6.select e.emp_name from emp e,works w,dept d where e.emp_id=w.emp_id and w.dept_id=d.dept_id and budget=(select max (d2.budget) from dept d2);
