-- open database.db
duckdb database.db

-- calculate average egg volume per nest
CREATE TEMP TABLE Averages AS
SELECT 
    Nest_ID, 
    AVG((4/3) * 3.14 * (Width / 2) * POWER((Length / 2), 2)) AS Avg_volume
FROM 
    Bird_eggs
GROUP BY 
    Nest_ID;
    
-- calculate maximum average egg volume for each species
SELECT 
    Species.Scientific_name,
    MAX(Averages.Avg_volume) AS Max_avg_volume
FROM 
    Bird_nests
JOIN 
    Averages USING (Nest_ID) -- join with Averages table
JOIN 
    Species ON Bird_nests.Species = Species.Code -- join with Species table
GROUP BY 
    Species.Scientific_name -- group by specific non-aggregated column
ORDER BY 
    Max_avg_volume DESC; -- list species in descending order of maximum volume

┌─────────────────────────┬────────────────────┐
│     Scientific_name     │   Max_avg_volume   │
│         varchar         │       double       │
├─────────────────────────┼────────────────────┤
│ Pluvialis squatarola    │  55222.92421810033 │
│ Pluvialis dominica      │  44362.72463732477 │
│ Arenaria interpres      │ 28254.786230102054 │
│ Calidris alpina         │ 16836.604020912946 │
│ Calidris fuscicollis    │ 15977.452637061775 │
│ Charadrius semipalmatus │  14954.49030766294 │
│ Phalaropus fulicarius   │ 12521.876601718157 │
└─────────────────────────┴────────────────────┘
