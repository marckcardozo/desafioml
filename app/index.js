// This line must come before importing the logger.
const tracer = require('dd-trace').init({
    logInjection: true
});

const { createLogger, exitOnError, format, transports } = require('winston'); 

const logger = createLogger({
    level: 'info',
    exitOnError: false,
    format: format.json(),
    transports:[
        new transports.File({ filename: `./logs/logz.log`}),
    ]
});
const express = require('express');
const PORT = 8080;
const app = express();
app.use(express.json());
const mysql = require('mysql2');
const db = mysql.createConnection({
    user: 'defiml',
    host: 'defiml.ccun5hhq8u6l.us-east-1.rds.amazonaws.com',
    password: 'Hagnar469425',
    database: 'mlm'
});






app.get('/', (req, res) => {
    logger.info("Success call")
    res.status(200).send("Hello World from México!");
 
});



app.get('/api/itens', (req, res) => {
    const { site_id} = req.headers;
    if (!site_id) {
        logger.error("invalid-header", req.headers);
        return res.status(400).end();
    }
    db.query('SELECT * FROM itens;',(err, result) => {
        if (err){
            res.status(400).json(err);
   
        } else {
            res.status(200).json(result);

        }        
    });
});

app.post('/api/itens', (req, res) => {

    const { site_id} = req.headers;
    if (!site_id) {
        logger.error("invalid-header", req.headers);
        return res.status(400).json({error: "Invalid-header"}).end();
    }

    const { product, name, category, origin } = req.body;
    if (!product || !name || !category || !origin){
        logger.error("invalid-parameter", req.body);
        return res.status(400).json({error: "invalid-parameter"}).end();
    }
    db.query('INSERT INTO itens (product, name, category, origin) VALUES (?,?,?,?);', [product, name, category, origin],
    (err, result) => {
        if (err){
            res.status(400).json(err);
   
        } else {
            res.status(200).json(result);
        }        
    });
});


app.listen(PORT, () => {
    console.log(`Server running on ${PORT}`);
});