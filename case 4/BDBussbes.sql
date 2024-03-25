-- TABLE
CREATE TABLE Employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
position VARCHAR(50)
);
CREATE TABLE ProjectParticipants (
project_id INT,
employee_id INT,
FOREIGN KEY (project_id) REFERENCES Projects(project_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
start_date DATE,
end_date DATE,
status VARCHAR(20)
);
CREATE TABLE Resources (
resource_id INT PRIMARY KEY,
resource_name VARCHAR(50),
quantity INT
);
CREATE TABLE Tasks (
task_id INT PRIMARY KEY,
project_id INT,
task_name VARCHAR(50),
start_date DATE,
end_date DATE,
status VARCHAR(20),
FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
