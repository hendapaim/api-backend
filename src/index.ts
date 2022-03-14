import { PrismaClient } from "@prisma/client";
import express from "express";

//* Config
const port = process.env.PORT || 2021
const prisma = new PrismaClient();

const app = express();

//* midloware
app.use(express.json());

//* End-point
app.get("/api", async (req, res) => {
  res.json({ messege: "home page" });
});

app.get("/api/alunos", async (req, res) => {
  const alunos = await prisma.aluno.findMany();
  res.json(alunos);
});

app.listen(port, () =>
  console.log(`REST API server ready at: http://localhost:${port}`)
);
