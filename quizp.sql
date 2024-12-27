-- Step 1: Create the database
CREATE DATABASE quiz;

-- Step 2: Select the database
USE quiz;

-- Step 3: Create the quiz_question table
CREATE TABLE quiz_question (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique identifier for the question
    question_text VARCHAR(255) NOT NULL,        -- Text of the question
    correct_answer VARCHAR(255) NOT NULL,       -- The correct answer to the question
    category VARCHAR(50) NOT NULL               -- Category of the question (e.g., Java, Python)
);

-- Step 4: Create the question_options table
CREATE TABLE question_options (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique identifier for the option
    question_id BIGINT NOT NULL,                -- Foreign key referencing the quiz_question table
    option_text VARCHAR(255) NOT NULL,          -- Text of the option
    FOREIGN KEY (question_id) REFERENCES quiz_question(id) ON DELETE CASCADE
);

-- Step 5: Insert data into the quiz_question table
INSERT INTO quiz_question (question_text, correct_answer, category) VALUES
    -- Java Questions
    ('What is the default value of a boolean variable in Java?', 'false', 'Java'),
    ('Which of these is not a Java feature?', 'Use of pointers', 'Java'),
    ('Which method is used to start a thread in Java?', 'start()', 'Java'),
    ('What is the size of an int data type in Java?', '4 bytes', 'Java'),
    ('Which keyword is used to inherit a class in Java?', 'extends', 'Java'),
    ('Which of the following is a marker interface?', 'Serializable', 'Java'),
    ('Which operator is used for bitwise AND in Java?', '&', 'Java'),
    ('What is the base class of all classes in Java?', 'java.lang.Object', 'Java'),
    ('Which package contains the Random class?', 'java.util', 'Java'),
    ('What does JVM stand for?', 'Java Virtual Machine', 'Java'),

    -- Python Questions
    ('Which data type is immutable in Python?', 'tuple', 'Python'),
    ('How do you start a comment in Python?', '#', 'Python'),
    ('What is the output of len([1, 2, 3])?', '3', 'Python'),
    ('What is the correct way to define a function in Python?', 'def', 'Python'),
    ('Which keyword is used to create a class in Python?', 'class', 'Python'),
    ('How do you import a module in Python?', 'import', 'Python'),
    ('What is the result of 3 ** 2 in Python?', '9', 'Python'),
    ('Which collection is unordered in Python?', 'set', 'Python'),
    ('What does the range() function return?', 'a sequence of numbers', 'Python'),
    ('How do you create a dictionary in Python?', '{}', 'Python'),

    -- JavaScript Questions
    ('Which type of language is JavaScript?', 'Scripting', 'JavaScript'),
    ('What is the correct syntax to create a function in JavaScript?', 'function', 'JavaScript'),
    ('How do you declare a variable in JavaScript?', 'var, let, or const', 'JavaScript'),
    ('Which symbol is used for comments in JavaScript?', '//', 'JavaScript'),
    ('What is the output of "2" + 2 in JavaScript?', '22', 'JavaScript'),
    ('What does NaN stand for?', 'Not a Number', 'JavaScript'),
    ('How do you write a loop in JavaScript?', 'for', 'JavaScript'),
    ('Which method adds an element to an array in JavaScript?', 'push()', 'JavaScript'),
    ('What is the correct way to write an array in JavaScript?', '[ ]', 'JavaScript'),
    ('Which object is used to interact with the HTML document in JavaScript?', 'document', 'JavaScript'),

    -- .NET Questions
    ('What does .NET stand for?', 'Network Enabled Technology', '.NET'),
    ('Which language is primarily used in .NET?', 'C#', '.NET'),
    ('What is the Common Language Runtime (CLR)?', 'A virtual machine for .NET', '.NET'),
    ('What is the base class of all classes in .NET?', 'System.Object', '.NET'),
    ('Which framework is used for web development in .NET?', 'ASP.NET', '.NET'),
    ('What does the GC in .NET stand for?', 'Garbage Collector', '.NET'),
    ('Which file format is used for .NET assemblies?', 'DLL', '.NET'),
    ('Which method is used to execute a .NET application?', 'Main()', '.NET'),
    ('What is the primary database access technology in .NET?', 'ADO.NET', '.NET'),
    ('What is the command-line interface for .NET called?', 'dotnet', '.NET');

