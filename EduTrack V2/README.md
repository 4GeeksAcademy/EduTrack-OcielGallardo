# EduTrack V2 — Auditoría de datos (esquema normalizado)

Proyecto académico de **4Geeks Academy**: auditoría SQL con tablas relacionadas (`students`, `courses`, `enrollments`) usando `JOIN`.

[English version](./README.en.md) · [V1 — tabla plana](../EduTrack%20V1/README.md)

## Autor / colaboración

| Rol | Persona |
| --- | --- |
| Autor y analista de datos | **Ociel Gallardo** |
| Plataforma | Supabase (SQL Editor) |
| Repo de entrega | [4GeeksAcademy/EduTrack-OcielGallardo](https://github.com/4GeeksAcademy/EduTrack-OcielGallardo) |

## Objetivo

Responder preguntas de negocio que requieren unir tablas: inscripciones, aprobados, promedios por instructor, cursos/estudiantes sin actividad, ingresos por categoría e integridad referencial.

## Reglas del ejercicio

- Cada consulta usa **al menos un `JOIN`**
- **Sin subconsultas**
- Diagrama E/R obligatorio antes de las queries

## Entregables

| Archivo | Contenido |
| --- | --- |
| `edutrack_v2.sql` | Seed oficial (local; no se sube a GitHub) |
| `diagram.png` | Diagrama entidad-relación |
| `queries.sql` | Las 10 consultas con JOINs |
| `analysis_report.md` | Informe con resultados reales |
| `README.md` / `README.en.md` | Documentación |

## Cómo reproducir

1. Descargar `edutrack_v2.sql` desde la plataforma y guardarlo en esta carpeta.
2. Ejecutarlo completo en el SQL Editor de Supabase.
3. Verificar: `SELECT * FROM students|courses|enrollments LIMIT 5;`
4. Modelar el E/R en [diagram.4geeks.com](https://diagram.4geeks.com) → exportar como `diagram.png`.
5. Completar `queries.sql` y rellenar `analysis_report.md`.

## Fases

| Fase | Contenido | Queries |
| --- | --- | --- |
| 0 | Import + baseline + diagrama E/R | — |
| 1 | INNER JOIN | Q1–Q3 |
| 2 | LEFT JOIN (faltantes) | Q4–Q5 |
| 3 | Agregación entre tablas | Q6–Q8 |
| 4 | Integridad (huérfanos) | Q9–Q10 |
| 5 | Informe | `analysis_report.md` |

## Stack

- PostgreSQL / Supabase  
- SQL: `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `COUNT`, `AVG`, `SUM`

## Licencia / contexto

Ejercicio formativo del bootcamp (tablas relacionadas). No forma parte de un producto comercial.
