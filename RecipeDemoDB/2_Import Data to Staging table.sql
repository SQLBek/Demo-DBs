USE RecipesDemoDB
GO

--------------------------------------------------
-- Import data
--
-- Used SSMS 21 to Import CSV file 
-- INTo recipes_ingredients_staging
--
-- CSV from here:
-- https://www.kaggle.com/datasets/realalexanderwei/food-com-recipes-with-ingredients-and-tags
--------------------------------------------------
SELECT *
FROM dbo.recipes_ingredients_staging;
GO



--------------------------------------------------
-- Analyze
--------------------------------------------------
EXEC sp_help recipes_ingredients_staging
GO


SELECT TOP (1000) id
      ,name
      ,description
      ,ingredients
      ,ingredients_raw
      ,steps
      ,servings
      ,serving_size
      ,tags
  FROM recipes_ingredients_staging
GO



SELECT COUNT(1)
    ,AVG(LEN(name)) AS name
    ,AVG(LEN(description)) AS description
    ,AVG(LEN(ingredients)) AS ingredients
    ,AVG(LEN(ingredients_raw)) AS ingredients_raw
    ,AVG(LEN(steps)) AS steps
    ,AVG(LEN(servings)) AS servings
    ,AVG(LEN(serving_size)) AS serving_size
    ,AVG(LEN(tags)) AS tags
FROM recipes_ingredients_staging
GO



SELECT COUNT(1)
    ,MAX(LEN(name)) AS name
    ,MAX(LEN(description)) AS description
    ,MAX(LEN(ingredients)) AS ingredients
    ,MAX(LEN(ingredients_raw)) AS ingredients_raw
    ,MAX(LEN(steps)) AS steps
    ,MAX(LEN(servings)) AS servings
    ,MAX(LEN(serving_size)) AS serving_size
    ,MAX(LEN(tags)) AS tags
FROM recipes_ingredients_staging
GO


--------------------------------------------------
-- Locate dupes to eliminate
--------------------------------------------------
SELECT ID, COUNT(1) AS num
INTO #tmpDupes
FROM recipes_ingredients_staging
GROUP BY ID
HAVING COUNT(1) > 1
GO


-----
-- Many dupes have ingredients = '' 
-- delete those
DELETE recipes_ingredients_staging
FROM #tmpDupes
INNER JOIN recipes_ingredients_staging
    ON #tmpDupes.id = recipes_ingredients_staging.id
WHERE ingredients = ''
GO

-----
-- A few dupes servings IS NULL
-- delete those
DELETE recipes_ingredients_staging
FROM #tmpDupes
INNER JOIN recipes_ingredients_staging
    ON #tmpDupes.id = recipes_ingredients_staging.id
WHERE servings IS NULL
GO

-----
-- A few dupes have ingredients_raw with four spaces 
-- delete those
DELETE recipes_ingredients_staging
FROM #tmpDupes
INNER JOIN recipes_ingredients_staging
    ON #tmpDupes.id = recipes_ingredients_staging.id
WHERE ingredients_raw LIKE '%    %'
GO


-----
-- Re-check dupes
DROP TABLE #tmpDupes

SELECT ID, COUNT(1) AS num
INTO #tmpDupes
FROM recipes_ingredients_staging
GROUP BY ID
HAVING COUNT(1) > 1

SELECT *
FROM #tmpDupes;
GO
