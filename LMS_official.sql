create database lms1;
use  lms1;


CREATE TABLE User_Details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    password VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20),
    verified BOOLEAN,
    creator_stamp TIMESTAMP,
    creator_user int
);
-- --------

CREATE TABLE Hired_Candidate (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    EmailId VARCHAR(50) UNIQUE NOT NULL,
    Hired_City VARCHAR(50),
    Degree VARCHAR(50),
    Hired_Date DATE,
    Mobile_Number VARCHAR(20),
    Permanent_Pincode VARCHAR(10),
    Hired_Lab VARCHAR(50),
    Attitude VARCHAR(255),
    Communication_Remark VARCHAR(255),
    Knowledge_Remark VARCHAR(255),
    Aggregate_Remark VARCHAR(255),
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT
   
);
ALTER TABLE Hired_Candidate
ADD FOREIGN KEY (Creator_User) references User_Details (id);
-- ------------
CREATE TABLE Fellowship_Candidate (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CIC_ID VARCHAR(20),
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    EmailId VARCHAR(255) UNIQUE NOT NULL,
    Hired_City VARCHAR(50),
    Degree VARCHAR(50),
    Hired_Date DATE,
    Mobile_Number VARCHAR(20),
    Permanent_Pincode VARCHAR(10),
    Hired_Lab VARCHAR(50),
    Attitude VARCHAR(255),
    Communication_Remark VARCHAR(255),
    Knowledge_Remark VARCHAR(255),
    Aggregate_Remark VARCHAR(255),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT,
    Birth_Date DATE,
    Is_Birth_Date_Verified BOOLEAN,
    Parent_Name VARCHAR(100),
    Parent_Occupation VARCHAR(50),
    Parents_Mobile_Number VARCHAR(20),
    Parents_Annual_Salary DECIMAL(10,2),
    Local_Address VARCHAR(255),
    Permanent_Address VARCHAR(255),
    Photo_Path VARCHAR(255),
    Joining_Date DATE,
    Candidate_Status VARCHAR(20),
    Personal_Information TEXT,
    Bank_Information TEXT,
    Educational_Information TEXT,
    Document_Status VARCHAR(20),
    Remark TEXT
    );
alter table Fellowship_Candidate 
add foreign key(Creator_User) references User_Details (id);

-- -------------
CREATE TABLE Candidate_Bank_Details (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Candidate_Id INT,
    Name VARCHAR(50),
    Account_Number VARCHAR(20),
    Is_Account_Num_Verified BOOLEAN,
    Ifsc_Code VARCHAR(20),
    Is_Ifsc_Code_Verified BOOLEAN,
    Pan_Number VARCHAR(20),
    Is_Pan_Number_Verified BOOLEAN,
    Aadhaar_Num VARCHAR(20),
    Is_Aadhaar_Num_Verified BOOLEAN,
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User Varchar(255),
    foreign key (Candidate_Id) references User_Details (id)
);
alter table Candidate_Bank_Details
modify Creator_User int;

-- ----------------
CREATE TABLE Candidate_Qualification (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Candidate_Id INT,
    Diploma VARCHAR(50),
    Degree_Name VARCHAR(50),
    Is_Degree_Name_Verified BOOLEAN,
    Employee_Discipline VARCHAR(50),
    Is_Employee_Discipline_Verified BOOLEAN,
    Passing_Year INT,
    Is_Passing_Year_Verified BOOLEAN,
    Aggr_Per DECIMAL(5,2),
    Is_Aggr_Per_Verified BOOLEAN,
    Final_Year_Per DECIMAL(5,2),
    Is_Final_Year_Per_Verified BOOLEAN,
    Training_Institute VARCHAR(100),
    Is_Training_Institute_Verified BOOLEAN,
    Training_Duration_Month INT,
    Is_Training_Duration_Month_Verified BOOLEAN,
    Other_Training VARCHAR(255),
    Is_Other_Training_Verified BOOLEAN,
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User int
);
alter table Candidate_Qualification
add foreign key(Candidate_Id) references User_Details (id);
-- ----------------
CREATE TABLE Candidate_Documents (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Candidate_Id INT,
    Doc_Type VARCHAR(50),
    Doc_Path VARCHAR(255),
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User int,
    FOREIGN KEY (Candidate_Id) REFERENCES User_Details(id)
);

