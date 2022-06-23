const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors({origin:'*'}))
// Settings
app.set('port', process.env.PORT || 5000);

// Middlewares
app.use(express.json());

// Routes
app.use(require('./routes/usuarios'))
app.use(require('./routes/alumnos'));
app.use(require('./routes/auth'));
// Starting the server
app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);
});
