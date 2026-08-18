# EduTrack V2 — Data audit report (normalized schema)

External data analyst review after migration to related tables:
`students`, `courses`, `enrollments` (linked by foreign keys).

## Phase 0 — Setup baseline

| Table | Count |
| --- | ---: |
| `students` | TODO |
| `courses` | TODO |
| `enrollments` | TODO |

**ER diagram:** see `diagram.png` (export from diagram.4geeks.com).

### Schema notes (fill after inspecting the seed)

| Table | Primary key | Foreign keys | Notes |
| --- | --- | --- | --- |
| `students` | TODO | — | TODO |
| `courses` | TODO | — | TODO |
| `enrollments` | TODO | TODO | TODO |

---

## Q1 — Inscripciones (nombre, curso, completado)

Resultado: TODO

---

## Q2 — Estudiantes que aprobaron al menos un curso

Resultado: TODO

---

## Q3 — Promedio de completado por instructor

Resultado: TODO

---

## Q4 — Estudiantes sin ninguna inscripción

Resultado: TODO

---

## Q5 — Cursos sin ninguna inscripción

Resultado: TODO

---

## Q6 — Estudiantes inscritos en más de un curso

Resultado: TODO

---

## Q7 — Ingresos totales por categoría (`courses.monthly_fee`)

Resultado: TODO

---

## Q8 — Instructores y número de estudiantes inscritos

Resultado: TODO

---

## Q9 — Inscripciones huérfanas (student_id inválido)

Resultado: TODO

---

## Q10 — Inscripciones huérfanas (course_id inválido)

Resultado: TODO
