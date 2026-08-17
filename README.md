# EduTrack — Auditoría de datos (Q3)

Proyecto académico de **4Geeks Academy**: auditoría SQL de la tabla `enrollments` en Supabase antes del ciclo de reportes del Q3.

[English version](./README.en.md)

## Autor / colaboración

| Rol | Persona |
| --- | --- |
| Autor y analista de datos | **Ociel Gallardo** |
| Plataforma | Supabase (SQL Editor) |
| Repo de entrega | [4GeeksAcademy/EduTrack-OcielGallardo](https://github.com/4GeeksAcademy/EduTrack-OcielGallardo) |

Trabajo realizado de forma práctica: escritura y ejecución de cada consulta en Supabase, con verificación de resultados antes de documentarlos.

## Objetivo

Revisar y limpiar la calidad de datos de `enrollments` (inscripciones student–curso): detectar abandonos, corregir instructors faltantes, eliminar cuentas de prueba, insertar un registro omitido y calcular métricas por categoría/curso.

> Solo se modifica `enrollments`. Las tablas `students` y `courses` no se alteran.

## Entregables

| Archivo | Contenido |
| --- | --- |
| `edutrack.sql` | Seed oficial (crear y poblar la base) |
| `queries.sql` | Las 12 consultas de la auditoría |
| `analysis_report.md` | Informe con resultados para compartir con el equipo |
| `README.md` / `README.en.md` | Documentación del proyecto |

## Cómo reproducir

1. Crear un proyecto en Supabase.
2. En el SQL Editor, ejecutar `edutrack.sql` completo (recomendado: Run without RLS).
3. Verificar: `SELECT * FROM enrollments LIMIT 5;`
4. Ejecutar las consultas de `queries.sql` en orden (Fase 1 → 2 → 3).
5. Antes de cualquier `UPDATE`/`DELETE`, correr un `SELECT` con el mismo `WHERE`.

### Baseline tras el seed (Fase 0)

| Tabla | Filas |
| --- | ---: |
| `enrollments` | 17 |
| `students` | 10 |
| `courses` | 7 |

## Qué se hizo (fases)

### Fase 1 — Lectura y filtrado

1. Inscripciones de `Intro to Python` (nombre, email, % completado) → **5** filas  
2. Posibles abandonos: `completion_percentage < 10` → **4** filas  
3. `instructor IS NULL` → **2** filas (UI/UX)  
4. Top 5 no aprobados (`passed = false`) por mayor completado  
5. Inscripciones recientes por fecha (`ORDER BY enrollment_date DESC`)

### Fase 2 — Corrección de datos

6. `INSERT` de la inscripción faltante (**id = 18**, Lucia Fernandes / Advanced Python)  
7. `UPDATE` de instructors `NULL` → `'Pending assignment'` (**2** filas)  
8. `DELETE` de emails `@test.com` (**2** filas) → quedan **16** inscripciones  

### Fase 3 — Agregación

9. `COUNT(*)` por `category`  
10. `AVG(completion_percentage)` por `course_title` (ascendente)  
11. Cursos con más de 3 inscripciones (`HAVING COUNT(*) > 3`) → Intro to Python (**4**)  
12. `SUM(monthly_fee_paid)` por `category` (descendente)

### Hallazgos clave (tras limpieza)

| Categoría | Inscripciones | Ingresos (`SUM monthly_fee_paid`) |
| --- | ---: | ---: |
| Programming | 7 | 409.93 |
| Design | 4 | 169.96 |
| Data | 3 | 179.97 |
| Marketing | 2 | 59.98 |

- Peor promedio de completado: **UI/UX Fundamentals** (0%)  
- Mejor promedio: **Intro to Python** (80%)  
- Único curso con &gt; 3 inscripciones: **Intro to Python**

## Stack

- PostgreSQL / Supabase  
- SQL: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `INSERT`, `UPDATE`, `DELETE`, `GROUP BY`, `HAVING`, agregaciones (`COUNT`, `AVG`, `SUM`)

## Licencia / contexto

Ejercicio formativo del bootcamp (Day 36 — data audit). No forma parte de un producto comercial.
