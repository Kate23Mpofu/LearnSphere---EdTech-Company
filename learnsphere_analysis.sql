CREATE DATABASE LearnSphere;

USE LearnSphere;

-- confirm all imported tables are populated
SELECT 
    *
FROM
    students;

SELECT 
    *
FROM
    reviews;

SELECT 
    *
FROM
    enrollments;

SELECT 
    *
FROM
    instructors;

SELECT 
    *
FROM
    lookup_table;

SELECT 
    *
FROM
    courses;

-- analysis
--  How has student signups and enrollment volume trended over the last 3 years?
SELECT 
    year,
    SUM(signup_count) AS signups,
    SUM(enrollment_count) AS enrollments
FROM
    (SELECT 
        YEAR(signup_date) AS year,
            COUNT(*) AS signup_count,
            0 AS enrollment_count
    FROM
        students
    WHERE
        signup_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
            AND YEAR(signup_date) >= (SELECT 
                MAX(YEAR(signup_date)) - 2
            FROM
                students)
    GROUP BY YEAR(signup_date) UNION ALL SELECT 
        YEAR(enrollment_date) AS year,
            0 AS signup_count,
            COUNT(*) AS enrollment_count
    FROM
        enrollments
    WHERE
        enrollment_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
            AND YEAR(enrollment_date) >= (SELECT 
                MAX(YEAR(enrollment_date)) - 2
            FROM
                enrollments)
    GROUP BY YEAR(enrollment_date)) t
GROUP BY year
ORDER BY year;

-- Which course categories generate the most revenue, and which have the highest dropout rate?
-- highest revenue
SELECT 
    c.category,
    ROUND(SUM(e.amount_paid_zar), 2) AS total_revenue
FROM
    courses c
        LEFT JOIN
    enrollments e ON c.course_id = e.course_id
GROUP BY c.category
-- ORDER BY total_revenue DESC
LIMIT 3;

SELECT 
    c.category,
    ROUND(AVG(e.status = 'Dropped') * 100, 2) AS dropout_rate
FROM
    courses c
        JOIN
    enrollments e ON c.course_id = e.course_id
GROUP BY c.category
ORDER BY dropout_rate DESC
LIMIT 3;


-- What is the course completion rate overall, and which courses/instructors underperform?
-- overall course completion rate
SELECT 
    ROUND(AVG(status = 'Completed') * 100, 2) AS overall_course_completion_rate
FROM
    enrollments;

-- underperforming courses
SELECT 
    c.course_title,
    ROUND(AVG(e.status = 'Completed') * 100, 2) AS completion_rate
FROM
    courses c
        JOIN
    enrollments e ON c.course_id = e.course_id
GROUP BY c.course_title
HAVING completion_rate <= 30
ORDER BY completion_rate DESC;

--  Which signup source and device type bring in the most paying, completing students?
SELECT 
    s.device_type,
    s.signup_source,
    COUNT(*) AS paying_completed_students
FROM
    students s
        JOIN
    enrollments e ON s.student_id = e.student_id
WHERE
    e.status = 'Completed'
        AND e.amount_paid_zar > 0
GROUP BY s.device_type , s.signup_source
ORDER BY paying_completed_students DESC
LIMIT 1;

--  Which cities/provinces should LearnSphere target for marketing spend, based on enrollment and revenue?
-- What is the average student rating per course/instructor, and does it correlate with completion rate?
-- What % of enrollments used a discount (amount paid below course price), and how does that affect completion?
--  Who are the top 10 instructors by revenue generated and by average rating?
