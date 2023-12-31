const path = require('path');
const { Storage } = require('@google-cloud/storage');
const { bucketName } = require('../config/storage');

const serviceAccountKeyPath = path.join(__dirname, '..', 'JSON', 'serviceAccountKey.json');

const storage = new Storage({
  projectId: 'recipefy-407103',
  keyFilename: serviceAccountKeyPath,
});

async function uploadImageToStorage(file, folder) {
  const bucket = storage.bucket(bucketName);
  const gcsFileName = `${folder}/${Date.now()}_${file.hapi.filename}`;
  const fileOptions = {
    metadata: {
      contentType: file.hapi.headers['content-type'],
    },
  };

  const fileStream = bucket.file(gcsFileName).createWriteStream(fileOptions);
  return new Promise((resolve, reject) => {
    file.on('error', (err) => reject(err));
    file.pipe(fileStream)
      .on('error', (err) => reject(err))
      .on('finish', () => {
        const imageUrl = `https://storage.googleapis.com/${bucketName}/${gcsFileName}`;
        resolve(imageUrl);
      });
  });
}

module.exports = { uploadImageToStorage };