-- ---------------
CREATE TABLE Company (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Location VARCHAR(50),
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT,
    foreign key (Creator_User) references User_Details(id)
    
);
-- ------
CREATE TABLE Maker_Program (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Program_Name VARCHAR(100) NOT NULL,
    Program_Type VARCHAR(50),
    Program_Link VARCHAR(255),
    Tech_Stack_Id INT,
    Tech_Type_Id INT,
    Is_Program_Approved BOOLEAN,
    Description TEXT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User int
);
-- -----
ALTER TABLE Maker_Program
ADD FOREIGN KEY (Tech_Stack_Id) REFERENCES Tech_Stack(id);

ALTER TABLE Maker_Program
ADD FOREIGN KEY (Tech_Type_Id) REFERENCES Tech_Type(id);
-- ------
DESC Maker_Program;

-- --------------
CREATE TABLE App_Parameters (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Key_Type VARCHAR(50),
    Key_Value VARCHAR(255),
    Key_Text TEXT,
    Cur_Status VARCHAR(20),
    Last_Upd_User INT,
    Last_Upd_Stamp TIMESTAMP,
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT,
    Seq_Num INT
);
ALTER TABLE App_Parameters
ADD FOREIGN KEY (Creator_User) REFERENCES User_Details(id);

-- ---------
CREATE TABLE Mentor (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Mentor_Type VARCHAR(50),
    Lab_Id INT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT
);
-- -----
ALTER TABLE Mentor
ADD FOREIGN KEY (Lab_Id) REFERENCES Lab(Id);


-- -----------
CREATE TABLE Mentor_Ideation_Map (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Parent_Mentor_Id INT,
    Mentor_Id INT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT
);
ALTER TABLE Mentor_Ideation_Map
ADD FOREIGN KEY (Parent_Mentor_Id) REFERENCES Mentor(Id);

ALTER TABLE Mentor_Ideation_Map
ADD FOREIGN KEY (Mentor_Id) REFERENCES Mentor(Id);

-- ---------

CREATE TABLE Mentor_Tech_Stack (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Mentor_Id INT,
    Tech_Stack_Id INT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT
);
desc Mentor_Tech_Stack;
ALTER TABLE Mentor_Tech_Stack
ADD FOREIGN KEY (Mentor_Id) REFERENCES Mentor(Id),
ADD FOREIGN KEY (Tech_Stack_Id) REFERENCES Mentor(Id);
-- --------------
CREATE TABLE Tech_Stack (
    Id INT ,
    Tech_Name VARCHAR(50) NOT NULL,
    Image_Path VARCHAR(255),
    Framework VARCHAR(50),
    Cur_Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT,
     foreign key (Creator_User) references User_Details(id)
);

-- ---------
CREATE TABLE Tech_Type (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Type_Name VARCHAR(50) NOT NULL,
    Cur_Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT
);
ALTER TABLE Tech_Type
ADD FOREIGN KEY (Creator_User) REFERENCES User_Details(id);

-- --------
CREATE TABLE Lab (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(50),
    Address VARCHAR(255),
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User INT,
    foreign key (Creator_User) references User_Details(id))
    ;
    

-- ----------
CREATE TABLE Lab_Threshold (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Lab_Id INT,
    Lab_Capacity INT,
    Lead_Threshold INT,
    Ideation_Engg_Threshold INT,
    Buddy_Engg_Threshold INT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User VARCHAR(255)
);
desc Lab_Threshold;
ALTER TABLE Lab_Threshold
modify Creator_User int;
ALTER TABLE Lab_Threshold
ADD FOREIGN KEY (Lab_Id) REFERENCES Lab(id);
-- -------------
CREATE TABLE Company_Requirement (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Company_Id INT,
    Requested_Month DATE,
    City VARCHAR(50),
    Is_Doc_Verification BOOLEAN,
    Requirement_Doc_Path VARCHAR(255),
    No_of_Engg INT,
    Tech_Stack_Id INT,
    Tech_Type_Id INT,
    Maker_Program_Id INT,
    Lead_Id INT,
    Ideation_Engg_Id INT,
    Buddy_Engg_Id INT,
    Special_Remark TEXT,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User VARCHAR(255)
);
ALTER TABLE Company_Requirement
modify Creator_User int;
-- ---
ALTER TABLE Company_Requirement
ADD FOREIGN KEY (Company_Id) REFERENCES Company(Id),
ADD FOREIGN KEY (Tech_Stack_Id) REFERENCES Tech_Stack(id),
ADD FOREIGN KEY (Tech_Type_Id) REFERENCES Tech_Type(id),
ADD FOREIGN KEY (Maker_Program_Id) REFERENCES Maker_Program(id),
ADD FOREIGN KEY (Lead_Id) REFERENCES Mentor(id),
ADD FOREIGN KEY (Ideation_Engg_Id) REFERENCES Mentor_Ideation_Map(id),
ADD FOREIGN KEY (Buddy_Engg_Id) REFERENCES Mentor(id);

