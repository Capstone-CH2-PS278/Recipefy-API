const pool = require('../config/database');

const favoriteController = {
    addFavorite: async (request, h) => {
        try {
          const { userId, recipeId } = request.payload;
    
          const connection = await pool.getConnection();
          const [data] = await connection.query('SELECT * FROM favorites WHERE userId = ? AND recipeId = ?', [userId, recipeId]);
    
          if (data.length > 0) {
            // Jika data favorit sudah tersedia
            await connection.query('DELETE FROM favorites WHERE userId = ? AND recipeId = ?', [userId, recipeId]);
            connection.release();
    
            return h.response({ status: true, message: 'Recipe removed from favorites' });
          } else {
            // Jika data favorit belum tersedia
            await connection.query('INSERT INTO favorites (userId, recipeId) VALUES (?, ?)', [userId, recipeId]);
            connection.release();
    
            return h.response({ status: true, message: 'Recipe added to favorites' });
          }
        } catch (error) {
          return h.response({ status: "fail", message: error.message }).code(500);
        }
    },

    getFavorite: async (request,h) => {
        try {
          const { userId } = request.params;
    
          // Mendapatkan semua data favorit berdasarkan userId
          const connection = await pool.getConnection();
          const [favorites] = await connection.query('SELECT data_recipe.* FROM favorites JOIN data_recipe ON favorites.recipeId = data_recipe.id WHERE favorites.userId = ?', [userId]);
          connection.release();
    
          return h.response({ status: "success", favorite : favorites });
        } catch (error) {
          return h.response({ status: "fail", message: error.message }).code(500);
        }
    }
}

module.exports = favoriteController;