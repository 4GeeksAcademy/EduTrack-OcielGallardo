-- ============================================================
-- EduTrack — queries.sql (Day 36 data audit)
-- ============================================================
-- Work only on `enrollments`. Do not modify `students` or `courses`.
-- Before any UPDATE/DELETE: run a SELECT with the same WHERE.
--
-- Baseline after seed (Phase 0):
--   enrollments: 17 | students: 10 | courses: 7
-- ============================================================


-- ------------------------------------------------------------
-- PHASE 0 NOTE — Missing enrollment (from edutrack.sql comments)
-- Use these values in Q6 INSERT (id = 18). Do not run until Phase 2.
-- ------------------------------------------------------------
-- student_id             : 3
-- student_name           : Lucia Fernandes
-- student_email          : lucia.fernandes@student.edutrack.com
-- course_id              : 5
-- course_title           : Advanced Python
-- category               : Programming
-- enrollment_date        : 2025-04-01
-- completion_percentage  : 0
-- passed                 : false
-- monthly_fee_paid       : 69.99
-- instructor             : Carlos Vega


-- ============================================================
-- Phase 1 — Read / filter
-- ============================================================

-- Q1: Enrollments for course 'Intro to Python'
-- Show: student_name, student_email, completion_percentage
-- TODO: write SELECT
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

-- Q2: Possible dropouts — completion_percentage < 10
-- TODO: write SELECT
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE completion_percentage < 10 

-- Q3: Enrollments where instructor IS NULL
-- TODO: write SELECT
SELECT student_name, student_email, course_title
FROM enrollments
WHERE instructor IS NULL

-- Q4: Top 5 highest completion_percentage among passed = false
-- TODO: write SELECT
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5

-- Q5: Enrollments created in the last year, newest first
-- TODO: write SELECT
SELECT student_name, student_email, enrollment_date
FROM enrollments
WHERE enrollment_date >= CURRENT_DATE - INTERVAL '2 year'
ORDER BY enrollment_date DESC

--Intenté con 2 años en vez de 1 porque la fecha mas nueva en la tabla estaba fuera del alcance del ejercicio y me dio: Exito. 0 filas devueltas.
-- ============================================================
-- Phase 2 — Data corrections
-- ============================================================

-- Q6: INSERT missing enrollment (id = 18) — values above
-- TODO: write INSERT
INSERT INTO enrollments (id , student_id, student_name, student_email, course_id, course_title, category, enrollment_date, completion_percentage, passed, monthly_fee_paid, instructor)
VALUES (18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com', 5, 'Advanced Python', 'Programming', '2025-04-01', 0, false, 69.99, 'Carlos Vega')


-- Q7: UPDATE NULL instructor → 'Pending assignment'
-- TODO: first SELECT with same WHERE, then UPDATE
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;


-- Q8: DELETE enrollments with @test.com emails
-- TODO: first SELECT with same WHERE, then DELETE

DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';

--comprobado a través de SELECT * 
SELECT COUNT(*) FROM enrollments;
-- devolvio 16 filas, como esperaba.
SELECT * FROM enrollments WHERE student_email LIKE '%@test.com';
-- devolvio 0 filas, como esperaba.

-- ============================================================
-- Phase 3 — Aggregation
-- ============================================================

-- Q9: Count enrollments grouped by category
-- TODO: write SELECT with GROUP BY
SELECT category, COUNT(*)
FROM enrollments
GROUP BY category;


-- Q10: Average completion_percentage by course_title, lowest first
-- TODO: write SELECT with GROUP BY + ORDER BY
SELECT course_title, AVG(completion_percentage)
FROM enrollments
GROUP BY course_title
ORDER BY AVG ASC


-- Q11: Courses with more than 3 enrollments (HAVING)
-- TODO: write SELECT with GROUP BY + HAVING
SELECT course_title, COUNT(*)
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3


-- Q12: Total revenue (SUM monthly_fee_paid) by category, highest first
-- TODO: write SELECT with GROUP BY + ORDER BY
SELECT category, SUM(monthly_fee_paid)
FROM enrollments
GROUP BY category
ORDER BY SUM DESC