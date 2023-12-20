const pool = require('../config/database');
const { uploadImageToStorage } = require('../utils/imageUploader');
const { storage, bucketName } = require('../config/storage');
const { nanoid } = require('nanoid');

const recipeController = {
  createRecipe: async (request, h) => {
    try {
      const {
          name,
          image, 
          note,
          ingredients,
          tools,
          instructions,
          likes,           
        } = request.payload;
      
      const id = nanoid(16);
      
      if (!name) {
        const response = h.response({
          status : 'fail',
          message : 'Failed to add recipe. Please provide the recipe name.',
        });
        response.code(400);
        return response;
      }

      if (!image || !image.hapi.filename) {
          return h.response({
            status: 'fail',
            message: 'Failed to add recipe. Please include the recipe image.',
          }).code(400);
      }             
      
      const imageUrl = await uploadImageToStorage(image, 'images/food');
      
      const connection = await pool.getConnection();
      await connection.query('INSERT INTO data_recipe (id, name, image_url, note, ingredients, tools, instructions, likes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', [id, name, imageUrl, note, ingredients, tools, instructions, likes]);
      connection.release();

      return h.response({ status: 'success', message: 'Recipe data successfully saved', imageUrl });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  getAllRecipes: async (request, h) => {
    try {
      const connection = await pool.getConnection();
      const [rows] = await connection.query('SELECT * FROM data_recipe');
      connection.release();

      return h.response({ status: 'success', recipes: rows });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
  }
  },

  getRecipeById: async (request, h) => {
    try {
      const { recipesId } = request.params;
      
      const connection = await pool.getConnection();
      const [result] = await connection.query('SELECT * FROM data_recipe WHERE id = ?', [recipesId]);
      connection.release();

      if (result.length === 0) {
        return h.response({
          status: 'fail',
          message: 'Recipe not found'
        }).code(404);
      }

      return h.response({ status: "success", recipe: result[0] });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  updateRecipeById: async (request, h) => {
    try {
      const { recipesId } = request.params;
      const {
        name,
        image,
        note,
        ingredients,
        tools,
        instructions,
        likes,
      } = request.payload;
  
      const connection = await pool.getConnection();
      
      // Ambil data resep berdasarkan ID
      const [result] = await connection.query('SELECT * FROM data_recipe WHERE id = ?', [recipesId]);
      
      // Jika resep tidak ditemukan
      if (result.length === 0) {
        connection.release();
        return h.response({
          status: 'fail',
          message: 'Recipe not found'
        }).code(404);
      }
      
      
      let imageUrl = result[0].image_url; // Gunakan URL gambar yang sudah ada jika tidak ada gambar baru yang diunggah
      if (image) {
        // Jika ada gambar baru diunggah, hapus gambar lama dari Google Cloud Storage
        if (imageUrl) {
          const fileName = imageUrl.split('/').pop();
          const bucket = storage.bucket(bucketName);
          const file = bucket.file(`images/food/${fileName}`);
          await file.delete();
        }
        
        
        // Upload gambar baru ke Google Cloud Storage dan dapatkan URL baru
        imageUrl = await uploadImageToStorage(image, 'images/food');;
      }
      

      // Lakukan proses update nama resep ke database
      const [updateResult] = await connection.query('UPDATE data_recipe SET name = ?, image_url = ?, note = ?, ingredients = ?, tools = ?, instructions = ?, likes = ? WHERE id = ?',
      [name, imageUrl, note, ingredients, tools, instructions, likes, recipesId]);

      connection.release();
  
      // Jika tidak ada perubahan yang dilakukan
      if (updateResult.affectedRows === 0) {
        return h.response({
          status: 'fail',
          message: 'No changes were made to the recipe'
        }).code(400);
      }
  
      return h.response({ status: 'success', message: 'Data resep berhasil diupdate' });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  deleteRecipeById: async (request, h) => {
    try {
      const { recipesId } = request.params;
  
      const connection = await pool.getConnection();
  
      // Cari data resep yang akan dihapus berdasarkan ID
      const [result] = await connection.query('SELECT * FROM data_recipe WHERE id = ?', [recipesId]);
  
      // Jika resep tidak ditemukan
      if (result.length === 0) {
        connection.release();
        return h.response({
          status: 'fail',
          message: 'Recipe not found'
        }).code(404);
      }
  
      const imageUrl = result[0].image_url;


      // Hapus gambar dari Google Cloud Storage
      if (imageUrl) {
      const fileName = imageUrl.split('/').pop(); // Dapatkan nama file dari URL gambar
      const bucket = storage.bucket(bucketName);
      const file = bucket.file(`images/food/${fileName}`);
      await file.delete();
      }

      // Hapus resep dari database berdasarkan ID
      await connection.query('DELETE FROM data_recipe WHERE id = ?', [recipesId]);
      connection.release();
  
      return h.response({ status: 'success', message: 'Recipe data successfully deleted' });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  searchRecipe :async (request, h) => {
    try {
      const { namaRecipe } = request.params;
      
      const connection = await pool.getConnection();
      const [data] = await connection.query('SELECT * FROM data_recipe WHERE name LIKE ?', [`%${namaRecipe}%`]);
      connection.release();

      return h.response({ status: 'success', recipes: data });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  }
};

module.exports = recipeController;
