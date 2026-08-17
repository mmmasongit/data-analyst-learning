USE dc_intermediate_sql;

/*
Calculate the average budget from the films table, aliased as
avg_budget_thousands, and round to the nearest thousand.
*/
SELECT ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM dbo.films;