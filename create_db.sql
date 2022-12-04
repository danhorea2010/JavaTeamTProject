DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Recipe;
DROP TABLE IF EXISTS RecipeIngredients;
DROP TABLE IF EXISTS Ingredient;



CREATE TABLE [User] (
  [user_id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [username] NVARCHAR(25),
  [password] NVARCHAR(512),
  [session_id] NVARCHAR(500),
  [is_admin] INTEGER 
);

CREATE TABLE [Recipe] (
    [recipe_Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    [name] NVARCHAR(100),
    [calories] INTEGER,
    [user_id] INTEGER,
    [cuisine_type] NVARCHAR(100),

    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE [RecipeIngredients] (
    [recipe_ingredient_id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    [recipe_id] INTEGER,
    [ingredient_id] INTEGER,
    [measurement] NVARCHAR(20),

    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE [Ingredient] (
    [ingredient_id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    [name] NVARCHAR(100),
    [category] NVARCHAR(100)
);


