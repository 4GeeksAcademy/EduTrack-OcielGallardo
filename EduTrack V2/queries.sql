-- ============================================================
-- EduTrack V2 — queries.sql (related tables / JOINs)
-- ============================================================
-- Seed: edutrack_v2.sql (local only — do not commit)
-- Rules:
--   - Every query must use at least one JOIN
--   - No subqueries
--   - Do not modify table structure; read-only analysis
-- ============================================================
-- Phase 0 baseline (fill after import):
--   students: ?
--   courses: ?
--   enrollments: ?
-- ============================================================


-- ============================================================
-- Phase 1 — INNER JOIN
-- ============================================================

-- Q1: All enrollments — student full name, course title, completion %
-- TODO: write SELECT with JOIN


-- Q2: Students who passed at least one course — name, email, course title
-- TODO: write SELECT with JOIN


-- Q3: Average completion_percentage by instructor, highest first
-- TODO: write SELECT with JOIN + GROUP BY + ORDER BY


-- ============================================================
-- Phase 2 — LEFT JOIN (missing data)
-- ============================================================

-- Q4: Students with no enrollments
-- TODO: write SELECT with LEFT JOIN


-- Q5: Courses with no enrollments
-- TODO: write SELECT with LEFT JOIN


-- ============================================================
-- Phase 3 — Aggregation across tables
-- ============================================================

-- Q6: Students enrolled in more than one course — name + course count
-- TODO: write SELECT with JOIN + GROUP BY + HAVING


-- Q7: Total revenue by category using courses.monthly_fee (not historical paid)
-- TODO: write SELECT with JOIN + SUM + GROUP BY


-- Q8: Each instructor with count of currently enrolled students
-- TODO: write SELECT with JOIN + GROUP BY


-- ============================================================
-- Phase 4 — Data integrity (orphans)
-- ============================================================

-- Q9: Enrollments whose student_id does not exist in students
-- TODO: write SELECT with LEFT JOIN + WHERE ... IS NULL


-- Q10: Enrollments whose course_id does not exist in courses
-- TODO: write SELECT with LEFT JOIN + WHERE ... IS NULL
