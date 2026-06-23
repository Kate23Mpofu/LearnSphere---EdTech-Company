CREATE DATABASE LearnSphere;

USE LearnSphere;

-- confirm all imported tables are populated
SELECT *
FROM students;

SELECT *
FROM reviews;

SELECT *
FROM enrollments;

SELECT *
FROM instructors;

SELECT *
FROM lookup_table;

SELECT *
FROM courses;

-- analysis
--  Which course categories generate the most revenue, and which have the highest dropout rate?
--  What is the course completion rate overall, and which courses/instructors underperform?
--  Which signup source and device type bring in the most paying, completing students?
--  Which cities/provinces should LearnSphere target for marketing spend, based on enrollment and revenue?
-- What is the average student rating per course/instructor, and does it correlate with completion rate?
-- What % of enrollments used a discount (amount paid below course price), and how does that affect completion?
--  Who are the top 10 instructors by revenue generated and by average rating?
