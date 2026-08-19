# EduTrack V2 — Data audit report (normalized schema)

External data analyst review after migration to related tables:
`students`, `courses`, `enrollments` (linked by foreign keys).

## Phase 0 — Setup baseline

| Table | Count |
| --- | ---: |
| `students` | 8 |
| `courses` | 7 |
| `enrollments` | 16 |

**ER diagram:** see `diagram.png` (export from [dbdiagram.io](https://dbdiagram.io/)).

### Schema notes (from seed / information_schema)

| Table | Primary key | Foreign keys | Columns | Notes |
| --- | --- | --- | --- | --- |
| `students` | `id` (integer) | — | `name` (varchar), `email` (varchar), `signup_date` (date) | One row per student |
| `courses` | `id` (integer) | — | `title` (varchar), `category` (varchar), `instructor_name` (varchar), `monthly_fee` (numeric) | Catalog + current price; instructor lives here |
| `enrollments` | `id` (integer) | `student_id` → `students.id`, `course_id` → `courses.id` | `enrollment_date` (date), `completion_percentage` (integer), `passed` (boolean), `monthly_fee_paid` (numeric) | Bridge table (n:m); progress/payment live here |

Relationships: `students` 1—n `enrollments`; `courses` 1—n `enrollments`; `students` n—m `courses` via `enrollments`.

---

## Q1 — Inscripciones (nombre, curso, completado)

Resultado: 16

| name            | title                  | completion_percentage |
| --------------- | ---------------------- | --------------------- |
| Emily Watson    | Intro to Python        | 85                    |
| Emily Watson    | Web Design Basics      | 60                    |
| Klaus Weber     | Intro to Python        | 92                    |
| Klaus Weber     | Data Analysis with SQL | 78                    |
| Lucia Fernandes | Web Design Basics      | 5                     |
| Lucia Fernandes | Digital Marketing 101  | 3                     |
| Marco Rossi     | Advanced Python        | 95                    |
| Marco Rossi     | Intro to Python        | 88                    |
| Yuki Nakamura   | Data Analysis with SQL | 45                    |
| Yuki Nakamura   | UI/UX Fundamentals     | 0                     |
| Pierre Dubois   | UI/UX Fundamentals     | 0                     |
| Priya Sharma    | Digital Marketing 101  | 70                    |
| Priya Sharma    | Intro to Python        | 55                    |
| Pierre Dubois   | Data Analysis with SQL | 20                    |
| Emily Watson    | Advanced Python        | 40                    |
| Lucia Fernandes | Advanced Python        | 0                     |

---

## Q2 — Estudiantes que aprobaron al menos un curso

Resultado: 6

| name         | email                               | title                  |
| ------------ | ----------------------------------- | ---------------------- |
| Emily Watson | <emily.watson@student.edutrack.com>   | Intro to Python        |
| Klaus Weber  | <klaus.weber@student.edutrack.com>    | Intro to Python        |
| Klaus Weber  | <klaus.weber@student.edutrack.com>    | Data Analysis with SQL |
| Marco Rossi  | <marco.rossi@student.edutrack.com>    | Advanced Python        |
| Marco Rossi  | <marco.rossi@student.edutrack.com>    | Intro to Python        |
| Priya Sharma | <priya.sharma@student.edutrack.com>   | Digital Marketing 101  |

---

## Q3 — Promedio de completado por instructor

Resultado: 4 instructors

| instructor_name    | avg  |
| ------------------ | ---: |
| Marta López        | ~66.14 |
| Carlos Vega        | 40.00 |
| Lucia Prades       | 36.50 |
| Pending assignment | 0.00 |

---

## Q4 — Estudiantes sin ninguna inscripción

Resultado: 1

| name          | email                              |
| ------------- | ---------------------------------- |
| Giulia Romano | <giulia.romano@student.edutrack.com> |

---

## Q5 — Cursos sin ninguna inscripción

Resultado: 1

| id | title           | category  | instructor_name |
| -- | --------------- | --------- | --------------- |
| 7  | Email Campaigns | Marketing | Lucia Prades    |

---

## Q6 — Estudiantes inscritos en más de un curso

Resultado: 7

| name            | count |
| --------------- | ----: |
| Lucia Fernandes | 3     |
| Emily Watson    | 3     |
| Yuki Nakamura   | 2     |
| Marco Rossi     | 2     |
| Pierre Dubois   | 2     |
| Klaus Weber     | 2     |
| Priya Sharma    | 2     |

---

## Q7 — Ingresos totales por categoría (`courses.monthly_fee`)

Resultado: 4 categories (precio actual × cada inscripción)

| category    | sum    |
| ----------- | -----: |
| Programming | 409.93 |
| Data        | 179.97 |
| Design      | 169.96 |
| Marketing   | 59.98  |

---

## Q8 — Instructores y número de estudiantes inscritos

Resultado: 4 instructors (`COUNT(DISTINCT student_id)`)

| instructor_name    | student_count |
| ------------------ | ------------: |
| Marta López        | 6             |
| Carlos Vega        | 3             |
| Lucia Prades       | 2             |
| Pending assignment | 2             |

---

## Q9 — Inscripciones huérfanas (student_id inválido)

Resultado: 0 (ninguna inscripción con `student_id` inexistente)

---

## Q10 — Inscripciones huérfanas (course_id inválido)

Resultado: 0 (ninguna inscripción con `course_id` inexistente)
