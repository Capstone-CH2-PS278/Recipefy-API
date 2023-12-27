const { Storage } = require('@google-cloud/storage');
const path = require('path');

const keyStorage = path.join(__dirname, '../JSON/serviceAccountKey.json');

const storage = new Storage({
  projectId: 'recipefy-407103',
  keyFilename: keyStorage,
});
const bucketName = 'recipefy-407103.appspot.com';
module.exports = { storage, bucketName };
