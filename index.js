const express = require("express");

const app = express();
app.use(express.json());

app.post("/audit", async (req, res) => {
    console.log(req.body);

    // Save to database here

    res.status(200).json({
        success: true
    });
});

app.listen(3000);