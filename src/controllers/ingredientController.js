const pool = require('../config/database');
const { storage, bucketName } = require('../config/storage');
const { uploadImageToStorage } = require('../utils/imageUploader');

// Controller untuk operasi terkait Ingredient
const ingredientsController = {
  createIngredient: async (request, h) => {
    try {
      const {
        name,
        image,
      } = request.payload;

      if (!name) {
        const response = h.response({
          status: 'fail',
          message: 'Failed to add ingredient data. Please provide the ingredient name.',
        });
        response.code(400);
        return response;
      }

      if (!image || !image.hapi.filename) {
        return h.response({
          status: 'fail',
          message: 'Failed to add ingredient data. Please include the ingredient image.',
        }).code(400);
      }

      const imageUrl = await uploadImageToStorage(image, 'images/ingredient');
      const connection = await pool.getConnection();

      await connection.query('INSERT INTO data_ingredients (name_ingredient, image_url) VALUES (?, ?)', [name, imageUrl]);
      connection.release();

      return h.response({ status: 'success', message: 'Ingredient data has been successfully saved', imageUrl });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  getAllIngredient: async (request, h) => {
    try {
      const connection = await pool.getConnection();
      const [data] = await connection.query('SELECT * FROM data_ingredients');
      connection.release();

      return h.response({ status: 'success', ingredients: data });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  updateRecipe: async (request, h) => {
    try {
      const { id } = request.params;
      const {
        name,
        image,
      } = request.payload;

      const connection = await pool.getConnection();

      // Ambil data ingredients berdasarkan ID
      const [result] = await connection.query('SELECT * FROM data_ingredients WHERE id = ?', [id]);

      // Jika ingredients tidak ditemukan
      if (result.length === 0) {
        connection.release();
        return h.response({
          status: 'fail',
          message: 'Ingredients not found.',
        }).code(404);
      }

      let imageUrl = result[0].image_url;
      if (image) {
        if (imageUrl) {
          const fileName = imageUrl.split('/').pop();
          const bucket = storage.bucket(bucketName);
          const file = bucket.file(`images/ingredient/${fileName}`);
          await file.delete();
        }

        // Upload gambar baru ke Google Cloud Storage dan dapatkan URL baru
        imageUrl = await uploadImageToStorage(image, 'images/ingredient');
      }

      // Lakukan proses update nama resep ke database
      const [updateResult] = await connection.query('UPDATE data_ingredients SET name_ingredient = ?, image_url = ? WHERE id = ?', [name, imageUrl, id]);

      connection.release();

      // Jika tidak ada perubahan yang dilakukan
      if (updateResult.affectedRows === 0) {
        return h.response({
          status: 'fail',
          message: 'There are no changes in the ingredients data.',
        }).code(400);
      }

      return h.response({ status: 'success', message: 'Ingredient data successfully updated.' });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  deleteIngredient: async (request, h) => {
    try {
      const { id } = request.params;
      const connection = await pool.getConnection();

      // Cari data resep yang akan dihapus berdasarkan ID
      const [result] = await connection.query('SELECT * FROM data_ingredients WHERE id = ?', [id]);

      // Jika resep tidak ditemukan
      if (result.length === 0) {
        connection.release();
        return h.response({
          status: 'fail',
          message: 'Data ingredients not found.',
        }).code(404);
      }

      const imageUrl = result[0].image_url;

      // Hapus resep dari database berdasarkan ID
      await connection.query('DELETE FROM data_ingredients WHERE id = ?', [id]);
      connection.release();

      // Hapus gambar dari Google Cloud Storage
      if (imageUrl) {
        const fileName = imageUrl.split('/').pop(); // Dapatkan nama file dari URL gambar
        const bucket = storage.bucket(bucketName);
        const file = bucket.file(`images/ingredient/${fileName}`);
        await file.delete();
      }

      return h.response({ status: 'success', message: 'Ingredient data successfully deleted' });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  filterIngredient: async (request, h) => {
    try {
      const { ingredients } = request.payload;
      console.log(ingredients);
      const connection = await pool.getConnection();

      // Map kosong karena tidak digunakan secara langsung pada blok kode, hanya untuk kondisi SQL
      const conditions = ingredients.map(() => 'LOWER(ingredients) LIKE ?').join(' AND ');
      const queryString = `SELECT * FROM data_recipe WHERE ${conditions}`;
      const [data] = await connection.query(queryString, ingredients.map((ingredient) => `%${ingredient.toLowerCase()}%`));

      connection.release();

      return h.response({ status: 'success', recipes: data });
    } catch (error) {
      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },
};

module.exports = ingredientsController;
