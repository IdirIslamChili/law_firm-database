# Base de données — Gestion d'un cabinet d'avocats

🇬🇧 [ English version](README.md)

Projet académique de conception de bases de données (INF1096) : cycle
complet de modélisation pour un cabinet d'avocats — du diagramme ER au
schéma relationnel normalisé.

*Projet académique réalisé en français au Collège Boréal (Toronto).*

## Travail réalisé

1. **Modélisation ER (notation Chen)** — 6 entités, 7 relations, dont deux
   relations ternaires (`Jugement`, `Rendez_vous`).
2. **Révision des cardinalités** — correction de `Represente` et
   `Rendez_vous` (1,1 → 1,N) et validation des cardinalités ternaires par
   la méthode « fixer deux, compter la troisième ».
3. **Passage au relationnel** — 10 tables avec clés primaires/étrangères.
   Point subtil traité : dans la relation ternaire `Jugement`, la patte
   `Tribunal` est en (1,1), donc elle ne participe pas à la clé primaire —
   `(ID_avocat, ID_client)` identifie la ligne et `ID_tribunal` reste une
   simple clé étrangère.
4. **Normalisation 3FN** — vérification 1FN / 2FN / 3FN sur chaque table
   (attributs atomiques vs multivalués, dépendances partielles et
   transitives).

## Fichiers

- `schema.sql` — le schéma complet (tables, clés, contraintes)
- `docs/er-diagram.png` — le diagramme ER (à exporter depuis draw.io)

## Exécution

```bash
mysql -u root -p < schema.sql
```

## Compétences démontrées

Modélisation ER, analyse des cardinalités, relations ternaires,
passage au relationnel, normalisation (1FN → 3FN), DDL MySQL.