-- Step 6: Insert data into the question_options table
INSERT INTO question_options (question_id, option_text) VALUES
    -- Java Options
    (1, 'true'), (1, 'false'), (1, 'null'), (1, '0'),
    (2, 'Object-Oriented'), (2, 'Use of pointers'), (2, 'Platform-independent'), (2, 'Multi-threaded'),
    (3, 'run()'), (3, 'start()'), (3, 'execute()'), (3, 'call()'),
    (4, '2 bytes'), (4, '4 bytes'), (4, '8 bytes'), (4, '16 bytes'),
    (5, 'implement'), (5, 'extends'), (5, 'inherits'), (5, 'super'),
    (6, 'Runnable'), (6, 'Serializable'), (6, 'Cloneable'), (6, 'Comparable'),
    (7, '|'), (7, '&'), (7, '^'), (7, '~'),
    (8, 'java.util.String'), (8, 'java.lang.Object'), (8, 'java.util.Object'), (8, 'java.lang.String'),
    (9, 'java.util'), (9, 'java.io'), (9, 'java.lang'), (9, 'java.net'),
    (10, 'Java Virtual Machine'), (10, 'Java Version Manager'), (10, 'Java Verification Model'), (10, 'None of the above'),

    -- Python Options
    (11, 'list'), (11, 'tuple'), (11, 'set'), (11, 'dictionary'),
    (12, '#'), (12, '//'), (12, '--'), (12, '/*'),
    (13, '2'), (13, '3'), (13, '4'), (13, 'None'),
    (14, 'function'), (14, 'def'), (14, 'define'), (14, 'func'),
    (15, 'object'), (15, 'class'), (15, 'define'), (15, 'module'),
    (16, 'import'), (16, 'include'), (16, 'use'), (16, 'require'),
    (17, '6'), (17, '9'), (17, '8'), (17, 'None'),
    (18, 'list'), (18, 'dictionary'), (18, 'set'), (18, 'tuple'),
    (19, 'a sequence of numbers'), (19, 'a list'), (19, 'a tuple'), (19, 'a generator'),
    (20, '()'), (20, '[]'), (20, '{}'), (20, 'None'),

    -- JavaScript Options
    (21, 'Scripting'), (21, 'Programming'), (21, 'Markup'), (21, 'None of these'),
    (22, 'function'), (22, 'Function'), (22, 'createFunction'), (22, 'None of these'),
    (23, 'var, let, or const'), (23, 'only var'), (23, 'only let'), (23, 'only const'),
    (24, '//'), (24, '#'), (24, '<!-- -->'), (24, '/* */'),
    (25, '22'), (25, '4'), (25, '"2 + 2"'), (25, 'NaN'),
    (26, 'Not a Number'), (26, 'Not an Object'), (26, 'Not Applicable'), (26, 'None of these'),
    (27, 'for'), (27, 'foreach'), (27, 'while'), (27, 'do-while'),
    (28, 'push()'), (28, 'add()'), (28, 'insert()'), (28, 'append()'),
    (29, '[ ]'), (29, '{ }'), (29, '( )'), (29, '< >'),
    (30, 'document'), (30, 'window'), (30, 'navigator'), (30, 'console'),

    -- .NET Options
    (31, 'Network Enabled Technology'), (31, 'New Enterprise Technology'), (31, 'Net Ecosystem'), (31, 'None of these'),
    (32, 'C#'), (32, 'VB.NET'), (32, 'F#'), (32, 'Java'),
    (33, 'A virtual machine for .NET'), (33, 'A runtime library for Java'), (33, 'A compiler for .NET'), (33, 'None of these'),
    (34, 'System.Object'), (34, 'System.Class'), (34, 'System.Base'), (34, 'None of these'),
    (35, 'ASP.NET'), (35, 'WPF'), (35, 'Silverlight'), (35, 'Windows Forms'),
    (36, 'Garbage Collector'), (36, 'Global Compiler'), (36, 'Global Constructor'), (36, 'None of these'),
    (37, 'DLL'), (37, 'EXE'), (37, 'APPX'), (37, 'None of these'),
    (38, 'Main()'), (38, 'Start()'), (38, 'Run()'), (38, 'Execute()'),
    (39, 'ADO.NET'), (39, 'Entity Framework'), (39, 'LINQ'), (39, 'None of these'),
    (40, 'dotnet'), (40, 'cmd'), (40, 'shell'), (40, 'None of these');
