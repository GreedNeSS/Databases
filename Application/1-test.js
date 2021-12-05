'use strict';

const { Pool } = require('pg');

const pool = new Pool({
	host: '127.0.0.1',
	port: 5432,
	database: 'application',
	user: 'ruslan',
	password: 'ruslan'
});

const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
const sql = `SELECT ${fields} FROM pg_tables WHERE tableowner = $1`;
pool.query(sql, ['ruslan'], (err, res) => {
	if (err) {
		throw err;
	}
	console.dir({ res });
	console.table(res.fields);
	console.table(res.rows);
	console.log(res.rows);
	pool.end();
});