-- --------------
CREATE TABLE Candidate_Stack_Assignment (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Requirement_Id INT,
    Candidate_Id INT,
    Assign_Date DATE,
    Complete_Date DATE,
    Status VARCHAR(20),
    Creator_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Creator_User int
);
ALTER TABLE Candidate_Stack_Assignment
ADD FOREIGN KEY (Requirement_Id) REFERENCES Company_Requirement(id),
ADD FOREIGN KEY (Candidate_Id) REFERENCES User_Details(id);

show tables;
Desc user_details;
insert into user_details ( email, first_name, last_name, password, contact_number , verified, creator_stamp, creator_user)
values ('sahil@gmail.com', 'Sahil','Khandekar', 'sahil', '9082164605',true, now(), 1 ), 
('pranav@gmail.com', 'Pranav', 'Goyal', 'pranav','8928546001', false, now(), 2),
('prajwal@gmail.com', 'Prajwal', 'Thete', 'prajwal', '9082464605', true, now(), 3);
insert into user_details ( email, first_name, last_name, password, contact_number , verified, creator_stamp, creator_user)
values ('example@email.com', 'John', 'Doe', 'password123', '1234567890', TRUE, NOW(), 4),
('another@example.com', 'Jane', 'Smith', 'p@ssw0rd', '9876543210', FALSE, NOW(), 5),
('official@gmail.com', 'Jaya', 'Babar', 'hello', '9876549082', TRUE, NOW(), 6);
select * from user_details;
DESC Hired_Candidate;
INSERT INTO Hired_Candidate (Id, First_Name, Middle_Name, Last_Name, EmailId, Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode, Hired_Lab, Attitude, Communication_Remark, Knowledge_Remark, Aggregate_Remark, Status, Creator_Stamp, Creator_User)
VALUES
(1, 'Sahil', 'Anil', 'Khandekar', 'sahil@gmail.com', 'Mumbai', 'CS', '2019-02-22', '9082164605', '4500', 'Mumbai', 'Positive', 'Excellent communication', 'Strong technical', 'Excellent', 'Accepted', '2024-03-07 15:36:35', 1),
(2, 'Pranav', 'Ganesh', 'Goyal', 'pranav@gmail.com', 'Mumbai', 'CS', '2024-03-07', '8928546001', '3800', 'Mumbai', 'Positive', 'Fluent', 'Basic', 'Good', 'Pending', '2024-03-07 15:36:35', 2),
(3, 'Prajwal', 'Ramesh', 'Thete', 'prajwal@gmail.com', 'Pune', 'MCA', '2024-03-07', '9082464605', '6050', 'Mumbai', 'Neutral', 'Need improvement', 'Advance', 'Average', 'Accepted', '2024-03-07 15:36:35', 3),
(4, 'John', 'Viresh', 'Doe', 'example@email.com', 'Bangalore', 'MCA', '2022-03-07', '1234567890', '9080', 'Mumbai', 'Average', 'Good communication', 'Average', 'Weak', 'Rejected', '2024-03-07 15:46:18', 4),
(5, 'Jane', 'Justin', 'Smith', 'another@example.com', 'Mumbai', 'IT', '2023-03-07', '9876543210', '1646', 'Mumbai', 'Positive', 'Excellent communication', 'Strong technical', 'Excellent', 'Accepted', '2024-03-07 15:46:18', 5),
(6, 'Jaya', 'Brit', 'Babar', 'official@gmail.com', 'Pune', 'CS', '2022-03-07', '9876549082', '3201', 'Mumbai', 'Average', 'Fluent', 'Core knowledge', 'Average', 'Pending', '2024-03-07 15:46:18', 6);

