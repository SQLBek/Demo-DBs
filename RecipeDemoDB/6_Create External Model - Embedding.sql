------------------------------------------------------
-- Create external model
-- 
-- Using nomic_embed_text on ollama running on
-- local machine
--
-- ** CHANGE YOUR LOCATION VALUE TO YOUR OLLAMA URL **
------------------------------------------------------
USE RecipesDemoDB
GO

DROP EXTERNAL MODEL ollama_nomic_embed_text
GO


CREATE EXTERNAL MODEL ollama_nomic_embed_text
WITH (
	/* CHANGE YOUR LOCATION VALUE TO YOUR OLLAMA URL */
    LOCATION = 'https://192.168.1.160:443/api/embed',
    API_FORMAT = 'Ollama',
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'nomic-embed-text'
);
GO

-- Verify
SELECT *
FROM sys.external_models;
GO