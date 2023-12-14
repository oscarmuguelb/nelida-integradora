const { query } = require('../../../utils/mysql');
const { save } = require('../user/user.gateway');
const { response, Router } = require('express');

const findAll = async () => {
    const sql = "SELECT * FROM Personal";
    return await query(sql, []);
};

const findById = async (id) => {
    if (Number.isNaN(id)) throw Error("Wrong Type");
    if (!id) throw Error("Missing fields");

    const sql = `SELECT * FROM Personal WHERE id = ?`;
    const result = await query(sql, [id]);

    const sqlUser = `SELECT * FROM User WHERE id= ? `;
    const result2 = await query(sqlUser, [result[0].user_fk]);

    return { ...result[0], user: result2[0] };
};

const findByUserId = async (userId) => {
    if (Number.isNaN(userId)) throw Error("Wrong Type");
    if (!userId) throw Error("Missing fields");

    const sql = `SELECT * FROM Personal WHERE user_fk = ?`;
    const result = await query(sql, [userId]);

    const sqlUser = `SELECT * FROM User WHERE id= ? `;
    const result2 = await query(sqlUser, [result[0].user_fk]);

    return { ...result[0], user: result2[0] };
};

const savePersonal = async (personal) => {
    const { user } = personal;

    if (!personal.name || !personal.birthday || !personal.address || !user.username || !user.password || !user.status || !user.roleId) {
        throw Error("missing fields");
    }

    const guardado = await save(user);

    const sql = `INSERT INTO Personal (name, birthday, address, status, user_fk) VALUES(?,?,?,?,?)`;
    const { insertedID } = await query(sql, [
        personal.name,
        personal.birthday,
        personal.address,
        1,
        guardado.id,
    ]);

    return { ...personal, id: insertedID };
};

module.exports = {
    findAll,
    findById,
    savePersonal,
    findByUserId
};