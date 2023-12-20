const Joi = require('@hapi/joi');
const authController = require('../controllers/authController')
const recipeController = require('../controllers/recipeController');
const ingredientsController = require('../controllers/ingredientController')
const favoriteController = require('../controllers/favoriteController')

const apiRoutes = [
  // API Info
  {
    method: 'GET',
    path: '/',
    handler: async (request, h) => {
      try {
        const welcomeMessage = 'Welcome to our Recipe API!'; 
        return h.response({ status : "success", message: welcomeMessage }).code(200);
      } catch (error) {
        return h.response({ error: 'Failed to retrieve homepage.' }).code(500);
      }
    }
  },
  {
    method: 'GET',
    path: '/api/v1',
    handler: async (request, h) => {
      try {
        const apiInfo = {
          name: 'Recipefy API',
          version: '1.0.0',
          description:
            'A RESTful API for managing recipes, ingredients, and favorites, providing endpoints for creating, updating, deleting, and searching recipes along with ingredient management and favorite functionality.'
        };
        return h.response(apiInfo).code(200);
      } catch (error) {
        return h.response({ error: 'Failed to retrieve API information.' }).code(500);
      }
    }
  },
  // API Auth
  {
    method: 'POST',
    path: '/signup',
    options: {
      payload: {
        multipart: true,
      },
      validate: {
        payload: Joi.object({
          email: Joi.string().allow('').label('email'),
          username: Joi.string().allow('').label('username'),
          password: Joi.string().allow('').label('password'),
        }),
        failAction: async (request, h, err) => {
          throw err;
        },
      },
    },
    handler: authController.signup,
  },
  {
    method: 'POST',
    path: '/login',
    handler: authController.login,
  },
  // API Recipes
  {
    method: 'POST',
    path: '/recipes',
    options: {
        payload: {
            output: 'stream',
            parse: true,
            allow: 'multipart/form-data',
            multipart: true,
            maxBytes: 10 * 1024 * 1024,
        },
        validate: {
            payload: Joi.object({
              name: Joi.string().allow('').label('name'),
              image: Joi.any().required(),
              note: Joi.string().allow('').label('note'),
              ingredients: Joi.array().items(Joi.string()).required().single(),
              tools: Joi.array().items(Joi.string()).required().single(),
              instructions: Joi.array().items(Joi.string()).required().single(),
              likes: Joi.number().integer().allow(null).label('likes'),
              }).options({ abortEarly: false }),
              failAction: async (request, h, err) => {
              throw err;
            },
        },
    },
    handler: recipeController.createRecipe,
  },
  {
    method: 'GET',
    path: '/recipes',
    handler: recipeController.getAllRecipes,
  },
  {
    method: 'GET',
    path: '/recipes/{recipesId}',
    options: {
      validate: {
        params: Joi.object({
          recipesId: Joi.string().required()
        })
      }
    },
    handler: recipeController.getRecipeById,
  },
  {
    method: 'PUT',
    path: '/recipes/{recipesId}',
    options: {
      payload: {
        output: 'stream',
        parse: true,
        allow: 'multipart/form-data',
        multipart: true,
        maxBytes: 10 * 1024 * 1024,
      },
      validate: {
        params: Joi.object({
          recipesId: Joi.string().required()
        }),
        payload: Joi.object({
            name: Joi.string().allow('').label('name'),
            image: Joi.any().optional(),
            note: Joi.string().allow('').label('note'),
            ingredients: Joi.array().items(Joi.string()).required().single(),
            tools: Joi.array().items(Joi.string()).required().single(),
            instructions: Joi.array().items(Joi.string()).required().single(),
            likes: Joi.number().integer().allow(null).label('likes'),
            }).options({ abortEarly: false }),
            failAction: async (request, h, err) => {
            throw err;
          },

      }
    },
    handler: recipeController.updateRecipeById,
  },
  {
    method: 'DELETE',
    path: '/recipes/{recipesId}',
    options: {
      validate: {
        params: Joi.object({
          recipesId: Joi.string().required()
        })
      }
    },
    handler: recipeController.deleteRecipeById,
  },
  {
    method: 'GET',
    path: '/search/{namaRecipe}',
    options: {
      validate: {
        params: Joi.object({
          namaRecipe: Joi.string().required()
        })
      }
    },
    handler: recipeController.searchRecipe,
  },
  // API Ingredient
  {
    method: 'GET',
    path: '/ingredients',
    handler: ingredientsController.getAllIngredient,
  },
  {
    method: 'POST',
    path: '/ingredients',
    options: {
        payload: {
            output: 'stream',
            parse: true,
            allow: 'multipart/form-data',
            multipart: true,
            maxBytes: 10 * 1024 * 1024,
        },
        validate: {
            payload: Joi.object({
              name: Joi.string().allow('').label('name'),
              image: Joi.any().required(),
              }).options({ abortEarly: false }),
              failAction: async (request, h, err) => {
              throw err;
            },
        },
    },
    handler: ingredientsController.createIngredient,
  },
  {
    method: 'PUT',
    path: '/ingredients/{id}',
    options: {
      payload: {
        output: 'stream',
        parse: true,
        allow: 'multipart/form-data',
        multipart: true,
        maxBytes: 10 * 1024 * 1024,
      },
      validate: {
        params: Joi.object({
          id: Joi.string().required()
        }),
        payload: Joi.object({
            name: Joi.string().allow('').label('name'),
            image: Joi.any().optional(),
            }).options({ abortEarly: false }),
            failAction: async (request, h, err) => {
            throw err;
          },

      }
    },
    handler: ingredientsController.updateRecipe,
  },
  {
    method: 'DELETE',
    path: '/ingredients/{id}',
    options: {
      validate: {
        params: Joi.object({
          id: Joi.string().required()
        })
      }
    },
    handler: ingredientsController.deleteIngredient,
  },
  {
    method: 'POST',
    path: '/filterIngredient',
    options: {
      validate: {
        payload: Joi.object({
          ingredients: Joi.array().items(Joi.string()).required().min(1).label('ingredients'),
        }),
        failAction: async (request, h, err) => {
          throw err;
        },
      },
    },
    handler: ingredientsController.filterIngredient,
  },
  // API Favorite
  {
    method: 'POST',
    path: '/favorite',
    options: {
      payload: {
        multipart: true,
      },
      validate: {
        payload: Joi.object({
          userId: Joi.string().allow('').label('userId'),
          recipeId: Joi.string().allow('').label('recipeId'),
        }),
        failAction: async (request, h, err) => {
          throw err;
        },
      },
    },
    handler: favoriteController.addFavorite,
  },
  {
    method: 'GET',
    path: '/favorite/{userId}',
    options: {
      validate: {
        params: Joi.object({
          userId: Joi.string().required(),
        }),
      },
    },
    handler: favoriteController.getFavorite,
  }


];

module.exports = apiRoutes;
