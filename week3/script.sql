-- Monday script

-- open database
duckdb database.db

-- look at tables
.tables

-- help for setting output mode
.help mode

-- look at head
SELECT * FROM Species LIMIT 5;

-- how many rows
SELECT COUNT(*) FROM Species;

-- how many non-null values in specific column
SELECT COUNT(Scientific_name) FROM Species;

-- how many distinct values in specific column
SELECT DISTINCT Species FROM Bird_nests;

-- ordering of results
SELECT DISTINCT Species FROM Bird_nests ORDER BY Species;

-- what distinct locations occur in the site table?
-- order them
-- limit to 3 results
SELECT DISTINCT Location FROM Site ORDER BY Location LIMIT 3;