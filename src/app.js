const express = require("express");
const app = express();
module.exports = app;

app.get("/", (req, res) => {
  console.log(req);
  res.send("Request received");
});
