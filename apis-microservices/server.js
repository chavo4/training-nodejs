'use strict';

var express = require('express');
var mongo = require('mongodb');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');
let dns = require('dns');

var cors = require('cors');

var app = express();

// Basic Configuration 
var port = process.env.PORT || 3000;
console.log(process.env.MONGO_URI)

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true })
mongoose.set('debug', true)
let db = mongoose.connection
db.on('error', console.error.bind(console, 'connection error:'))
db.once('open', dbActions)

function dbActions() {
    console.log("Successfully connected to MongoDB")
}

let urlSchema = new mongoose.Schema({
    original_url: { type: String },
    short_url: { type: String }
})

let urlModel = mongoose.model('url', urlSchema)

app.use(cors());

app.use(bodyParser.urlencoded({ extended: 'false' }));
app.use(bodyParser.json())

app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function(req, res) {
    res.sendFile(process.cwd() + '/views/index.html');
});

function saveUrl(urlObject, callback) {
    let urlToSave = new urlModel(urlObject)
    urlToSave.save(function(err, data) {
        if (err) console.log(err)
    })
}

function checkUrlInDatabase(urlObject, callback, res) {
    urlModel.findOne({ "original_url": urlObject.original_url }, function(err, data) {
        if (err) { console.log(err) }
        if (!data) {
            urlObject.short_url = generateId()
            saveUrl(urlObject)
            callback(urlObject, res)
        } else {
            urlObject.short_url = data.short_url
            callback(urlObject, res)
        }
    })
}

function sendResponse(urlObject, res) {
    res.json(urlObject)
}

function generateId() {
    let id = Date.now().toString().slice(-3)
    return id
}

app.post("/api/shorturl/new", function(req, res) {
    let original_url = req.body.url
    let hostname = new URL(original_url).hostname
    let short_url = "undefined";
    let urlObject = { "original_url": original_url, "short_url": short_url }

    dns.lookup(hostname, function(err, address) {
        if (err) {
            console.error("Wrong URL", err);
            res.json({ "error": "invalid URL" })
        } else {
            checkUrlInDatabase(urlObject, sendResponse, res)
        }
    })

});

app.get("/api/shorturl/:short_url", function(req, res, next) {
    let short_url = req.params.short_url
    if (/^\d{3}$/.test(short_url)) {
        urlModel.findOne({ "short_url": short_url }, function(err, data) {
            if (err) console.log(err)

            if (data) {
                res.redirect(data.original_url)
            } else {
                res.json({ "error": "no such short url in the database" })
            }

        })
    } else {
        res.json({ "error": "invalid short URL" })
    }
})

app.use(function(err, req, res, next) {
    console.log(err.stack)
    res.status(500).send("We've got an error!")
})

app.listen(port, function() {
    console.log('Node.js listening ...');
})