select * from Hired_Candidate;
DESC fellowship_candidate;

INSERT INTO fellowship_candidate (
    Id, CIC_ID, First_Name, Middle_Name, Last_Name, EmailId, Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode, Hired_Lab, Attitude, Communication_Remark, Knowledge_Remark, Aggregate_Remark, 
    Creator_Stamp, Creator_User, Birth_Date, Is_Birth_Date_Verified, Parent_Name, Parent_Occupation, Parents_Mobile_Number, Parents_Annual_Salary, Local_Address, Permanent_Address, Photo_Path, 
    Joining_Date, Candidate_Status, Personal_Information, Bank_Information, Educational_Information, Document_Status, Remark
)
VALUES
(
    1, 'CIC123456', 'Sahil', 'Anil', 'Khandekar', 'sahil@gmail.com', 'Mumbai', 'CS', '2019-02-22', '9082164605', '4500', 'Mumbai', 'Positive', 'Excellent communication', 'Strong technical', 
'Excellent', '2024-03-07 15:36:35', 1, '2002-05-22', true, 'Anil Khandekar', 'Software Engineer', '9876543210', 80000.00, 'Mumbai, India', 'Mumbai, India', '/path/to/photo.jpg', 
    '2019-02-22', 'Active', 'Complete B.tech', 'Abhudaya co.op', 'Avg cgpa 9.31', 'Verified', 'All up to date'
),
(
    2, 'CIC789012', 'Pranav', 'Ganesh', 'Goyal', 'pranav@gmail.com', 'Mumbai', 'CS', '2024-03-07', '8928546001', '3800', 'Mumbai Lab', 'Positive', 'Fluent', 'Basic', 
    'Good', '2024-03-07 15:36:35', 2, '1994-07-20', true, 'Ganesh Goyal', 'Web Developer', '9876543210', 90000.00, 'Mumbai, India', 'Mumbai, India', '/path/to/photo.jpg', 
    '2024-03-07', 'Active', 'Stays in Colaba', 'HDFC bank', 'Btech from canada', 'Pending', 'All up to date'
),
(
    3, 'CIC345678', 'Prajwal', 'Ramesh', 'Thete', 'prajwal@gmail.com', 'Pune', 'MCA', '2024-03-07', '9082464605', '6050', 'Mumbai Lab', 'Neutral', 'Need improvement', 'Advance', 
    'Average', '2024-03-07 15:36:35', 3, '1996-10-25', true, 'Ramesh Thete', 'Software Engineer', '9876543210', 85000.00, 'Pune, India', 'Pune, India', '/path/to/photo.jpg', 
    '2024-03-07', 'Active', 'Loves trading', 'HDFC bank', 'CDAC', 'Verified', 'All good'
),
(
    4, 'CIC567890', 'John', 'Viresh', 'Doe', 'example@email.com', 'Bangalore', 'MCA', '2022-03-07', '1234567890', '9080', 'Mumbai Lab', 'Average', 'Good communication', 
    'Average', 'Weak', '2024-03-07 15:46:18', 4, '1995-03-12', true, 'Viresh Doe', 'Software Engineer', '9876543210', 75000.00, 'Bangalore, India', 'Bangalore, India', 
    '/path/to/photo.jpg', '2022-03-07', 'Inactive', 'Loves travelling', 'Abhudaya bank', 'Btech', 'Pending', 'All good'
),
(
    5, 'CIC234567', 'Jane', 'Justin', 'Smith', 'another@example.com', 'Mumbai', 'IT', '2023-03-07', '9876543210', '1646', 'Mumbai Lab', 'Positive', 'Excellent communication', 
    'Strong technical', 'Excellent', '2024-03-07 15:46:18', 5, '1994-09-30', true, 'Justin Smith', 'Web Developer', '9876543210', 85000.00, 'Mumbai, India', 'Mumbai, India', 
    '/path/to/photo.jpg', '2023-03-07', 'Active', 'loves singing', 'HDFC bank', 'CS', 'Verified', 'All good'
),
(
    6, 'CIC901234', 'Jaya', 'Brit', 'Babar', 'official@gmail.com', 'Pune', 'CS', '2022-03-07', '9876549082', '3201', 'Mumbai Lab', 'Average', 'Fluent', 'Core knowledge', 
    'Average', '2024-03-07 15:46:18', 6, '1993-12-05', true, 'Brit Babar', 'Software Engineer', '9876543210', 80000.00, 'Pune, India', 'Pune, India', '/path/to/photo.jpg', 
    '2022-03-07', 'Inactive', 'Mastercheaf', 'HDFC bank', 'MCA', 'Pending', 'All good'
);
select* from fellowship_candidate;
insert into candidate_bank_details (Id, Candidate_Id,Name, Account_Number, Is_Account_Num_Verified,Ifsc_Code,Is_Ifsc_Code_Verified,Pan_Number,
Is_Pan_Number_Verified,Aadhaar_Num,Is_Aadhaar_Num_Verified,Creator_Stamp,Creator_User)
values 
(
    1, 1, 'Sahil Khandekar', '1234567890', true, 'ABCD123456', true, 'ABCDE1234F', true, '123456789012', true, '2024-03-07 15:36:35', 1
),
(
    2, 2, 'Pranav Goyal', '2345678901', true, 'BCDE234567', true, 'BCDEF2345G', true, '234567890123', true, '2024-03-07 15:36:35', 2
),
(
    3, 3, 'Prajwal Thete', '3456789012', true, 'CDEF345678', true, 'CDEFG3456H', true, '345678901234', true, '2024-03-07 15:36:35', 3
),
(
    4, 4, 'John Doe', '4567890123', false, 'DEFG456789', false, 'DEFGH4567I', false, '456789012345', false, '2024-03-07 15:46:18', 4
),
(
    5, 5, 'Jane Smith', '5678901234', true, 'EFGH567890', true, 'EFGHI5678J', true, '567890123456', true, '2024-03-07 15:46:18', 5
),
(
    6, 6, 'Jaya Babar', '6789012345', true, 'FGHI678901', true, 'FGHIJ6789K', true, '678901234567', true, '2024-03-07 15:46:18', 6
);
INSERT INTO candidate_qualification (Id, Candidate_Id, Diploma, Degree_Name, Is_Degree_Name_Verified, Employee_Discipline, Is_Employee_Discipline_Verified, 
Passing_Year, Is_Passing_Year_Verified, Aggr_Per, Is_Aggr_Per_Verified, Final_Year_Per, Is_Final_Year_Per_Verified, Training_Institute, Is_Training_Institute_Verified, 
Training_Duration_Month, Is_Training_Duration_Month_Verified, Other_Training, Is_Other_Training_Verified, Creator_Stamp, Creator_User) 
values 
(
    1, 1, 'Computer Science', 'Bachelor of Technology', true, 'Computer Science', true, 2019, true, 75.50, true, 78.20, true, 'XYZ Institute', true, 12, true, 'Some other training', true, '2024-03-07 16:49:26', 1
),
(
    2, 2, 'Information Technology', 'Master of Science', true, 'Information Technology', true, 2024, true, 80.00, true, 82.50, true, 'ABC Training Center', true, 6, true, 'None', true, '2024-03-07 16:49:26', 2
),
(
    3, 3, 'Computer Applications', 'Bachelor of Computer Applications', true, 'Computer Applications', true, 2023, true, 70.00, true, 72.80, true, 'PQR Institute', true, 9, true, 'None', true, '2024-03-07 16:49:26', 3
),
(
    4, 4, 'MCA', 'MCA', true, 'MCA', true, 2022, true, 68.00, true, 70.50, true, 'DEF Training Academy', true, 8, true, 'Some other training', true, '2024-03-07 16:49:26', 4
),
(
    5, 5, 'Information Technology', 'Bachelor of Technology', true, 'Information Technology', true, 2021, true, 72.50, true, 75.00, true, 'MNO Institute', true, 10, true, 'Some other training', true, '2024-03-07 16:49:26', 5
),
(
    6, 6, 'Computer Science', 'Master of Computer Applications', true, 'Computer Science', true, 2020, true, 78.60, true, 80.00, true, 'GHI Training Center', true, 11, true, 'None', true, '2024-03-07 16:49:26', 6
);
INSERT INTO candidate_documents (Id, Candidate_Id, Doc_Type, Doc_Path, Status, Creator_Stamp, Creator_User) VALUES 
(1, 1, 'PAN', '/path/to/resume_sahil.pdf', 'received', '2024-03-07 16:49:26', 1), 
(2, 2, 'ADHAR', '/path/to/resume_pranav.pdf', 'received', '2024-03-07 16:49:26', 2), 
(3, 3, 'ADHAR', '/path/to/resume_prajwal.pdf', 'pending', '2024-03-07 16:49:26', 3), 
(4, 4, 'PAN', '/path/to/resume_john.pdf', 'received', '2024-03-07 16:49:26', 4), 
(5, 5, 'ADHAR', '/path/to/resume_jane.pdf', 'received', '2024-03-07 16:49:26', 5), 
(6, 6, 'PAN', '/path/to/resume_jaya.pdf', 'received', '2024-03-07 16:49:26', 6);

