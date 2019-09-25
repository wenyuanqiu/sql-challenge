--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;

--List employees who were hired in 1987.
select * 
from employees
where extract(year from hire_date) = 1987;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
from dept_manager as dm
inner join departments as d
on dm.dept_no = d.dept_no
inner join employees as e
on e.emp_no = dm.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de 
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no;

--List all employees whose first name is "Duangkaew" and last names begin with "P."
select * from employees
where first_name = 'Duangkaew'
and last_name like 'P%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp as de
inner join employees as e
on e.emp_no = de.emp_no
inner join departments as dp
on dp.dept_no = de.dept_no
where de.dept_no in 
	(
	select d.dept_no 
	from departments as d
	where dept_name = 'Sales'
	);
	
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp as de
inner join employees as e
on e.emp_no = de.emp_no
inner join departments as dp
on dp.dept_no = de.dept_no
where de.dept_no in 
	(
	select d.dept_no 
	from departments as d
	where dept_name in ('Sales','Development')
	);
	
--In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(last_name), last_name 
from employees
group by last_name
order by count(last_name) asc;




		