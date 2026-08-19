-- ============================================================
-- EduTrack V2 — queries.sql (related tables / JOINs)
-- ============================================================
-- Seed: edutrack_v2.sql (local only — do not commit)
-- Rules:
--   - Every query must use at least one JOIN
--   - No subqueries
--   - Do not modify table structure; read-only analysis
--   - Prefer full table names (no aliases) while learning
-- ============================================================
-- Phase 0 baseline:
--   students: 8 | courses: 7 | enrollments: 16
-- ============================================================


-- ============================================================
-- Phase 1 — INNER JOIN
-- ============================================================

-- Q1: All enrollments — student full name, course title, completion %
SELECT students.name, courses.title, enrollments.completion_percentage
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id;


-- Q2: Students who passed at least one course — name, email, course title
SELECT students.name, students.email, courses.title
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id
WHERE enrollments.passed = true;


-- Q3: Average completion_percentage by instructor, highest first
SELECT courses.instructor_name, AVG(enrollments.completion_percentage)
FROM enrollments
JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.instructor_name
ORDER BY AVG(enrollments.completion_percentage) DESC;


-- ============================================================
-- Phase 2 — LEFT JOIN (missing data)
-- ============================================================

-- Q4: Students with no enrollments
SELECT students.name, students.email
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
WHERE enrollments.id IS NULL;


-- Q5: Courses with no enrollments
SELECT courses.id, courses.title, courses.category, courses.instructor_name
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
WHERE enrollments.id IS NULL;


-- ============================================================
-- Phase 3 — Aggregation across tables
-- ============================================================

-- Q6: Students enrolled in more than one course — name + course count
SELECT students.name, COUNT(*)
FROM students
JOIN enrollments ON students.id = enrollments.student_id
GROUP BY students.id, students.name
HAVING COUNT(*) > 1;


-- Q7: Total revenue by category using courses.monthly_fee (not historical paid)
SELECT courses.category, SUM(courses.monthly_fee)
FROM enrollments
JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.category
ORDER BY SUM(courses.monthly_fee) DESC;


-- Q8: Each instructor with count of currently enrolled students
SELECT courses.instructor_name, COUNT(DISTINCT enrollments.student_id)
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.instructor_name
ORDER BY COUNT(DISTINCT enrollments.student_id) DESC;


-- ============================================================
-- Phase 4 — Data integrity (orphans)
-- ============================================================

-- Q9: Enrollments whose student_id does not exist in students
SELECT enrollments.id, enrollments.student_id, enrollments.course_id
FROM enrollments
LEFT JOIN students ON enrollments.student_id = students.id
WHERE students.id IS NULL;


-- Q10: Enrollments whose course_id does not exist in courses
SELECT enrollments.id, enrollments.student_id, enrollments.course_id
FROM enrollments
LEFT JOIN courses ON enrollments.course_id = courses.id
WHERE courses.id IS NULL;
