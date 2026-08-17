USE dc_intermediate_sql;

/*
Calculate the average facebook_likes to one decimal place and assign to the
alias, avg_facebook_likes.
*/
SELECT ROUND(AVG(facebook_likes),1) AS avg_facebook_likes
FROM dbo.reviews;