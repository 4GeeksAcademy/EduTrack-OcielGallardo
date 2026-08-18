# EduTrack — Data audit (Q3)

Academic project for **4Geeks Academy**: SQL audit of the `enrollments` table on Supabase before the Q3 reporting cycle.

[Versión en español](./README.md)

## Author / contribution

| Role | Person |
| --- | --- |
| Author & data analyst | **Ociel Gallardo** |
| Platform | Supabase (SQL Editor) |
| Delivery repo | [4GeeksAcademy/EduTrack-OcielGallardo](https://github.com/4GeeksAcademy/EduTrack-OcielGallardo) |

Hands-on work: each query was written and run in Supabase, with results verified before documentation.

## Goal

Review and clean `enrollments` data quality (student–course enrollments): find dropouts, fix missing instructors, remove test accounts, insert a missing record, and compute metrics by category/course.

> Only `enrollments` is modified. Tables `students` and `courses` are left unchanged.

## Deliverables

| File | Contents |
| --- | --- |
| `edutrack.sql` | Official seed (create & populate the database) |
| `queries.sql` | All 12 audit queries |
| `analysis_report.md` | Written report with real results for the team |
| `README.md` / `README.en.md` | Project documentation |

## How to reproduce

1. Create a Supabase project.
2. In the SQL Editor, run the full `edutrack.sql` script (recommended: Run without RLS).
3. Verify with: `SELECT * FROM enrollments LIMIT 5;`
4. Run the queries in `queries.sql` in order (Phase 1 → 2 → 3).
5. Before any `UPDATE`/`DELETE`, always run a `SELECT` with the same `WHERE`.

### Baseline after seed (Phase 0)

| Table | Rows |
| --- | ---: |
| `enrollments` | 17 |
| `students` | 10 |
| `courses` | 7 |

## What was done (phases)

### Phase 1 — Read & filter

1. Enrollments for `Intro to Python` (name, email, completion %) → **5** rows  
2. Possible dropouts: `completion_percentage < 10` → **4** rows  
3. `instructor IS NULL` → **2** rows (UI/UX)  
4. Top 5 not passed (`passed = false`) by highest completion  
5. Recent enrollments by date (`ORDER BY enrollment_date DESC`)

### Phase 2 — Data corrections

6. `INSERT` of the missing enrollment (**id = 18**, Lucia Fernandes / Advanced Python)  
7. `UPDATE` null instructors → `'Pending assignment'` (**2** rows)  
8. `DELETE` `@test.com` emails (**2** rows) → **16** enrollments remain  

### Phase 3 — Aggregation

9. `COUNT(*)` by `category`  
10. `AVG(completion_percentage)` by `course_title` (ascending)  
11. Courses with more than 3 enrollments (`HAVING COUNT(*) > 3`) → Intro to Python (**4**)  
12. `SUM(monthly_fee_paid)` by `category` (descending)

### Key findings (after cleanup)

| Category | Enrollments | Revenue (`SUM monthly_fee_paid`) |
| --- | ---: | ---: |
| Programming | 7 | 409.93 |
| Design | 4 | 169.96 |
| Data | 3 | 179.97 |
| Marketing | 2 | 59.98 |

- Lowest average completion: **UI/UX Fundamentals** (0%)  
- Highest average: **Intro to Python** (80%)  
- Only course with &gt; 3 enrollments: **Intro to Python**

## Stack

- PostgreSQL / Supabase  
- SQL: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `INSERT`, `UPDATE`, `DELETE`, `GROUP BY`, `HAVING`, aggregates (`COUNT`, `AVG`, `SUM`)

## License / context

Bootcamp training exercise (Day 36 — data audit). Not part of a commercial product.
