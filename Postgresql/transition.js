var pg = require('pg');
var conenctionString = process.env.DATABASE_URL || 'postgres://localhost:5432/healthtap';

var client = new pg.Client(connectionString);
client.connect();

