--------------------------------------------------
-- create dbo.recipes
--------------------------------------------------
DROP TABLE dbo.recipes
GO

CREATE TABLE dbo.recipes (
    recipe_id INT PRIMARY KEY CLUSTERED,
    name NVARCHAR(150),
    description NVARCHAR(MAX),
    ingredients NVARCHAR(4000),
    ingredients_raw NVARCHAR(4000),
    steps NVARCHAR(MAX),
    servings NVARCHAR(25),
    serving_size NVARCHAR(25),
    tags NVARCHAR(4000)
)

INSERT INTO dbo.recipes (
    recipe_id, name, description, ingredients, ingredients_raw,
    steps, servings, serving_size, tags
)
SELECT 
    id, name, description, ingredients, ingredients_raw,
    steps, servings, serving_size, tags
FROM recipes_ingredients_staging;
GO


