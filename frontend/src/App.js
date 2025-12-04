import React, { useState, useEffect } from 'react';
import './App.css';
import axios from 'axios';

function App() {
  const [apiInfo, setApiInfo] = useState(null);
  const [health, setHealth] = useState(null);
  const [error, setError] = useState(null);

  const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:3001';

  useEffect(() => {
    const fetchData = async () => {
      try {
        const healthRes = await axios.get(`${API_URL}/health`);
        setHealth(healthRes.data);

        const infoRes = await axios.get(`${API_URL}/api/info`);
        setApiInfo(infoRes.data);
      } catch (err) {
        setError('Impossible de contacter l API');
        console.error(err);
      }
    };

    fetchData();
  }, [API_URL]);

  return (
    <div className="App">
      <header className="App-header">
        <h1>Portfolio CI/CD</h1>
        <h2>Pipeline DevSecOps Complet</h2>

        <div className="status-container">
          <div className="status-card">
            <h3>Backend Status</h3>
            {error ? (
              <p className="error">{error}</p>
            ) : health ? (
              <>
                <p className="success">Status: {health.status}</p>
                <p>Environment: {health.environment}</p>
                <p className="timestamp">{new Date(health.timestamp).toLocaleString()}</p>
              </>
            ) : (
              <p>Chargement...</p>
            )}
          </div>

          <div className="status-card">
            <h3>API Info</h3>
            {apiInfo ? (
              <>
                <p><strong>{apiInfo.name}</strong></p>
                <p>Version: {apiInfo.version}</p>
                <p>Auteur: {apiInfo.author}</p>
              </>
            ) : (
              <p>Chargement...</p>
            )}
          </div>
        </div>

        <div className="tech-stack">
          <h3>Stack Technique</h3>
          <div className="tags">
            <span className="tag">React</span>
            <span className="tag">Node.js</span>
            <span className="tag">Azure AKS</span>
            <span className="tag">Terraform</span>
            <span className="tag">GitHub Actions</span>
            <span className="tag">Docker</span>
            <span className="tag">Trivy</span>
          </div>
        </div>
      </header>
    </div>
  );
}

export default App;
