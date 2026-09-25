# Law Firm Management Database

[🇫🇷 Version française](README.fr.md)

Academic database-design project (INF1096) : full modeling cycle for a law
firm — from the ER diagram to a normalized relational schema.

Academic project completed in French at Collège Boréal (Toronto)

## What was done

1. **ER modeling (Chen notation)** — 6 entities, 7 relationships, including
   two ternary relationships (`Jugement`, `Rendez_vous`).
2. **Cardinality review** — corrected `Represente` and `Rendez_vous`
   (1,1 → 1,N) and validated the ternary cardinalities with the
   fix-two-count-the-third method.
3. **Relational mapping** — 10 tables with primary/foreign keys.
   Subtle point handled: in the ternary `Jugement` relationship the
   `Tribunal` leg is (1,1), so it does not take part in the primary key —
   `(ID_avocat, ID_client)` identifies the row and `ID_tribunal` stays a
   simple foreign key.
4. **3NF normalization** — verified 1NF / 2NF / 3NF on every table
   (atomic vs multivalued attributes, partial and transitive dependencies).

## Files

- `schema.sql` — the complete schema (tables, keys, constraints)
- `docs/er-diagram.png` — the ER diagram (export it from draw.io)

## Run it

```bash
mysql -u root -p < schema.sql
```

## Skills shown

ER modeling, cardinality analysis, ternary relationships,
relational mapping, database normalization (1NF → 3NF), MySQL DDL.
