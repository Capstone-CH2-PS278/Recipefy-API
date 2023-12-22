
# Recipefy API Documentation
Welcome to the Recipefy API! This API allows you to manage recipes, ingredients, and favorites with various endpoints for creating, updating, deleting, and searching recipes, as well as managing ingredients and favorite recipes.

## Base URL
```bash
https://recipefy-dot-recipefy-407103.ue.r.appspot.com/
```


## Endpoints

#### Home

```http
  GET/
    Response: { status: "success", message: "Welcome to our Recipe API!" }
```

#### Authentication
- Signup

```http
  POST/signup
```

| Body | Type     |
| :-------- | :------- |
| `email`      | `string` |
| `username`      | `string` |
| `password`      | `string` |

Response: JSON object with user details or error message.

- Login

```http
  POST/login
```

| Body | Type     |
| :-------- | :------- |
| `username`      | `string` |
| `password`      | `string` |

#### Recipes
- Create Recipe

```http
  POST/recipes
```

| Body | Type     |
| :-------- | :------- |
| `name`      | `string` |
| `image`      | `file` |
| `note`      | `string` |
| `ingredients`      | `array of Strings` |
| `tools`      | `array of Strings` |
| `instructions`      | `Array of Strings` |
| `likes`      | `Integer` |

Response: Success message and recipe details.

- Get All Recipes
```http
  GET/recipes
```
Response: Array of all recipes.

- Get Recipe by ID
```http
  GET/recipes/{recipesId}
```
| Parameter | Type     |
| :-------- | :------- |
| `recipesId`      | `string` |

Response: Details of the specified recipe.

- Update Recipe
```http
  PUT/recipes/{recipesId}
```
| Parameter | Type     |
| :-------- | :------- |
| `recipesId`      | `string` |

| Body | Type     |
| :-------- | :------- |
| `name`      | `string` |
| `image`      | `file` |
| `note`      | `string` |
| `ingredients`      | `array of Strings` |
| `tools`      | `array of Strings` |
| `instructions`      | `Array of Strings` |
| `likes`      | `Integer` |

Response: Success message and updated recipe details.

- Delete Recipe
```http
  DELETE/recipes/{recipesId}
```
| Parameter | Type     |
| :-------- | :------- |
| `recipesId`      | `string` |

Response: Success message.

- Search Recipe
```http
  GET/search/{namaRecipe}
```
| Parameter | Type     |
| :-------- | :------- |
| `namaRecipe`      | `string` |

Response: Array of recipes matching the search criteria.

#### Ingredients
- Get All Ingredients
```http
  GET/ingredients
```
Response: Array of all ingredients.

- Create Ingredient
```http
  POST/ingredients
```
| Body | Type     |
| :-------- | :------- |
| `name`      | `string` |
| `image`      | `file` |

Response: Success message and ingredient details.

- Update Ingredient
```http
  POST/ingredients/{id}
```
| Parameter | Type     |
| :-------- | :------- |
| `id`      | `string` |

| Body | Type     |
| :-------- | :------- |
| `name`      | `string` |
| `image`      | `file` |

Response: Success message and updated ingredient details.

- Delete Ingredient
```http
  PUT/ingredients/{id}
```
| Parameter | Type     |
| :-------- | :------- |
| `id`      | `string` |

Response: Success message.

- Filter Ingredient
```http
  POST/filterIngredient
```
| Body | Type     |
| :-------- | :------- |
| `ingredients`      | `array of strings` |

Response: Array of recipes matching the ingredients.

#### Favorites
- Add Favorites
```http
  POST/favorite
```
| Parameter | Type     |
| :-------- | :------- |
| `userId`      | `string` |
| `recipeId`      | `string` |

Response: Success message.

- Get Favorites
```http
  GET/favorite/{userId}
```
| Parameter | Type     |
| :-------- | :------- |
| `userId`      | `string` |

Response: Array of favorite recipes for the user.
