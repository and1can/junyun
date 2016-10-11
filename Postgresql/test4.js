var pg = require('pg');
var connectionString = process.env.DATABASE_URL || 'postgres://localhost:5432/healthtap';

var client = new pg.Client(connectionString);
client.connect();

var query = client.query('CREATE TABLE test4(pid integer, event text, time timestamp)');

//var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['A', 'B', 0]);
var query = client.query('INSERT INTO test4(pid, event, time) values ($1, $2, $3)', ['1', 'A', '2016-09-23 2:21:13']);
var query = client.query('INSERT INTO test4(pid, event, time) values ($1, $2, $3)', ['1', 'B', '2016-09-23 3:24:13']);
var query = client.query('INSERT INTO test4(pid, event, time) values ($1, $2, $3)', ['1', 'A', '2016-09-23 4:21:13']);
var query = client.query('INSERT INTO test4(pid, event, time) values ($1, $2, $3)', ['1', 'B', '2016-09-23 5:21:13']);

query.on('end', function() { client.end(); });