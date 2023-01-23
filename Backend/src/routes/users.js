const { Router } = require('express');
const router = Router();
const { faker } = require('@faker-js/faker');
const User = require('../models/User');

module.exports = router;


router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users});
});

router.get('/api/users/create', async (req, res) => {
    for (let i = 0; i <= 4; i++) {
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar()
        });
    }
    res.send({ message: "Successful" });
});

// Delete all users
router.get('/api/users/deleteAll', async (req, res) => {
    await User.deleteMany();
    res.send({ message: "Successful" });
});