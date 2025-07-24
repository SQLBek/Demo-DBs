
------------------------------------------------------
-- Generate vectors in chunks
-- Different tables in several query windows
------------------------------------------------------

-----
-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_steps (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM dbo.recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.steps, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_steps
    WHERE recipe_steps.recipe_id = recipes.recipe_id
)
GO 2000



-----
-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_ingredients (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM dbo.recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.ingredients, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_ingredients
    WHERE recipe_ingredients.recipe_id = recipes.recipe_id
)
GO 1000



-----
-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_ingredients_raw (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM dbo.recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.ingredients_raw, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_ingredients_raw
    WHERE recipe_ingredients_raw.recipe_id = recipes.recipe_id
)
GO 1000



-----
-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_tags (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM dbo.recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.tags, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_tags
    WHERE recipe_tags.recipe_id = recipes.recipe_id
)
GO 1000



-----
-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_description (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM dbo.recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.description, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_description
    WHERE recipe_description.recipe_id = recipes.recipe_id
)
GO 1000



--------------------------------------------------
-- Generate concatenated JSON for all shorter
-- valued columns
--------------------------------------------------
SELECT 
	recipe_id,
	(
		SELECT 
			name, 
			servings, 
			serving_size
		FOR JSON PATH
	) AS recipe_json
INTO #tmp_recipe_other_cols
FROM dbo.recipes;


-- ~62.5 min for 100,000 records 
INSERT INTO vectors.recipe_other_cols (
    recipe_id, chunk, chunk_order,
    chunk_offset, chunk_length, embedding
)
SELECT TOP 500
    recipes.recipe_id,
    chunk,
    chunk_order,
    chunk_offset,
    chunk_length, 
    AI_GENERATE_EMBEDDINGS(
            chunks.chunk USE MODEL ollama_nomic_embed_text
        ) AS embedding
FROM #tmp_recipe_other_cols AS recipes
CROSS APPLY AI_GENERATE_CHUNKS(
        source = recipes.recipe_json, 
        chunk_type = FIXED, 
        chunk_size = 200,
        overlap = 10
    ) AS chunks
WHERE NOT EXISTS (
    SELECT 1
    FROM vectors.recipe_other_cols
    WHERE recipe_other_cols.recipe_id = recipes.recipe_id
)
GO 10000

