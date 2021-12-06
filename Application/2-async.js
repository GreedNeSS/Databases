'use strict';

const { Pool } = require('pg');

const pool = new Pool({
	host: '127.0.0.1',
	port: 5432,
	database: 'application',
	user: 'ruslan',
	password: 'ruslan'
});

(async () => {
	const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
	const sql = `SELECT ${fields} FROM pg_tables WHERE tableowner = $1`;
	const { rows } = await pool.query(sql, ['ruslan']);
	console.table(rows);
	pool.end();
})();

const pool1 = new Pool({
	host: '127.0.0.1',
	port: 5432,
	database: 'application',
	user: 'ruslan',
	password: 'ruslan'
});

(async () => {
	const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
	const sql = `SELECT ${fields} FROM pg_tables;`;
	const { rows } = await pool1.query(sql);
	console.table(rows);
	pool1.end();
})();
