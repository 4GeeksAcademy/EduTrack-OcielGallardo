# EduTrack — Data audit report (Q3)

External data analyst review of the `enrollments` table before Q3 reporting.

## Phase 0 — Setup baseline

| Check | Result |
| --- | ---: |
| `enrollments` | 17 |
| `students` | 10 |
| `courses` | 7 |

**Schema used (enrollments):** `id`, `student_id`, `student_name`, `student_email`, `course_id`, `course_title`, `category`, `enrollment_date`, `completion_percentage`, `passed`, `monthly_fee_paid`, `instructor`

### Missing enrollment to INSERT (Q6)

Confirmed in email but never recorded (from `edutrack.sql` comments):

| Field | Value |
| --- | --- |
| id | 18 |
| student_id | 3 |
| student_name | Lucia Fernandes |
| student_email | lucia.fernandes@student.edutrack.com |
| course_id | 5 |
| course_title | Advanced Python |
| category | Programming |
| enrollment_date | 2025-04-01 |
| completion_percentage | 0 |
| passed | false |
| monthly_fee_paid | 69.99 |
| instructor | Carlos Vega |

---

## Inscripciones en 'Intro to Python'

Resultado: 5

- Emily Watson — emily.watson@student.edutrack.com — 85%
- Klaus Weber — klaus.weber@student.edutrack.com — 92%
- Marco Rossi — marco.rossi@student.edutrack.com — 88%
- James Miller — james.miller@test.com — 30%
- Priya Sharma — priya.sharma@student.edutrack.com — 55%

---

## Inscripciones con completion_percentage < 10

Resultado: 4

- Lucia Fernandes — 5%
- Lucia Fernandes — 3%
- Yuki Nakamura — 0%
- Pierre Dubois — 0%

---

## Inscripciones con instructor NULL

Resultado: 2

- Yuki Nakamura — UI/UX Fundamentals
- Pierre Dubois — UI/UX Fundamentals

---

## Top 5 no aprobados con mayor completion_percentage

Resultado:

1. Emily Watson — 60%
2. Priya Sharma — 55%
3. Yuki Nakamura — 45%
4. Emily Watson — 40%
5. James Miller — 30%

---

## Inscripciones del último año

Resultado: con `INTERVAL '1 year'` → **0** filas (la fecha más nueva del seed es 2025-03-05; el umbral cae en 2025-08).

Nota metodológica: en `queries.sql` se usó `INTERVAL '2 year'` para ampliar la ventana por la antigüedad de los datos.

---

## INSERT — inscripción faltante (id = 18)

Resultado: 1 fila insertada (Lucia Fernandes / Advanced Python / Programming / 2025-04-01). Total enrollments: 18.

---

## UPDATE — instructor NULL → 'Pending assignment'

Resultado: 2 filas actualizadas (ids 10 y 11 — Yuki Nakamura y Pierre Dubois).

---

## DELETE — cuentas @test.com

Resultado: 2 filas eliminadas (James Miller, Alex Chen). Total enrollments restante: 16.

---

## Inscripciones por categoría

Resultado:

- Marketing: 2
- Programming: 7
- Design: 4
- Data: 3

---

## Promedio de completado por course_title

Resultado (menor → mayor):

- UI/UX Fundamentals: 0
- Web Design Basics: 32.5
- Digital Marketing 101: 36.5
- Advanced Python: 45
- Data Analysis with SQL: ~47.67
- Intro to Python: 80

---

## Cursos con más de 3 inscripciones

Resultado:

- Intro to Python: 4

---

## Ingresos totales por categoría

Resultado (mayor → menor):

- Programming: 409.93
- Data: 179.97
- Design: 169.96
- Marketing: 59.98