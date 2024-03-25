================================================================================================
=======================================Идея базы данных=========================================
================================================================================================
Для создания базы данных и заполнения деталями проекта, я выберу бизнес модель по разработке мобильных приложений. Основываясь на этой модели, выделим следующие ключевые процессы проекта:

Создание спецификации проекта
Разработка дизайна приложения
Программирование и тестирование приложения
Запуск и маркетинг приложения
Поддержка и обновление приложения
Теперь создадим базу данных для управления проектом по разработке мобильного приложения:

таблица: Таблица "Проекты":

project_id (идентификатор проекта)
project_name (название проекта)
start_date (дата начала проекта)
end_date (дата окончания проекта)
status (статус проекта)

Таблица "Задачи":

task_id (идентификатор задачи)
project_id (связь с таблицей "Проекты")
task_name (название задачи)
start_date (дата начала задачи)
end_date (дата окончания задачи)
status (статус задачи)

Таблица "Сотрудники":

employee_id (идентификатор сотрудника)
employee_name (имя сотрудника)
position (должность)

Таблица "Ресурсы":

resource_id (идентификатор ресурса)
resource_name (название ресурса)
quantity (количество ресурса)

Таблица "Участники проекта":

project_id (связь с таблицей "Проекты")
employee_id (связь с таблицей "Сотрудники")

================================================================================================
====================================Создание базы данных========================================
================================================================================================

CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
start_date DATE,
end_date DATE,
status VARCHAR(20)
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

CREATE TABLE Employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
position VARCHAR(50)
);

CREATE TABLE Resources (
resource_id INT PRIMARY KEY,
resource_name VARCHAR(50),
quantity INT
);

CREATE TABLE ProjectParticipants (
project_id INT,
employee_id INT,
FOREIGN KEY (project_id) REFERENCES Projects(project_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

================================================================================================
==============================Заполнение данными базы данных====================================
================================================================================================

INSERT INTO Projects (project_id, project_name, start_date, end_date, status)
VALUES
(1, 'Project A', '2022-01-01', '2022-06-30', 'In progress'),
(2, 'Project B', '2022-03-15', '2022-08-31', 'Pending'),
(3, 'Project C', '2022-05-01', '2022-10-31', 'Complete');

INSERT INTO Tasks (task_id, project_id, task_name, start_date, end_date, status)
VALUES
(1, 1, 'Task 1', '2022-01-05', '2022-02-28', 'In progress'),
(2, 1, 'Task 2', '2022-03-01', '2022-04-30', 'Pending'),
(3, 2, 'Task 1', '2022-03-20', '2022-05-31', 'Complete');

INSERT INTO Employees (employee_id, employee_name, position)
VALUES
(1, 'John Doe', 'Manager'),
(2, 'Jane Smith', 'Developer'),
(3, 'Mike Johnson', 'Designer');

INSERT INTO Resources (resource_id, resource_name, quantity)
VALUES
(1, 'Computers', 20),
(2, 'Printers', 5),
(3, 'Office Supplies', 100);

INSERT INTO ProjectParticipants (project_id, employee_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

===============================================================================================================
=========================================Проверка БД===========================================================
===============================================================================================================

Вывести все проекты со статусом 'In progress':
SELECT \* FROM Projects WHERE status = 'In progress';

Вывести все задачи для проекта с id = 1:
SELECT \* FROM Tasks WHERE project_id = 1;

Вывести информацию о сотрудниках, участвующих в проекте с id = 1:
SELECT Employees.employee_name, Employees.position
FROM Employees
JOIN ProjectParticipants ON Employees.employee_id = ProjectParticipants.employee_id
WHERE ProjectParticipants.project_id = 1;

Вывести список ресурсов, где количество больше 10:
SELECT \* FROM Resources WHERE quantity > 10;

Это примеры тестовых проверочных запросов, которые могут быть использованы для проверки данных в базе данных.
