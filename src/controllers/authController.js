const bcrypt = require('bcryptjs');
const admin = require('../config/firebase');
const pool = require('../config/database');

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
      const insertValues = [
        userData.firebaseId,
        userData.email,
        userData.username,
        userData.password,
      ];
      await connection.query(insertQuery, insertValues);
      connection.release();

      return h.response({ status: 'success', userId: userRecord.uid }).code(201);
    } catch (error) {
      if (error.code === 'auth/email-already-exists') {
        return h.response({ status: 'fail', message: 'Email is already registered' }).code(400);
      }

      return h.response({ status: 'fail', message: error.message }).code(500);
    }
  },

  login: async (request, h) => {
    try {
      const { idToken } = request.payload;

      const decodedToken = await admin.auth().verifyIdToken(idToken);
      const { uid } = decodedToken.uid;

      return h.response({ status: 'success', userId: uid }).code(200);
    } catch (error) {
      console.error('Error during login:', error);
      return h.response({ status: 'fail', message: 'Invalid credentials' }).code(401);
    }
  },
};

module.exports = authController;
