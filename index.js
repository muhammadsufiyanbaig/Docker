const express = require('express');
const app = express();
const port = process.env.PORT || 8000;

app.get('/', (req, res) => {
    return res.json({message : 'Hello World! I am Node.js app running in Docker Container!'});
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