INSERT INTO company (Id, Name, Address, Location, Status, Creator_Stamp, Creator_User) VALUES 
(1, 'Company A', '123 Main St', 'Mumbai', 'Active', '2024-03-07 16:49:26', 1), 
(2, 'Company B', '456 Elm St', 'Bangalore', 'Active', '2024-03-07 16:49:26', 2), 
(3, 'Company C', '789 Oak St', 'Pune', 'Active', '2024-03-07 16:49:26', 3), 
(4, 'Company D', '101 Pine St', 'Mumbai', 'Active', '2024-03-07 16:49:26', 4), 
(5, 'Company E', '222 Maple St', 'Mumbai', 'Active', '2024-03-07 16:49:26', 5), 
(6, 'Company F', '333 Birch St', 'Pune', 'Active', '2024-03-07 16:49:26', 6);
SET SQL_SAFE_UPDATE = 0;
-- pending 000
INSERT INTO maker_program (Id, Program_Name, Program_Type, Program_Link, Tech_Stack_Id, Tech_Type_Id, Is_Program_Approved, Description, Status, Creator_Stamp, Creator_User) VALUES 
(1, 'Java', 'FullStack', 'https://example.com/java_full_stack_program', 1, 1, true, 'This program covers Java full stack development', 'Active', '2024-03-07 16:49:26', 1), 
(2, 'Java', 'FullStack', 'https://example.com/java_full_stack_program', 1, 1, true, 'This program covers Java with SpringBoot', 'Active', '2024-03-07 16:49:26', 2), 
(3, 'PHP', 'Back-end', 'https://example.com/java_full_stack_program', 3, 3, true, 'This program covers Angular', 'Active', '2024-03-07 16:49:26', 3), 
(4, 'Python', 'Back-end', 'https://example.com/java_full_stack_program', 4, 3, true, 'This program covers Java full stack development', 'Active', '2024-03-07 16:49:26', 4), 
(5, 'Angular', 'Back-end', 'https://example.com/java_full_stack_program', 5, 3, true, 'This program covers Java with SpringBoot', 'Active', '2024-03-07 16:49:26', 5), 
(6, 'Java', 'Back-end', 'https://example.com/java_full_stack_program', 1, 3, true, 'This program covers Angular', 'Active', '2024-03-07 16:49:26', 6);

