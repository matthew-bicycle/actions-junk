import express, { Request, Response } from "express";

export const app = express();

app.get("/", (req: Request, res: Response) => {
  console.log(req);
  res.send("Request received!");
});
