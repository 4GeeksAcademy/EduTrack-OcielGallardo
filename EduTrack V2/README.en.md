# EduTrack V2 — Data audit (normalized schema)

Academic project for **4Geeks Academy**: SQL audit across related tables (`students`, `courses`, `enrollments`) using `JOIN`s.

[Versión en español](./README.md) · [V1 — flat table](../EduTrack%20V1/README.md)

## Author / contribution

| Role | Person |
| --- | --- |
| Author & data analyst | **Ociel Gallardo** |
| Platform | Supabase (SQL Editor) |
| Delivery repo | [4GeeksAcademy/EduTrack-OcielGallardo](https://github.com/4GeeksAcademy/EduTrack-OcielGallardo) |

## Goal

Answer business questions that require joining tables: enrollments, passers, average completion by instructor, inactive students/courses, revenue by category, and referential integrity.

## Exercise rules

- Every query uses **at least one `JOIN`**
- **No subqueries**
- ER diagram required before writing queries

## Deliverables

| File | Contents |
| --- | --- |
| `edutrack_v2.sql` | Official seed (local only; not pushed to GitHub) |
| `diagram.png` | Entity-relationship diagram |
| `queries.sql` | All 10 JOIN queries |
| `analysis_report.md` | Report with real query results |
| `README.md` / `README.en.md` | Documentation |

## How to reproduce

1. Download `edutrack_v2.sql` from the platform into this folder.
2. Run it fully in the Supabase SQL Editor.
3. Verify with: `SELECT * FROM students|courses|enrollments LIMIT 5;`
4. Model the ER diagram at [diagram.4geeks.com](https://diagram.4geeks.com) → export as `diagram.png`.
5. Complete `queries.sql` and fill `analysis_report.md`.

## Phases

| Phase | Focus | Queries |
| --- | --- | --- |
| 0 | Import + baseline + ER diagram | — |
| 1 | INNER JOIN | Q1–Q3 |
| 2 | LEFT JOIN (missing data) | Q4–Q5 |
| 3 | Cross-table aggregation | Q6–Q8 |
| 4 | Integrity (orphans) | Q9–Q10 |
| 5 | Report | `analysis_report.md` |

## Stack

- PostgreSQL / Supabase  
- SQL: `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `COUNT`, `AVG`, `SUM`

## License / context

Bootcamp training exercise (related tables). Not part of a commercial product.
