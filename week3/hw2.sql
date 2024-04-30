------------
-- PART 1
------------

-- open database.db
duckdb database.db

-- SELECT Site_name, MAX(Area) FROM Site;
-- This is an incorrect SQL query because you need to use a GROUP BY function to select a specific non-aggregated column (like Site_name) and an aggregated column (like MAX(Area))
-- Without a GROUP BY function, the query cannot use the relationship between Site_name and MAX(Area) to figure out which Site_name to return.

------------
-- PART 2
------------

-- find the site name and area of the site having the largest area
SELECT Site_name, Area
FROM Site
ORDER BY Area DESC -- order by descending area
LIMIT 1; -- only return 1 observation (largest area)

┌──────────────┬────────┐
│  Site_name   │  Area  │
│   varchar    │ float  │
├──────────────┼────────┤
│ Coats Island │ 1239.1 │
└──────────────┴────────┘

------------
-- PART 3
------------

-- use nested query to first find the maximum area and then the site(s) that have this area
SELECT Site_name, Area
FROM Site
WHERE Area = (SELECT MAX(Area) FROM Site);

┌──────────────┬────────┐
│  Site_name   │  Area  │
│   varchar    │ float  │
├──────────────┼────────┤
│ Coats Island │ 1239.1 │
└──────────────┴────────┘