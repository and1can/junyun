var pg = require('pg');
var connectionString = process.env.DATABASE_URL || 'postgres://localhost:5432/healthtap';

var client = new pg.Client(connectionString);
client.connect();

var query = client.query('CREATE TABLE EventTransitions(prev text, event text, count integer)');

//var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['A', 'B', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['A', 'C', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['B', 'A', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['B', 'C', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['C', 'A', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['C', 'B', 0]);
var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['A', 'B', 0]);
query.on('end', function() { client.end(); });

