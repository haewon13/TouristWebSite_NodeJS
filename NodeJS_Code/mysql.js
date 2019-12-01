var dbconfig   = require('./config/database.js');
var mysql = require('mysql');
var http = require('http');
var bodyParser=require('body-parser');
var express = require('express');
var app = express();
var session = require('express-session');

var server = app.listen(3000, function(){
    console.log("Express server has started on port 3000")
})

var connection = mysql.createConnection(dbconfig); 
connection.connect(function(err){
    if(!err) {
        console.log("Database is connected");
    } else {
        console.log("Error connecting database" + err);
    }
});

var router = require('./router/main')(app, connection, session,bodyParser);

app.set('views', __dirname + '/view');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);


app.use(express.static(__dirname+'/'));



