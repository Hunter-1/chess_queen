const Pool = require('pg').Pool
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'queen_game_database',
    password: 'ChessQueen',
    port: 5432,
})

const getUsers = (request, response) => {
    pool.query('SELECT * FROM users ORDER BY user_id ASC', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

const getUserByName = (request, response) => {
    const name = request.params.name
    pool.query('SELECT * FROM users WHERE username = $1', [name], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

const createUser = (request, response) => {
    const { name, password } = request.body
    pool.query('INSERT INTO users (username, user_password) VALUES ($1, $2)',
        [name, password], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`User added with ID: ${results.insertId}`)
    })
}

const deleteUser = (request, response) => {
    const id = parseInt(request.params.name)

    pool.query('DELETE FROM users WHERE user_id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).send(`User deleted with ID: ${id}`)
    })
}

const getScores = (request, response) => {
    pool.query('SELECT scores.moves, scores.secondspassed, scores.isqueen, users.username FROM scores' +
        ' INNER JOIN users ON scores.fk_user_id=users.user_id' +
        ' ORDER BY isqueen desc, moves, secondspassed', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

const createScore = (request, response) => {
    pool.query('INSERT INTO scores (moves, secondspassed, isqueen, fk_user_id) VALUES ($1, $2, $3, $4)',
        [moves, secondspassed, isquuen, user_id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`Score added with ID: ${results.insertId}`)
    })
}

module.exports = {
    getUsers,
    getUserByName,
    createUser,
    deleteUser,
    getScores,
    createScore
}