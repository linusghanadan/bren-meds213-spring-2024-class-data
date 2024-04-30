------------
-- PART 1
------------

-- open database.db
duckdb database.db

-- create table "Pets" with a single column "count"
CREATE TEMP TABLE Pets (
    count REAL -- specify "count" contains real numbers
);

-- add observations to "count" column
INSERT INTO Pets (count) VALUES
(1),
(2),
(1),
(NULL),
(3);

-- query average count
-- if the function ignores NULL values, the answer will be 1.75
-- if the function treates NULL values as 0s, the answer will be 1.4
SELECT AVG(count) AS average_count FROM Pets;
-- function returns 1.75, meaning it ignores NULL values
┌───────────────┐
│ average_count │
│    double     │
├───────────────┤
│          1.75 │
└───────────────┘

------------
-- PART 2
------------

-- query average count without AVG function
SELECT SUM(count)/COUNT(count) FROM Pets;
-- you must use "COUNT(count)" in the denominator and not "COUNT(*)" because using "COUNT(*)" will return the count of all rows (including ones that contains NULL values)
┌─────────────────────────────┐
│ (sum(count) / count(count)) │
│           double            │
├─────────────────────────────┤
│                        1.75 │
└─────────────────────────────┘

-- delete table
DROP TABLE Pets;
