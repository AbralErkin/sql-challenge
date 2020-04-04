
CREATE TABLE "Employees" (
    "Empo_No" int   NOT NULL,
    "Birth_Date" varchar(100)   NOT NULL,
    "First_Name" varchar(100)   NOT NULL,
    "Last_Name" varchar(100)   NOT NULL,
    "Gender" varchar(10)   NOT NULL,
    "Hired_Date" DATE NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Empo_No"
     )
);

CREATE TABLE "Titles" (
    "ID" SERIAL   NOT NULL,
    "Empo_No" int   NOT NULL,
    "Title" varchar(100)   NOT NULL,
    "From_Data" DATE NOT NULL,
    "To_Date" DATE NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Salaries" (
    "ID" SERIAL   NOT NULL,
    "Empo_No" int   NOT NULL,
    "Salaries" int   NOT NULL,
    "From_Date" DATE NOT NULL,
    "To_Data" DATE NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Department" (
    "Dept_No" varchar(30)   NOT NULL,
    "Dept_Name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "ID" SERIAL   NOT NULL,
    "Dept_No" varchar(30)   NOT NULL,
    "Empo_No" int   NOT NULL,
    "From_Date" DATE NOT NULL,
    "To_Date" DATE NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Dept_Empo" (
    "ID" SERIAL   NOT NULL,
    "Dept_No" varchar(50)   NOT NULL,
    "Empo_No" int   NOT NULL,
	"From_Date" DATE NOT NULL,
    "To_Date" DATE NOT NULL,
    CONSTRAINT "pk_Dept_Empo" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Empo_No" FOREIGN KEY("Empo_No")
REFERENCES "Employees" ("Empo_No");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Empo_No" FOREIGN KEY("Empo_No")
REFERENCES "Employees" ("Empo_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Department" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Empo_No" FOREIGN KEY("Empo_No")
REFERENCES "Employees" ("Empo_No");

ALTER TABLE "Dept_Empo" ADD CONSTRAINT "fk_Dept_Empo_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Department" ("Dept_No");

ALTER TABLE "Dept_Empo" ADD CONSTRAINT "fk_Dept_Empo_Empo_No" FOREIGN KEY("Empo_No")
REFERENCES "Employees" ("Empo_No");