select * from tech_stack;
INSERT INTO tech_stack (Tech_Name, Image_Path, Framework, Cur_Status, Creator_Stamp, Creator_User) VALUES 
('Java', '/path/to/java_image.png', 'Spring Boot', 'Active', '2024-03-07 17:28:32', 1),
('Java', '/path/to/mobile_image.png', 'React Native', 'Active', '2024-03-07 17:28:32', 2),
('PHP', '/path/to/php_image.png', 'Laravel', 'Active', '2024-03-07 17:28:32', 3),
('Python', '/path/to/python_image.png', 'Django', 'Active', '2024-03-07 17:28:32', 4),
('Angular', '/path/to/angular_image.png', 'AngularJS', 'Active', '2024-03-07 17:28:32', 5),
('Java', '/path/to/nodejs_image.png', 'Express.js', 'Active', '2024-03-07 17:28:32', 6);

select * from tech_type;
INSERT INTO tech_type (Type_Name, Cur_Status, Creator_Stamp, Creator_User) VALUES 
('FullStack', 'Active', '2024-03-07 17:28:32', 1),
('FullStack', 'Active', '2024-03-07 17:28:32', 2),
('Back-end', 'Active', '2024-03-07 17:28:32', 3),
('Back-end', 'Active', '2024-03-07 17:28:32', 4),
('Front-end', 'Active', '2024-03-07 17:28:32', 5),
('Back-end', 'Active', '2024-03-07 17:28:32', 6);

