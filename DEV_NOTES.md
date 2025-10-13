# Solar System App - Development Documentation

## Application Overview
- **Name:** Solar System
- **Version:** 6.7.6
- **Author:** Siddharth Barahalikar
- **Main File:** app.js
- **Framework:** Express.js
- **Database:** MongoDB (Mongoose 5.13.20)
- **Port:** 3000 (configurable via PORT env var)

## Quick Start
```bash
# Install dependencies
npm install

# Start MongoDB
docker run -d --name mongodb-local -p 27017:27017 mongo:6.0

# Start application
npm start

# Access app
open http://localhost:3000