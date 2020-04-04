--1) List the following details of each employee: employee number, last name, first name,
--   gender, and salary.

Select "Employees"."Empo_No", "Employees"."Last_Name", "Employees"."First_Name", 
        "Employees"."Gender", "Salaries"."Salaries"
From "Employees"
join "Salaries" on "Employees"."Empo_No" = "Salaries"."Empo_No"
Order by "Employees"."Empo_No";

--2) List employees who were hired in 1986.
select * From "Employees" where "Hired_Date" Between '1986-01-01' and '1986-12-31'; 

--3) List the manager of each department with the following information: department number,
--   department name, the manager's employee number, last name, first name, and start and 
--   end employment dates.
Select "Dept_Manager"."Dept_No","Department"."Dept_Name", "Dept_Manager"."Empo_No",
        "Employees"."Last_Name","Employees"."First_Name", "Dept_Manager"."From_Date",
		"Dept_Manager"."To_Date"
From "Dept_Manager"
Join "Employees" on "Employees"."Empo_No" = "Dept_Manager"."Empo_No"
Join "Department" on "Department"."Dept_No" = "Dept_Manager"."Dept_No"
Order by "Dept_Manager"."Dept_No";

--4) List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.
Select "Dept_Empo"."Empo_No", "Employees"."Last_Name","Employees"."First_Name","Department"."Dept_Name"
From "Dept_Empo"
join "Department" on "Department"."Dept_No" = "Dept_Empo"."Dept_No"
join "Employees" on "Employees"."Empo_No" = "Dept_Empo"."Empo_No"
Order by "Dept_Empo"."Empo_No";

--5) List all employees whose first name is "Hercules" and last names begin with "B."
Select "Employees"."Last_Name","Employees"."First_Name" From "Employees"
Where "Employees"."First_Name" = 'Hercules' and "Employees"."Last_Name" Like 'B%';

--6) List all employees in the Sales department, including their employee number, last name, 
--   first name, and department name.
Select "Employees"."Empo_No","Employees"."Last_Name","Employees"."First_Name", "Department"."Dept_Name"
From "Employees"
Join "Dept_Empo" on "Dept_Empo"."Empo_No" = "Employees"."Empo_No"
Join "Department" on "Department"."Dept_No" = "Dept_Empo"."Dept_No"
Where "Department"."Dept_Name" = 'Sales'
Order by "Employees"."Empo_No";

--7) List all employees in the Sales and Development departments, including their employee number, 
--   last name, first name, and department name.
Select "Employees"."Empo_No","Employees"."Last_Name","Employees"."First_Name", "Department"."Dept_Name"
From "Employees"
Join "Dept_Empo" on "Dept_Empo"."Empo_No" = "Employees"."Empo_No"
Join "Department" on "Department"."Dept_No" = "Dept_Empo"."Dept_No"
Where "Department"."Dept_Name" = 'Sales' or "Department"."Dept_Name" = 'Development'
Order by "Employees"."Empo_No";

--8) In descending order, list the frequency count of employee last names, i.e., how many employees 
--   share each last name.
Select "Employees"."Last_Name", Count ("Employees"."Last_Name")
From "Employees"
Group by "Employees"."Last_Name";