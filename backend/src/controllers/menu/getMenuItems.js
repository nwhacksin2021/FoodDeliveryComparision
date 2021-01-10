async function getMenuItems (req, res, next) {
    const { id: restaurant_id } = req.params
    console.log('cheers')

    return res.json({payload: 'hey'})
}

module.exports = getMenuItems