-- Insert values for all 6 users
INSERT INTO app_parameters (Key_Type, Key_Value, Key_Text, Cur_Status, Last_Upd_User, Last_Upd_Stamp, Creator_Stamp, Creator_User, Seq_Num) VALUES 
('DOC_STATUS', 'PND', 'Pending', 'ACTV', 1, NOW(), NOW(), 1, 1),
('DOC_STATUS', 'RCEVD', 'Received', 'ACTV', 2, NOW(), NOW(), 2, 2),
('CUR_STATUS', 'ACTV', 'Active', 'ACTV', 3, NOW(), NOW(), 3, 1),
('CUR_STATUS', 'IACTV', 'Inactive', 'ACTV', 4, NOW(), NOW(), 4, 1),
('BATCH_STATUS', 'INPROCESS', 'In Process', 'ACTV', 5, NOW(), NOW(), 5, 1),
('BATCH_STATUS', 'HOLD', 'Hold', 'ACTV', 6, NOW(), NOW(), 6, 2),
('BATCH_STATUS', 'COMPL', 'Completed', 'ACTV', 1, NOW(), NOW(), 1, 3);
select * from app_parameters;


-
-- Insert values for mentor table
INSERT INTO mentor (Name, Mentor_Type, Lab_Id, Status, Creator_Stamp, Creator_User) VALUES 
('John Doe', 'Main/Lead Mentor', 1, 'Active', NOW(), 1),
('Jane Smith', 'Practice Head', 2, 'Active', NOW(), 2),
('Alice Johnson', 'Support Mentor', 3, 'Active', NOW(), 3),
('Bob Williams', 'Buddy Mentor', 1, 'Active', NOW(), 4),
('John Doe', 'Main/Lead Mentor', 2, 'Active', NOW(), 5),
('Jane Smith', 'Practice Head', 3, 'Active', NOW(), 6);
select * from mentor;


INSERT INTO Lab (Id, Name, Location, Address, Status, Creator_Stamp, Creator_User) VALUES 
(1,'Mumbai', 'Mumbai', 'Address of Mumbai lab', 'Active', NOW(), 1),
(2,'Pune', 'Pune', 'Address of Pune lab', 'Active', NOW(), 2),
(3,'Bangalore', 'Bangalore', 'Address of Bangalore lab', 'Active', NOW(), 3),
(4,'Mumbai', 'Mumbai', 'Address of Mumbai lab', 'Active', NOW(), 4),
(5,'Pune', 'Pune', 'Address of Pune lab', 'Active', NOW(), 5),
(6,'Bangalore', 'Bangalore', 'Address of Bangalore lab', 'Active', NOW(), 6);
select * from lab;
DESC lab;
show tables ;
select * from tech_stack;

INSERT INTO lab_threshold (Id, Lab_Id, Lab_Capacity, Lead_Threshold, Ideation_Engg_Threshold, Buddy_Engg_Threshold, Status, Creator_Stamp, Creator_User) 
VALUES 
(1, 1, 50, 10, 8, 6, 'Active', now(), 1),
(2, 2, 60, 12, 9, 7, 'Active',now(), 2),
(3, 3, 70, 15, 10, 8, 'Active', now(), 3),
(4, 4, 55, 11, 8, 6, 'Active', now(), 4),
(5, 5, 45, 9, 7, 5, 'Active', now(), 5),
(6, 6, 65, 13, 10, 7, 'Active', now(), 6);
select * from lab_threshold;

