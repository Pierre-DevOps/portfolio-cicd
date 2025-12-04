const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware de sécurité
app.use(helmet());
app.use(cors());
app.use(express.json());

// Route de santé
app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development'
  });
});

// Route API de base
app.get('/api/info', (req, res) => {
  res.json({
    name: 'Portfolio CI/CD API',
    version: '1.0.0',
    author: 'Pierre Baroni'
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
