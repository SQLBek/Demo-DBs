--------------------------------------------------
-- create vectors schema
--------------------------------------------------
CREATE SCHEMA vectors;
GO


--------------------------------------------------------
-- Create an embeddings table for recipe description
--------------------------------------------------------
DROP TABLE vectors.recipe_description
GO
CREATE TABLE vectors.recipe_description (
	recipe_description_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_description PRIMARY KEY CLUSTERED (
		recipe_description_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG,
	CONSTRAINT UNI_recipe_description UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO


--------------------------------------------------------
-- Create an embeddings table for recipe ingredients
--------------------------------------------------------
DROP TABLE vectors.recipe_ingredients
GO
CREATE TABLE vectors.recipe_ingredients (
	recipe_ingredients_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_ingredients PRIMARY KEY CLUSTERED (
		recipe_ingredients_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG,
	CONSTRAINT UNI_recipe_ingredients UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO


--------------------------------------------------------
-- Create an embeddings table for recipe ingredients raw
--------------------------------------------------------
DROP TABLE vectors.recipe_ingredients_raw
GO
CREATE TABLE vectors.recipe_ingredients_raw (
	recipe_ingredients_raw_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_ingredients_raw PRIMARY KEY CLUSTERED (
		recipe_ingredients_raw_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG,
	CONSTRAINT UNI_recipe_ingredients_raw UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO


--------------------------------------------------------
-- Create an embeddings table for recipe other columns
--------------------------------------------------------
DROP TABLE vectors.recipe_other_cols
GO
CREATE TABLE vectors.recipe_other_cols (
	recipe_other_cols_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_other_cols PRIMARY KEY CLUSTERED (
		recipe_other_cols_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG,
	CONSTRAINT UNI_recipe_other_cols UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO


--------------------------------------------------------
-- Create an embeddings table for recipe steps
--------------------------------------------------------
DROP TABLE vectors.recipe_steps
GO
CREATE TABLE vectors.recipe_steps (
	recipe_steps_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_steps PRIMARY KEY CLUSTERED (
		recipe_steps_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG,
	CONSTRAINT UNI_recipe_steps UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO


--------------------------------------------------------
-- Create an embeddings table for recipe tags
--------------------------------------------------------
DROP TABLE vectors.recipe_tags
GO
CREATE TABLE vectors.recipe_tags(
	recipe_tags_id INT IDENTITY(1,1) NOT NULL,
	recipe_id INT NULL,
	chunk_id INT NULL,
	embedding VECTOR(768) NULL,
	CONSTRAINT CK_recipe_tags PRIMARY KEY CLUSTERED (
		recipe_tags_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) ON VECTOR_FG,
	CONSTRAINT UNI_recipe_tags UNIQUE NONCLUSTERED (
		recipe_id ASC,
		chunk_id ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) 
	ON VECTOR_FG
) 
ON VECTOR_FG
GO




