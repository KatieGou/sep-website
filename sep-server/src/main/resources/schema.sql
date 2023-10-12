-- src/main/resources/schema.sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO users (username, password, enabled)
VALUES
  ('admin', 'admin', true),
  ('alice', 'hashed_password', true),
  ('mike', 'hashed_password', true);

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- Insert records for roles
INSERT INTO roles (name, description)
VALUES
    ('Admin', 'Administrative user with full access and permissions.'),
    ('User', 'Regular user with basic access and permissions.');

CREATE TABLE user_roles (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);
INSERT INTO user_roles (user_id, role_id)
VALUES
    (1, 1), -- admin user
    (2, 2); -- regular user


CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    experience_years INT,
    responsibilities TEXT,
    department_id INT,
    team_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
INSERT INTO employees (name, title, email, experience_years, department_id)
VALUES
    ('Alice', 'Financial Manager', 'alice@sep.se', 12,  1),
    ('Fredrik', 'Accountant', 'fredrik@sep.se', 2,  1),
    ('Sophia', 'Accountant', 'sophia@sep.se', 5,  1),
    ('Mike', 'Administration Department Manager', 'simon@sep.se', 20, 2),
    ('Simon', 'Senior HR Manager', 'simon@sep.se', 10,  2),
    ('Maria', 'HR Assistant', 'maria@sep.se', 5,  2),
    ('Janet', 'Senior Customer Service Manager', 'janet@sep.se', 15,  2),
    ('Sarah', 'Customer Service', 'sarah@sep.se', 1,  2),
    ('Sam', 'Customer Service', 'sam@sep.se', 3,  2),
    ('Judy', 'Customer Service', 'judy@sep.se', 2,  2),
    ('Carine', 'Customer Service', 'carine@sep.se', 3,  2),
    ('David', 'Marketing Officer', 'david@sep.se', 5,  2),
    ('Emma', 'Marketing Officer', 'emma@sep.se', 3,  2),
    ('Jack', 'Production Manager', 'jack@sep.se', 13,  3),
    ('Tobias', 'Photographer', 'tobik@sep.se', 4,  3),
    ('Magdalena', 'Photographer', 'magd@sep.se', 1,  3),
    ('Antony', 'Audio Specialist', 'anto@sep.se', 3,  3),
    ('Natalie', 'Services Department Manager', 'natalie@sep.se', 15,  4),
    ('Helen', 'Top Chef', 'helen@sep.se', 11,  4)
    ;

CREATE TABLE user_profile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    employee_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);



CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Insert records for the departments
INSERT INTO departments (name, description)
VALUES
    ('Financial', 'Manages project budget and finances.'),
    ('Administration', 'Handles administrative tasks and documentation.'),
    ('Production', 'Focuses on project production and development.'),
    ('Services', 'Provides project-related services and support.');

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    registration_date DATE
);

CREATE TABLE event_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    request_date DATE,
    description TEXT,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    senior_cs_id INT,
    financial_manager_id INT,
    admin_manager_id INT
);
