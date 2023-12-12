const admin = require('../config/firebase');
const bcrypt = require('bcryptjs');
const pool = require('../config/database'); // Menggunakan koneksi database dari database.js


const authController = {
  signup: async (request, h) => {
    const { email, username, password } = request.payload;

    try {
      const userRecord = await admin.auth().createUser({
        email,
        password,
      });

      const hashedPassword = await bcrypt.hash(password, 10);

      const userData = {
        email: userRecord.email,
        firebaseId: userRecord.uid,
        username,
        password: hashedPassword,
      };

      const connection = await pool.getConnection();
      const insertQuery = 'INSERT INTO users (userId, email, username, password) VALUES (?, ?, ?, ?)';
      const insertValues = [userData.firebaseId, userData.email, userData.username, userData.password];
      await connection.query(insertQuery, insertValues);
      connection.release();

      return h.response(`User created and saved to MySQL: ${userRecord.uid}`).code(201);
    } catch (error) {
      return h.response(error.message).code(500);
    }
  },

  login: async (request, h) => {
    try {
      const { idToken } = request.payload;

      const decodedToken = await admin.auth().verifyIdToken(idToken);
      const uid = decodedToken.uid;

      return h.response({ userId: uid }).code(200);
    } catch (error) {
      console.error('Error during login:', error);
      return h.response('Invalid credentials').code(401);
    }
  },
};

module.exports = authController;
