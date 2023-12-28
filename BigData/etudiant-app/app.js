const express = require('express');
const mongoose = require('mongoose');
const multer = require('multer');
const fs = require('fs').promises; // Use fs.promises for async file reading
const app = express();
const port = 3000;

// MongoDB Connection
mongoose.connect('mongodb://localhost:27017/etudiantDB', { useNewUrlParser: true, useUnifiedTopology: true });
const etudiantSchema = new mongoose.Schema({
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  age: { type: Number, required: true },
  className: { type: String, enum: ['DSI', 'MDW'], required: true },
});

const Etudiant = mongoose.model('Etudiant', etudiantSchema);

// Multer Configuration for File Uploads
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname);
  },
});
const upload = multer({ storage: storage });

// Express Middleware for Serving Static Files
app.use(express.static('public'));

// Express Middleware for Parsing JSON
app.use(express.json());

// Express Middleware for Rendering Views
app.set('view engine', 'ejs');
app.set('views', './views');

// Function to calculate statistics
async function calculateStatistics() {
  const statistics = await Etudiant.aggregate([
    {
      $group: {
        _id: '$className',
        count: { $sum: 1 },
      },
    },
  ]);
  return statistics;
}

// Define Routes
app.get('/', async (req, res) => {
  try {
    // Retrieve all étudiant data from MongoDB
    const etudiants = await Etudiant.find({});
    console.log('All Etudiants:', etudiants);

    // Calculate statistics
    const etudiantStatistics = await calculateStatistics();

    // Render the upload form with the list of etudiants and statistics
    res.render('upload', { etudiants, etudiantStatistics });
  } catch (error) {
    console.error('Error retrieving data from MongoDB:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.post('/upload', upload.single('file'), async (req, res) => {
  try {
    // Process the uploaded file and save étudiant data to MongoDB
    const filePath = req.file.path;
    console.log('File Path:', filePath);

    // Read the file content and log it
    const data = await fs.readFile(filePath, { encoding: 'utf8' });
    console.log('File Content:', data);

    // Parse the JSON data
    const etudiantData = JSON.parse(data);
    console.log('Parsed Etudiant Data:', etudiantData);

    // Save the data to MongoDB using async/await
    const etudiants = await Etudiant.create(etudiantData);
    console.log('Data saved to MongoDB:', etudiants);

    // Redirect to the root URL after a successful upload
    res.redirect('/');
  } catch (error) {
    console.error('Error processing file:', error);
    res.status(500).send(`Internal Server Error: ${error.message}`);
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});


app.post('/delete/:id', async (req, res) => {
  const etudiantId = req.params.id;

  try {
      const result = await Etudiant.findByIdAndDelete(etudiantId);

      if (!result) {
          console.error(`Etudiant with ID ${etudiantId} not found`);
          res.status(404).send('Not Found');
          return;
      }

      console.log('Etudiant deleted:', result);
      res.redirect('/');
  } catch (error) {
      console.error('Error deleting Etudiant:', error);
      res.status(500).send('Internal Server Error');
  }
});
