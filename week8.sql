-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table for Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    Name VARCHAR(255) NOT NULL,               -- Author Name
    DateOfBirth DATE                          -- Date of Birth
);

-- Table for Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,    -- Primary Key
    Title VARCHAR(255) NOT NULL,               -- Book Title
    ISBN VARCHAR(13) UNIQUE NOT NULL,          -- ISBN (Unique)
    YearPublished YEAR,                        -- Year Published
    AuthorID INT,                              -- Foreign Key to Authors
    CONSTRAINT FK_Author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Table for Patrons
CREATE TABLE Patrons (
    PatronID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary Key
    Name VARCHAR(255) NOT NULL,                 -- Patron Name
    Email VARCHAR(255) UNIQUE NOT NULL,         -- Patron Email (Unique)
    DateOfBirth DATE                            -- Date of Birth
);

-- Table for Borrowings (Many-to-Many relationship between Books and Patrons)
CREATE TABLE Borrowings (
    BorrowingID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    PatronID INT,                               -- Foreign Key to Patrons
    BookID INT,                                 -- Foreign Key to Books
    BorrowDate DATE NOT NULL,                   -- Date the book was borrowed
    ReturnDate DATE,                            -- Date the book was returned
    CONSTRAINT FK_Patron FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID),
    CONSTRAINT FK_Book FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Sample Insert Data into Authors
INSERT INTO Authors (Name, DateOfBirth) 
VALUES 
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25');

-- Sample Insert Data into Books
INSERT INTO Books (Title, ISBN, YearPublished, AuthorID) 
VALUES 
('Harry Potter and the Philosopher\'s Stone', '9780747532743', 1997, 1),
('1984', '9780451524935', 1949, 2);

-- Sample Insert Data into Patrons
INSERT INTO Patrons (Name, Email, DateOfBirth) 
VALUES 
('Alice Smith', 'alice.smith@example.com', '1990-05-15'),
('Bob Johnson', 'bob.johnson@example.com', '1985-08-22');

-- Sample Insert Data into Borrowings
INSERT INTO Borrowings (PatronID, BookID, BorrowDate, ReturnDate) 
VALUES 
(1, 1, '2025-05-10', '2025-05-20'),
(2, 2, '2025-05-12', '2025-05-22');
