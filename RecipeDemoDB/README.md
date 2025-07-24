# RecipeDemoDB Documentation
Written By: Andy Yun<BR>
Created On: 07/18/2025

### Data Source (CSV):
https://www.kaggle.com/datasets/realalexanderwei/food-com-recipes-with-ingredients-and-tags

## Summary
This database is a SQL Server 2025 database with pre-generated vector embedding data, intended for demonstration of SQL Server 2025's vector search functionality.


## Vector Embedding Model
All vector embedding values were created using **nomic_embed_text**.  You must use this model or you must regenerate all vector embedding values in this database with your preferred model.  
<BR><BR>
Text was chunked at 200 character lengths with a 10 character overlap.  See 5_Generate Vector Embeddings via Chunks.sql for details.
<BR><BR>
For more information about using Ollama, see my quick start guide here:
https://sqlbek.wordpress.com/2025/05/19/ollama-quick-start/


## File Description
The following are the 'source files' used to create this database.  You can use this to review how this database was created.
1. 1_Create Database.sql
2. 2_Import Data to Staging Table.sql
3. 3_Create and Insert recipes table.sql
4. 4_Create vector embedding tables.sql
5. 5_Generate vector embeddings via chunks.sql
6. 6_Create External Model - Embedding.sql
7. 7_Create Database Master Key.sql

## Notes
Any code in the database backups will probably be outdated artifacts.  Please refer to [vector search repo] for the latest demo code.  

## MIT License

Copyright (c) 2025 Andy Yun
<BR><BR>
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
<BR><BR>
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
<BR><BR>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.