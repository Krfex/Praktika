-- TABLE
CREATE TABLE Врачи (
ID INT PRIMARY KEY,
Имя VARCHAR(50),
Фамилия VARCHAR(50),
Квалификация VARCHAR(50),
Профиль VARCHAR(50),
Отделение VARCHAR(50)
);
CREATE TABLE Операции_и_лечения (
ID INT PRIMARY KEY,
Название_операции_или_лечения VARCHAR(50),
ID_врача INT,
FOREIGN KEY (ID_врача) REFERENCES Врачи(ID)
);
CREATE TABLE Приемы (
ID INT PRIMARY KEY,
 Дата_время_приема DATETIME,
ID_врача INT,
FOREIGN KEY (ID_врача) REFERENCES Врачи(ID)
);
CREATE TABLE Услуги (
ID INT PRIMARY KEY,
Название_услуги VARCHAR(50),
ID_врача INT,
FOREIGN KEY (ID_врача) REFERENCES Врачи(ID)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