INSERT INTO company_requirement (
    Id, Company_Id, Requested_Month, City, Is_Doc_Verification, Requirement_Doc_Path,
    No_of_Engg, Tech_Stack_Id, Tech_Type_Id, Maker_Program_Id, Lead_Id,
    Ideation_Engg_Id, Buddy_Engg_Id, Special_Remark, Status, Creator_Stamp, Creator_User
) 
VALUES 
    (1, 1, '2024-03-01', 'Mumbai', True, '/path/to/requirement_doc_1.pdf',
    10, 1, 1, 1, 1, 1, 3, 'Good in java', 'Active', '2024-03-08 10:00:00', 1),
    
    (2, 2, '2023-08-01', 'Banglore', false, '/path/to/requirement_doc_2.pdf',
    4, 1, 1, 2, 5, 2, 2, 'Good in java', 'Active', '2024-03-08 10:05:00', 2),
    
    (3, 3, '2024-01-01', 'Pune', true, '/path/to/requirement_doc_3.pdf',
    6, 3, 3, 3, 6, 3, 4, 'Good in php', 'Active', '2024-03-08 10:10:00', 3),
    
    (4, 4, '2022-01-01', 'Mumbai', true, '/path/to/requirement_doc_4.pdf',
    3, 4, 3, 4, 1, 4, 4, 'good in python', 'Active', '2024-03-08 10:15:00', 4),
    
    (5, 5, '2024-03-01', 'Pune', true, '/path/to/requirement_doc_5.pdf',
    7, 5, 3, 5, 5, 5, 4, 'Good in angular', 'Active', '2024-03-08 10:20:00', 5),
    
    (6, 6, '2024-03-01', 'Banglore', true, '/path/to/requirement_doc_6.pdf',
    4, 1, 3, 6, 1, 6, 4, 'Good in java', 'Active', '2024-03-08 10:25:00', 6);



INSERT INTO mentor_ideation_map (
    Id, Parent_Mentor_Id, Mentor_Id, Status, Creator_Stamp, Creator_User
) 
VALUES 
    (1, 1, 1, 'Active', '2024-03-08 10:30:00', 1),
    (2, 2, 2, 'Active', '2024-03-08 10:35:00', 2),
    (3, 3, 3, 'Active', '2024-03-08 10:40:00', 3),
    (4, 4, 4, 'Active', '2024-03-08 10:45:00', 4),
    (5, 5, 5, 'Active', '2024-03-08 10:50:00', 5),
    (6, 6, 6, 'Active', '2024-03-08 10:55:00', 6);
    
    INSERT INTO candidate_stack_assignment (
    Id, Requirement_Id, Candidate_Id, Assign_Date, Complete_Date, Status, Creator_Stamp, Creator_User
) 
VALUES 
    (1, 1, 1, '2023-07-01', '2024-03-15', 'Assigned', '2024-03-08 11:00:00', 1),
    (2, 2, 2, '2023-02-15', '2023-05-28', 'Completed', '2024-03-08 11:05:00', 2),
    (3, 3, 3, '2019-02-22', '2020-01-15', 'Assigned', '2024-03-08 11:10:00', 3),
    (4, 4, 4, '2020-02-28', '2021-01-01', 'Assigned', '2024-03-08 11:15:00', 4),
    (5, 5, 5, '2023-09-01', '2024-02-05', 'Assigned', '2024-03-08 11:20:00', 5),
    (6, 6, 6, '2024-03-01', '2024-05-01', 'Pending', '2024-03-08 11:25:00', 6);
select * from candidate_stack_assignment;
INSERT INTO mentor_tech_stack (
    Id, Mentor_Id, Tech_Stack_Id, Status, Creator_Stamp, Creator_User
) 
VALUES 
    (1, 1, 1, 'Active', now(), 1),
    (2, 2, 2, 'Active', now(), 2),
    (3, 3, 3, 'Active', now(), 3),
    (4, 4, 4, 'Active', now(), 4),
    (5, 5, 5, 'Active', now(), 5),
    (6, 6, 6, 'Active', now(), 6);
    

