var pg = require('pg');
var connectionString = process.env.DATABASE_URL || 'postgres://localhost:5432/healthtap';

var client = new pg.Client(connectionString);
client.connect();

var query = client.query('CREATE TABLE Events2(pid integer, event text, time timestamp)');

//var query = client.query('INSERT INTO EventTransitions(prev, event, count) values ($1, $2, $3)', ['A', 'B', 0]);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'C', '2016-09-23 12:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'A', '2016-09-23 12:24:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['2', 'C', '2016-09-23 2:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['2', 'A', '2016-09-23 1:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'B', '2016-09-23 9:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'C', '2016-09-23 4:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['2', 'A', '2016-09-23 10:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['2', 'C', '2016-09-23 2:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'A', '2016-09-23 8:21:13']);
var query = client.query('INSERT INTO Events2(pid, event, time) values ($1, $2, $3)', ['1', 'B', '2016-09-23 6:21:13']);
query.on('end', function() { client.end(); });